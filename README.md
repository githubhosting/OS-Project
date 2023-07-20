## Bash Script to Extract Lines from a File

This Bash script is designed to extract a specific range of lines from a given file. It utilizes the `sed` command to achieve this functionality. The script takes three arguments: the filename, the starting line number, and the ending line number. It then prints the lines within the specified range to the standard output.

### Usage

1. Executing the script by running the following command:

```bash
./extract_lines.sh <filename> <start_line> <end_line>
```

Replace `<filename>`, `<start_line>`, and `<end_line>` with the appropriate values. Here's a brief explanation of each argument:

- `<filename>`: The name of the file from which lines will be extracted.
- `<start_line>`: The line number from which the extraction should start (inclusive).
- `<end_line>`: The line number at which the extraction should end (inclusive).

### Error Handling

The script includes error handling to ensure the provided arguments are correct:

- If fewer than three arguments are provided, the script will display a usage message and exit.
- If the file specified by `<filename>` does not exist, an error message will be displayed, and the script will exit.
- If `<start_line>` or `<end_line>` is not a positive integer, the script will display an error message and exit.
- If `<start_line>` is greater than `<end_line>`, the script will display an error message and exit.

### Example

Let's see an example of how to use the script:

Suppose we have a file named `file.txt` with the following content:

```
Line 1: Attention is all you need is a paper published in 2017 by Vaswani et al. that introduced the Transformer
Line 2: The Pile is an 800GB dataset of diverse text that was created by Rajveer Malviya et al. in 2021.
Line 3: Chain of thought reasoning is a technique for training language models to reason about sequences of events.
Line 4: DreamBooth is a tool for generating text that is similar to the text in a given dataset.
Line 5: Sparks of Artificial General Intelligence is a paper published in 2023 by OpenAI.
```

To extract lines 2 to 4 from `file.txt`, we would run:

```bash
./display_lines.sh file.txt 2 4
```

The output will be:

```
Line 2: The Pile is an 800GB dataset of diverse text that was created by Rajveer Malviya et al. in 2021.
Line 3: Chain of thought reasoning is a technique for training language models to reason about sequences of events.
Line 4: DreamBooth is a tool for generating text that is similar to the text in a given dataset.
```

### Note

- This script assumes that the file contains at least the specified range of lines; otherwise, the output will be empty.


## Code Explanation

```bash
#!/bin/bash
```
This line is called the shebang line. It specifies the interpreter that should be used to execute the script. In this case, we are using Bash as the interpreter.

```bash
if [[ $# -lt 3 ]]; then
    echo "Usage: $0 filename start_line end_line"
    exit 1
fi
```
This `if` statement checks the number of command-line arguments passed to the script using `$#`. If there are less than three arguments (filename, start_line, and end_line), it displays a usage message indicating how to use the script and exits with an exit code of 1, indicating an error.

```bash
filename="$1"
start_line="$2"
end_line="$3"
```
Here, we are assigning the command-line arguments to variables for better readability. `$1`, `$2`, and `$3` represent the first, second, and third command-line arguments, respectively. So, `filename` will hold the first argument, `start_line` will hold the second argument, and `end_line` will hold the third argument.

```bash
if ! [[ "$start_line" =~ ^[0-9]+$ ]] || ! [[ "$end_line" =~ ^[0-9]+$ ]]; then
    echo "Error: Line numbers should be positive integers."
    exit 1
fi
```
This `if` statement checks if `start_line` and `end_line` are positive integers using regular expressions. The `[[ ... ]]` construct is used for conditional tests in Bash. The `=~` operator is used for pattern matching. The pattern `^[0-9]+$` checks if the entire string is composed of one or more digits. If either `start_line` or `end_line` is not a positive integer, it prints an error message and exits with an exit code of 1.

```bash
if (( start_line > end_line )); then
    echo "Error: The starting line cannot be greater than the ending line."
    exit 1
fi
```
This `if` statement uses arithmetic evaluation (with `(( ... ))`) to check if `start_line` is greater than `end_line`. If it is, it prints an error message and exits with an exit code of 1.

```bash
if [[ ! -f "$filename" ]]; then
    echo "Error: File '$filename' not found."
    exit 1
fi
```
This `if` statement checks if the specified file (`$filename`) exists and is a regular file using the `-f` test. If the file does not exist or is not a regular file, it prints an error message and exits with an exit code of 1.

```bash
awk -v start="$start_line" -v end="$end_line" 'NR >= start && NR <= end' "$filename"
```
This line uses the `awk` command-line utility to read the contents of the file (`$filename`) and print the lines between `start_line` and `end_line` (inclusive). 

- `-v start="$start_line"` and `-v end="$end_line"` are used to pass the values of `start_line` and `end_line` as variables to `awk`.
- `'NR >= start && NR <= end'` is the `awk` code that filters the lines. `NR` represents the current line number being processed by `awk`. So, this code checks if the current line number (`NR`) is greater than or equal to `start` and less than or equal to `end`, and if it is true, it prints the line.

The resulting lines are displayed on the console, showing the content of the specified file between the given line numbers.
