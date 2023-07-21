## Bash Script to Extract Lines from a File

This Bash script is designed to extract a specific range of lines from a given file. It utilizes the `sed` command to achieve this functionality. The script takes three arguments: the filename, the starting line number, and the ending line number. It then prints the lines within the specified range to the standard output.

### Usage

1. Executing the script by running the following command:

```bash
bash display_lines.sh <filename> <start_line> <end_line>
```

Here's a brief explanation of each argument:

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
bash display_lines.sh file.txt 2 4
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
This line is called the shebang line. It specifies the interpreter that should be used to execute the script. In this case, we are using Bash as the interpreter.To interpret and run the commands within the script. This indicates that the script should be interpreted using the Bash shell.

```bash
if [[ $# -lt 3 ]]; then
    echo "Usage: $0 filename start_line end_line"
    exit 1
fi
```
This is a conditional statement in a Unix shell script.
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
sed -n "${start_line},${end_line}p" "$filename"
```
Finally I used the `sed` Unix shell command. The `sed` command modifies lines from the specified *File* parameter according to an edit script and writes them to standard output. The sed command includes many features for selecting lines to be modified and making changes only to the selected lines. It can be used to perform a variety of operations on text, including searching, replacing, inserting, displaying and deleting. Here, we are using it to print a range of lines from a file and deleting the lines containing specific word.

1. `sed`: The command to invoke the stream editor.

2. `-n`: This option tells `sed` to suppress automatic printing of pattern space (lines). By default, `sed` prints each line after processing it, but with `-n`, it will only print explicitly specified lines.

3. `"${start_line},${end_line}p"`: This is the main operation provided to `sed`. This allows the variables `start_line` and `end_line` to be expanded. 

   - `${start_line},${end_line}`: This is a range of lines to process. These variables are declared and allocated the values using the command-line arguments.
  
   - `p`: This is the `sed` command that tells it to print the lines in the specified range.

4. `"$filename"`: This is the file from which `sed` reads the input.

So `sed` command will read the content of the file specified by `$filename` and print only the lines that fall within the range specified by `start_line` and `end_line`. All other lines will be suppressed from the output due to the `-n` option. If `start_line` is 1 and `end_line` is 10, it will print lines 1 to 10 from the file.