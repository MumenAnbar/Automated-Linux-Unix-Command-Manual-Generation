# Automated Linux/Unix Command Manual Generation
This project automates the creation and verification of a manual for Linux/Unix commands. The goal is to streamline the documentation process, ensuring consistency and efficiency while adhering to the provided CISCO template structure.

## Features
--------
### 1. **Command Manual Generation**:
    - Automates the generation of detailed manuals for a list of Linux/Unix commands.
    - Each manual includes:
      - **Description**: Extracted directly from the system's manual pages.
      - **Version History**: Retrieved using the `--version` or `uname` command.
      - **Examples**: Demonstrates command usage with illustrative examples.
      - **Related Commands**: Identifies commands related to the current command.

### 2. **Command Verification**:
    - Reads the generated manual and verifies its accuracy by:
      - Comparing the manual description with the actual man page content.
      - Testing the example to ensure it matches the expected behavior.
      - Validating the listed related commands.

### 3. **Additional Enhancements**:
    - Recommendation System: Suggests commands based on previous usage patterns.
    - Search Functionality: Allows users to find information about specific commands or topics.

## Setup and Usage
 ----------------
### Follow these steps to set up and use the project:

1. Clone the repository:
git clone https://github.com/MumenAnbar/linux-command-manual.git
cd linux-command-manual

2. Add your list of commands to `commandsFile.txt`.

3. Generate manuals for the listed commands:
bash main.sh generate

4. Verify the accuracy of a generated manual:
bash main.sh verify <command_name>

5. Search for information about a specific command:
bash main.sh search <command_name>

6. Get command recommendations:
bash main.sh suggest <command_name>

7. Display all supported commands:
bash main.sh show

## Output
 ------
 Each manual is saved in a `.txt` file corresponding to the command name (e.g., `ls.txt`).
 The manual file includes:
 - **Command Description**
 - **Version History**
 - **Example**
 - **Related Commands**

### Example Output (for `ls`):
# ######################################################################################################################
```plaintext
 > ls
 __________________

 Description:
   List directory contents.
__________________

 Version History:
   ls (GNU coreutils) 8.32
 __________________

 Example:
   ls -l
__________________

 Related Commands:
   dir, vdir, stat, tree
 __________________
```

## Notes
 -----
 - The project uses shell utilities like `awk`, `grep`, and `compgen` to extract and process command information.
 - Ensure that all required commands are available in your system before running the scripts.
