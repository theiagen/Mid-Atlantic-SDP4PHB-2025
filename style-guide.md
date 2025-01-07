# Style Guide

This style guide provides best practices and conventions for writing scripts hosted within this repostiroy.

## 1. Shebang Line

- Always start your script with the shebang line to specify the script's interpreter.

  ```bash
  #!/bin/bash
  ```

## 2. Comments

- Use comments to explain the purpose of the script, major steps, and any complex logic.
- Add a comment at the beginning of the script describing its purpose.
- Use inline comments sparingly to clarify specific lines of code.

  ```bash
  # Get the directory of the current script
  SCRIPT_DIR=$(dirname "$0")
  ```

## 3. Variables

- Use uppercase letters for variable names to distinguish them from commands and make them easily recognizable.
- Use meaningful variable names that convey their purpose.

  ```bash
  FASTQ_FILE=$1
  ```

## 4. Input Validation

- Always validate inputs to ensure the script behaves as expected.
- Provide clear and user-friendly error messages.
- Use `exit 1` to terminate the script if validation fails.

  ```bash
  if [ "$#" -ne 1 ]; then
      echo "Usage: $0 <fastq_file>"
      exit 1
  fi

  if [ ! -f "$FASTQ_FILE" ]; then
      echo "Error: File '$FASTQ_FILE' not found!"
      exit 1
  fi
  ```

## 5. Output Messages

- Use `echo` to display informative messages to the user.
- Clearly indicate the progress and results of the script's operations.

  ```bash
  echo "Processing FASTQ file: $FASTQ_FILE"
  ```

## 6. Commands and Calculations

- Use `$(...)` for command substitution instead of backticks for better readability and nesting.
- Break down complex calculations into smaller, understandable steps with comments.

  ```bash
  ## Count the number of lines in the FASTQ file
  LINE_COUNT=$(wc -l < "$FASTQ_FILE")
  ## Calculate the number of reads (4 lines per read)
  READ_COUNT=$((LINE_COUNT / 4))

  echo "Number of reads in $FASTQ_FILE: $READ_COUNT"
  ```

## 7. Indentation

- Use four spaces for indentation instead of tabs to ensure consistency across different editors and environments.

  ```bash
  if [ "$#" -ne 1 ]; then
      echo "Usage: $0 <fastq_file>"
      exit 1
  fi
  ```

## 8. Exiting the Script

- Use `exit 0` to explicitly indicate successful completion of the script, although it is not always necessary as Bash implicitly exits with the status of the last executed command.

## Example Script with Comments

```bash
#!/bin/bash

# This script processes a FASTQ file and counts the number of reads.

# Get the directory of the current script
SCRIPT_DIR=$(dirname "$0")

# Check if a FASTQ file is provided
if [ "$#" -ne 1]; then
    echo "Usage: $0 <fastq_file>"
    exit 1
fi

FASTQ_FILE=$1

# Check if the provided file exists
if [ ! -f "$FASTQ_FILE" ]; then
    echo "Error: File '$FASTQ_FILE' not found!"
    exit 1
fi

echo "Processing FASTQ file: $FASTQ_FILE"

# Count the number of reads in FASTQ file
## Count the number of lines in the FASTQ file
LINE_COUNT=$(wc -l < "$FASTQ_FILE")
## Calculate the number of reads (4 lines per read)
READ_COUNT=$((LINE_COUNT / 4))

echo "Number of reads in $FASTQ_FILE: $READ_COUNT"
```

Following this style guide will help ensure your scripts are easy to read, maintain, and understand by others.