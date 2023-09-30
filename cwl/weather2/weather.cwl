# CWL Version 1.2 Declaration
cwlVersion: v1.2

# CommandLineTool Class Declaration
class: CommandLineTool

# Base Command to Execute
baseCommand: ["curl", "wttr.in"]

# Define Inputs (empty in this case)
inputs: []

# Define Outputs
outputs:
  # Define an Output Parameter Named 'output_message'
  output_message:
    # Specify the Type of the Output as 'stdout'
    type: stdout

# Specify the Standard Output (stdout) File
stdout: output.txt
