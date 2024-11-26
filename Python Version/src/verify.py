import XmlCreator
import generator
import xml.etree.ElementTree as ET


def mark_intersection(str1, str2, type):
    # Split the input strings into sets of words
    words1 = set(str1.split())
    words2 = set(str2.split())

    # Find the intersected words
    intersected_words = words1.intersection(words2)

    # Mark words with square brackets if they are in the intersection, and with curly brackets otherwise
    marked_str1 = " ".join(f"[{word}]" if word in intersected_words else f"{{{word}}}" for word in str1.split())
    marked_str2 = " ".join(f"[{word}]" if word in intersected_words else f"{{{word}}}" for word in str2.split())

    # Display the results
    if (type == 1) :
        output = "\tManual Discription: " + marked_str1 + "\n\n" + "\tOriginal Discription:" + marked_str2
        return output

    if (type == 2) :
        output = "\tManual Version-History: " +  marked_str1 + "\n\n" + "\tOriginal Version-History:" + marked_str2
        return  output
    if (type == 3) :
        output = "\tManual Example: " + marked_str1 + "\n\n" + "\tOriginal Example:" + marked_str2
        return output


def verify_xml_file(file_name):
    tree = ET.parse(file_name)
    root = tree.getroot()
    Verification_message = ""
    for xml_command in root:
        command_description = xml_command.find("Description").text
        original_description = generator.get_command_description(xml_command.tag)
        if (command_description == original_description):
            Verification_message += str("Same Description of " + xml_command.tag) + "\n\n"
        else:
             Verification_message += "Different in Description:\n"
             Verification_message += mark_intersection(command_description, original_description, 1) + "\n"

        command_version = xml_command.find("Version_History").text
        original_version = generator.get_command_version(xml_command.tag)
        if (command_version == original_version):
            Verification_message += str("Same Version_History of " + xml_command.tag) + "\n\n"
        else:
            Verification_message += "Different in Version_History:\n"
            Verification_message += mark_intersection(command_version, original_version, 2) + "\n\n"

        command_example = xml_command.find("Example").text
        original_example = generator.get_command_example(xml_command.tag)
        if (command_example == original_example):
            Verification_message += str("Same Example of " + xml_command.tag) + "\n\n"
        else:
            Verification_message += "Different in Example:\n"
            Verification_message += mark_intersection(command_example, original_example, 3) + "\n\n"

        return Verification_message
