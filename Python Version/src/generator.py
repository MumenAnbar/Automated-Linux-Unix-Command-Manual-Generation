import subprocess

def delete_first_line(input_string):
    # Split the string into lines
    lines = input_string.split('\n', 1)

    # Check if there is more than one line
    if len(lines) > 1:
        # Remove the first line and join the remaining lines
        return lines[1]
    else:
        # Return an empty string if there is only one line or no lines
        return ""

def get_command_description(command_name):
    try:
        # Run 'man' command to get the manual page
        result = subprocess.run(['man', command_name], capture_output=True, text=True, check=True)

        # Extract and return the description (usually found in the NAME section)
        return delete_first_line(result.stdout.split('\n\n', 100)[3].strip())

    except subprocess.CalledProcessError as e:
        # If the command doesn't have a manual page, you can handle the exception
        return f"Error: {e}"

def get_command_version(command):
    try:
        # Run the command with the --version option
        result = subprocess.run([command, '--version'], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)

        # Check if the command executed successfully
        if result.returncode == 0:
            # Get the version information from the output
            version_info = result.stdout.split('\n', 2)[0].strip()
            # Delete the first word from the version information
            version_info = ' '.join(version_info.split()[1:])
            return version_info
        else:
            # Return the error message if the command failed
            return result.stderr.strip()
    except Exception as e:
        # Handle exceptions, if any
        return str(e)

def swtich(command):
    if (command == "ls" or command == "who" or command == "ps"):
        return f"bash -c '{command}'"
    elif (command == "tr"):
        return f"bash -c 'echo \"This is an Example on tr command:\" | tr 'e' 'X''"
    elif (command == "lspci"):
        return f"bash -c '{command} -t'"
    elif (command == "cut"):
        return f"echo This is an Example on cut command | ({command} -d ' ' -f1)"
    elif (command == "echo"):
        return f"bash -c '{command} This is an example on echo command'"
    elif (command == "grep"):
        return f"bash -c 'compgen -c | grep {command}'"
    elif (command == "touch"):
        return f"bash -c '{command} ExampleOnTouchCommand.txt'"
    elif (command == "whatis"):
        return f"bash -c '{command} {command}'"
    elif (command == "sed"):
        return f"bash -c 'echo \"Substrings of abc in filename.txt will be deleted\"'"
    elif (command == "mv"):
        return f"bash -c 'echo \"File1.txt will be renamed to File2.txt\"'"
    elif (command == "test"):
        return f"bash -c 'echo -e \"$({command} 'Ali' = 'ali') $?\n\"'"
    elif (command == "find"):
        return f"bash -c 'find . -name main.py -print'"
    elif (command == "cp"):
        return f"bash -c 'echo \"(Data of File1.txt Will be copied to File2.txt)\"'"
    elif (command == "which"):
        return f"bash -c '{command} cpp'"
    elif (command == "wc"):
        return f"bash -c '{command} main.py'"
    elif (command == "man"):
        return f"bash -c '{command} man'"
    elif (command == "ln"):
        return f"bash -c 'echo \"(ex.txt will be as a pointer to Examples.sh)\"'"
    elif (command == "sort"):
        return f"bash -c '{command} main.py'"

def swtichOfExample(command):
    if (command == "ls" or command == "who" or command == "ps"):
        return command
    elif (command == "tr"):
        return "echo \"This is an Example on tr command:\" | tr 'e' 'X'"
    elif (command == "sed"):
        return "sed '/abc/d' filename.txt"
    elif (command == "lspci"):
        return f"{command} -t"
    elif (command == "cut"):
        return f"echo This is an Example on cut command | ({command} -d ' ' -f1)"
    elif (command == "echo"):
        return f"{command} This is an example on echo command"
    elif (command == "grep"):
        return f"compgen -c | grep {command}"
    elif (command == "touch"):
        return f"{command} ExampleOnTouchCommand.txt"
    elif (command == "whatis"):
        return "whatis whatis"
    elif (command == "mv"):
        return "mv file1.txt file2.txt"
    elif (command == "test"):
        return f"echo -e \"$({command} 'Ali' = 'ali') $?\n\""
    elif (command == "find"):
        return f"find . -name main.py -print"
    elif (command == "cp"):
        return f"cp File1.txt File2.txt"
    elif (command == "which"):
        return f"{command} cpp"
    elif (command == "wc"):
        return f"{command} main.py"
    elif (command == "man"):
        return f"{command} man"
    elif (command == "ln"):
        return f"ln Examples.sh ex.sh"
    elif (command == "sort"):
        return f"bash -c '{command} main.py'"

def get_command_example(command):
    try:
        # Run the command with the --version option
        orignial_command = command
        command = swtich(command)
        print(command)
        # Run the command and capture its output
        result = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)

        # Get the standard output and standard error
        stdout, stderr = result.communicate()

        # Check if the command executed successfully
        if result.returncode == 0:
            # Delete the first word from the version information
            return str(swtichOfExample(orignial_command)) + "\n" + str(stdout)
        else:
            # Return the error message if the command failed
            return result.stderr
    except Exception as e:
        # Handle exceptions, if any
        return str(e)

def get_command_releated_commands(command):
    command = f"bash -c 'compgen -c | grep {command}'"

    # Run the command and capture its output
    process = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)

    # Get the standard output and standard error
    stdout, stderr = process.communicate()
    stdout = stdout.replace('\n', ',')
    # Check if the command executed successfully
    if process.returncode == 0:
        # Print the output
        return stdout
    else:
        # Print the error
        print("Command failed. Error:")
        return

def sub_list(list, command):
    new_list = []
    for item in list:
        if item != command:
            new_list.append(item)
    return  new_list

def get_command_recommendation(command):
    # File and Directory Operations
    Directory_Operations = ['ls', 'touch', 'mv', 'cp', 'ln']
    if command in Directory_Operations:
        return sub_list(Directory_Operations, command)

    # Text Processing and Searching
    Text_Processing = ['echo', 'cut', 'grep', 'sed', 'sort', 'find', 'wc', 'tr']
    if command in Text_Processing:
        return sub_list(Text_Processing, command)

    # System Information
    System_Information = ['who', 'lspci', 'ps', 'whatis', 'man', 'which']
    if command in System_Information:
        return sub_list(System_Information, command)

    # Shell Built-in and Control Flow
    if command in ['test']:
        return sub_list(Text_Processing, command)

    return 'Command not recognized.'

