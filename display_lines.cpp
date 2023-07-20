// Write a Shell script that accepts a filename, starting and ending line numbers as arguments,
// and displays all the lines between the given line numbers.

#include <iostream>
#include <fstream>
#include <cstdlib>
#include <string>

int main(int argc, char *argv[])
{
    if (argc < 4)
    {
        std::cerr << "Usage: " << argv[0] << " filename start_line end_line" << std::endl;
        return 1;
    }

    const char *filename = argv[1];
    int start_line = std::atoi(argv[2]);
    int end_line = std::atoi(argv[3]);

    if (start_line <= 0 || end_line <= 0)
    {
        std::cerr << "Error: Line numbers should be positive integers." << std::endl;
        return 1;
    }

    if (start_line > end_line)
    {
        std::cerr << "Error: The starting line cannot be greater than the ending line." << std::endl;
        return 1;
    }

    std::ifstream file(filename);
    if (!file)
    {
        std::cerr << "Error: File '" << filename << "' not found." << std::endl;
        return 1;
    }

    std::string line;
    int current_line = 1;

    while (std::getline(file, line))
    {
        if (current_line >= start_line && current_line <= end_line)
        {
            std::cout << line << std::endl;
        }
        if (current_line > end_line)
        {
            break;
        }
        current_line++;
    }

    return 0;
}
