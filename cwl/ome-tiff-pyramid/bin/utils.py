import re

OME_TIFF_PATTERN = re.compile(r'(?P<basename>.*)\.ome\.tif(f?)$')
