# Automated Linux/Unix Command Manual Generation
This project automates the creation and verification of a manual for Linux/Unix commands. The goal is to streamline the documentation process, ensuring consistency and efficiency while adhering to the provided CISCO template structure.

## Features
--------
### 1. **Command Manual Generation:**
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
```bash
git clone https://github.com/MumenAnbar/linux-command-manual.git
cd linux-command-manual
```

2. Add your list of commands to `commandsFile.txt`.

3. Generate manuals for the listed commands:
```bash
bash main.sh generate
```

4. Verify the accuracy of a generated manual:
```bash
bash main.sh verify <command_name>
```

5. Search for information about a specific command:
```bash
bash main.sh search <command_name>
```

6. Get command recommendations:
```bash
bash main.sh suggest <command_name>
```

7. Display all supported commands:
```bash
bash main.sh show
```

## Output
 ------
Each manual is saved in a `.txt` file corresponding to the command name (e.g., `ls.txt`).
The manual file includes:
- **Command Description**
- **Version History**
- **Example**
- **Related Commands**

### Example Output (for `ls`):
```plaintext
 ######################################################################################################################
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

---

## **Version 2 (Python-based)**

### Description
Version 2 is an enhanced Python implementation that uses Object-Oriented Programming (OOP) principles to automate the creation and verification of Linux/Unix command manuals. It generates XML files instead of plain text, and features a graphical user interface (GUI) to improve user interaction.

### **Features**:
1. **Command Manual Generation**:
    - Automates the creation of XML-based manuals for Linux/Unix commands.
    - Each manual includes:
      - **Command Description**: Extracted from the `man` pages.
      - **Version History**: Retrieved using the `--version` or `uname` command.
      - **Example**: Includes sample usage, with exception handling for errors.
      - **Related Commands**: Identifies commands related to the current command using `compgen -c`.

2. **Verification**:
    - Verifies the correctness of the generated content by comparing the manual with the actual system output.
    - Compares command descriptions, examples, and related commands.

3. **GUI Integration**:
    - User-friendly interface for selecting commands and generating manuals.
    - Search functionality for quick retrieval of command information.
    - Command recommendation system suggesting related commands based on user interaction.

4. **XML File Output**:
    - Each command manual is serialized into XML format for better structure and organization.
    - XML includes:
      - **Command Name**
      - **Description**
      - **Version History**
      - **Example**
      - **Related Commands**

### Setup and Usage (Python Version)
---------------------------
#### Requirements:
- Python 3.x
- Tkinter for the GUI (usually comes pre-installed with Python)
- subprocess library for executing system commands

#### 1. Clone the repository:
```bash
git clone https://github.com/MumenAnbar/linux-command-manual.git
cd linux-command-manual
```

#### 2. Install dependencies:
```bash
pip install -r requirements.txt
```

#### 3. Generate the manual for commands in `commandsFile.txt`:
```bash
python generator.py
```

#### 4. Open the GUI for command manual generation:
```bash
python interface.py
```

#### 5. Verify the manual for a specific command:
```bash
python verify.py <command_name>
```

#### 6. Search for a command's details:
```bash
python search.py <command_name>
```

#### 7. Get command recommendations based on usage:
```bash
python recommendation.py
```

## XML Output
----
Each command manual is saved as an XML file in the following format:

```xml
<Manuals>
    <CommandManual>
        <CommandName>ls</CommandName>
        <CommandDescription>List directory contents.</CommandDescription>
        <VersionHistory>ls (GNU coreutils) 8.32</VersionHistory>
        <Example>ls -l</Example>
        <RelatedCommands>dir, vdir, stat, tree</RelatedCommands>
    </CommandManual>
</Manuals>
```

### Notes:
----
- The Python version uses classes like `CommandManualGenerator`, `CommandManual`, and `XmlSerializer` for encapsulation and modularity.
- The GUI version allows for interactive manual generation and verification, making it easier for users to work with.
- Ensure you have Python 3.x installed and all dependencies are met before running the scripts.
