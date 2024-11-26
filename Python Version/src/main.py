import generator
import XmlCreator
from interface import *

class CommandManual:
    def __init__(self, command):
        self._command = command
        self._description = generator.get_command_description(command.strip())
        self._version_history = generator.get_command_version(command.strip())
        self._examples = generator.get_command_example(command.strip())
        self._related_commands = generator.get_command_releated_commands(command.strip())

    def get_command(self):
        return self._command

    def get_description(self):
        return self._description

    def set_description(self, value):
        self._description = value

    def get_version_history(self):
        return self._version_history

    def set_version_history(self, value):
         self._version_history = value

    def get_examples(self):
        return self._examples

    def examples(self, value):
        self._examples = value

    def get_related_commands(self):
        return self._related_commands

    def set_related_commands(self, value):
        self._related_commands = value


class CommandManualGenerator:
    def __init__(self, input_file):
        self.input_file = input_file
        self._manuals = []
        self._xml_files = []

    def get_manuals(self):
        return self._manuals
    def get_xml_files_objects(self):
        return self._xml_files

    def generate_manuals(self):
        with open(self.input_file, 'r') as file:
            commands = file.readlines()

        for command in commands:
            self._manuals.append(CommandManual(command.strip()))


        for i in self._manuals:
            cur_xml_file = XmlCreator.XmlSerializer(i)
            cur_xml_file.create_xml_files()
            self._xml_files.append(cur_xml_file)


Manual1 = CommandManualGenerator("commands.txt")
Manual1.generate_manuals()

root = tk.Tk()
app = CommandManualGeneratorGUI(root)
root.mainloop()
