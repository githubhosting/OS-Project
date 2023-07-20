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
