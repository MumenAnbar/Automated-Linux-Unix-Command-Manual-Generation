import xml.etree.ElementTree as ET
import generator

class XmlSerializer:
    def __init__(self, Command):
        self.Command = Command

    def add_Section(self, parent_element, curCommand):
        description_element = ET.SubElement(parent_element, "Description")
        version_element = ET.SubElement(parent_element, "Version_History")
        example_element = ET.SubElement(parent_element, "Example")
        related_commands_element = ET.SubElement(parent_element, "Related_Commands")

        description_element.text = curCommand.get_description()
        version_element.text = curCommand.get_version_history()
        example_element.text = curCommand.get_examples()
        related_commands_element.text = curCommand.get_related_commands()

    def create_xml_files(self):
        # Create the root element
        self.tree = ET.ElementTree(ET.Element("Manuals"))


        manual_Sections = ["Description", "Version History", "Example", "Related Commands"]

        # Create sub-elements for close friends, normal friends, and best friends
        command_Manual = ET.SubElement(self.tree.getroot(), self.Command.get_command())
        self.add_Section(command_Manual, self.Command)

        # Save the XML tree to a file
        self.tree.write(f"{self.Command.get_command()}.xml")
        print(f"{self.Command.get_command()}.xml Creation Is Done!!")

    def get_command_name(self):
        return self.Command.get_command()

    def get_Manual(self):
        return self.tree


