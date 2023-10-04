#!/usr/bin/env python3
from argparse import ArgumentParser
from pathlib import Path
from subprocess import run
from typing import Optional

from utils import OME_TIFF_PATTERN

BIOFORMATS2RAW_COMMAND_TEMPLATE = [
    '/opt/bioformats2raw/bin/bioformats2raw',
    '{input_file}',
    '{n5_directory}',
    '--tile_width',
    '512',
    '--tile_height',
    '512',
    '--max_workers',
    '{processes}',
]
RAW2OMETIFF_COMMAND_TEMPLATE = [
    '/opt/raw2ometiff/bin/raw2ometiff',
    '{n5_path}',
    '{output_ometiff_file}',
    '--compression=zlib',
]
# Quick-and-dirty usage; this is more convenient than calling something
# like `os.walk` and feeding paths to the Python `zipfile` module
ZIP_N5_COMMAND = [
    'zip',
    '-r',
    '{zip_path}',
    '{n5_path}',
]

N5_RAW_BASE_DIRECTORY = Path('n5_raw')
N5_ZIP_BASE_DIRECTORY = Path('n5')
PYRAMID_BASE_DIRECTORY = Path('ometiff-pyramids')

def convert(
        ometiff_file: Path,
        relative_directory: str,
        processes: int,
        rgb: bool,
        downsample_type: Optional[str],
):
    m = OME_TIFF_PATTERN.match(ometiff_file.name)
    if not m:
        message = f'Filename did not match OME-TIFF pattern: {ometiff_file.name}'
        raise ValueError(message)
    basename = m.group('basename')

    n5_raw_parent_dir = N5_RAW_BASE_DIRECTORY / relative_directory
    n5_raw_parent_dir.mkdir(exist_ok=True, parents=True)
    n5_raw_dir = n5_raw_parent_dir / f'{basename}.n5'

    command = [
        piece.format(
            input_file=ometiff_file,
            n5_directory=n5_raw_dir,
            processes=processes,
        )
        for piece in BIOFORMATS2RAW_COMMAND_TEMPLATE
    ]
    if downsample_type is not None:
        command.append(f'--downsample-type={downsample_type}')
    print('Running', ' '.join(command))
    run(command, check=True)

    pyramid_parent_dir = PYRAMID_BASE_DIRECTORY / relative_directory
    pyramid_parent_dir.mkdir(exist_ok=True, parents=True)
    output_ometiff_filename = pyramid_parent_dir / f'{basename}.ome.tif'

    command = [
        piece.format(
            n5_path=n5_raw_dir,
            output_ometiff_file=output_ometiff_filename,
        )
        for piece in RAW2OMETIFF_COMMAND_TEMPLATE
    ]
    if rgb:
        command.append('--rgb')
    print('Running', ' '.join(command))
    run(command, check=True)

    n5_zip_parent_dir = N5_ZIP_BASE_DIRECTORY / relative_directory
    n5_zip_parent_dir.mkdir(exist_ok=True, parents=True)
    n5_zip_file = n5_zip_parent_dir / f'{basename}.n5.zip'

    command = [
        piece.format(
            n5_path=n5_raw_dir,
            zip_path=n5_zip_file,
        )
        for piece in ZIP_N5_COMMAND
    ]
    print('Running', ' '.join(command))
    run(command, check=True)

if __name__ == '__main__':
    p = ArgumentParser()
    p.add_argument('ometiff_file', type=Path)
    p.add_argument('relative_directory')
    p.add_argument('processes', type=int)
    p.add_argument('--rgb', action='store_true')
    p.add_argument('--downsample-type')
    args = p.parse_args()

    convert(
        args.ometiff_file,
        args.relative_directory,
        args.processes,
        args.rgb,
        args.downsample_type,
    )
