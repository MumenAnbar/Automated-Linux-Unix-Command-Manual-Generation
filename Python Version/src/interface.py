import subprocess
import tkinter as tk
from tkinter import messagebox
import XmlCreator
import xml.etree.ElementTree as ET
import generator
import verify

def read_xml_file(file_path):
    try:
        tree = ET.parse(file_path)
        root = tree.getroot()
        xml_string = ET.tostring(root, encoding='utf-8').decode('utf-8')
        return xml_string
    except ET.ParseError as e:
        print(f"Error parsing XML file: {e}")
        return None


#Add a newline character after each '>' symbol in the input string.
def add_newline_after_gt(input_string):
    result_string = ""
    for char in input_string:
        if char == '<':
            result_string += '\n'
        result_string += char
        if char == '>':
            result_string += '\n'
    return result_string


#  Add a tab in front of each line in the input string, except lines starting with '<'.
def add_tab_except_lt(input_string):
    lines = input_string.split('\n')
    modified_lines = [line if line.startswith('<') else '\t' + line for line in lines]
    modified_string = '\n'.join(modified_lines)
    return modified_string



class CommandManualGeneratorGUI:
    def __init__(self, root):
        self.root = root

        self.root.title("Command Manual Generator")
        root.geometry("800x800")
        # Key Features 1: Command Selection
        self.command_listbox = tk.Listbox(self.root, selectmode=tk.SINGLE)
        self.command_listbox.pack(pady=30)

        # Key Features 2: Manual generation
        generate_button = tk.Button(self.root, text="Generate Manual", command=self.generate_manual)
        generate_button.pack(pady=15)

        # Key Features 3: Manual Visualization
        visualize_button = tk.Button(self.root, text="Visualize Manual", command=self.visualize_manual)
        visualize_button.pack(pady=15)

        # Key Features 4: Verification Interface
        verify_button = tk.Button(self.root, text="Verify Command", command=self.verify_command)
        verify_button.pack(pady=15)

        # Key Features 5: Search Functionality
        search_label = tk.Label(self.root, text="Search Command:")
        search_label.pack(pady=15)

        self.search_entry = tk.Entry(self.root)
        self.search_entry.pack(pady=15)

        search_button = tk.Button(self.root, text="Search", command=self.search_command)
        search_button.pack(pady=15)

        # Key Features 6: Command Recommendation Panel
        recommendation_button = tk.Button(self.root, text="Get Recommendations", command=self.get_recommendations)
        recommendation_button.pack(pady=15)

        # Populate command_listbox from commands.txt (replace 'commands.txt' with your file)
        with open("commands.txt", "r") as file:
            commands = file.read().splitlines()
            for command in commands:
                self.command_listbox.insert(tk.END, command)

    def generate_manual(self):
        selected_command = self.get_selected_command()
        if selected_command:
            # Add your code to generate the manual for the selected command
            cur_command_file = XmlCreator.XmlSerializer(selected_command)
            messagebox.showinfo("Manual Generation", f"Manual generated for {selected_command}")

    def visualize_manual(self):
        selected_command = self.get_selected_command()
        if selected_command:
            # Add your code to visualize the manual for the selected command
            output = read_xml_file(f"{selected_command}.xml")
            output = add_newline_after_gt(output)
            output = add_tab_except_lt(output)
            manual_window = tk.Toplevel()
            manual_window.title(f"{selected_command}.xml")

            # Create a Text widget and insert the content
            text_widget = tk.Text(manual_window, wrap=tk.WORD)
            text_widget.insert(tk.END, output)
            text_widget.pack(expand=True, fill='both')

            manual_window.mainloop()

    def verify_command(self):
        global target_command
        selected_command = self.get_selected_command()
        if selected_command:
            # Add your code to run and verify the selected command
            try:
                manual_window = tk.Toplevel()
                manual_window.title("Verification Window")

                # Create a Text widget and insert the content
                text_widget = tk.Text(manual_window, wrap=tk.WORD)
                text_widget.insert(tk.END, verify.verify_xml_file(f"{selected_command}.xml"))
                text_widget.pack(expand=True, fill='both')
            except subprocess.CalledProcessError as e:
                messagebox.showerror("Verification Error", f"Error executing command:\n{e}")

    def search_command(self):
        keyword = self.search_entry.get().lower()
        if keyword:
            # Add your code to search for specific commands
            matching_commands = [command for command in self.command_listbox.get(0, tk.END) if keyword in command.lower()]
            messagebox.showinfo("Search Results", f"Matching Commands:\n{', '.join(matching_commands)}")
        else:
            messagebox.showwarning("Search Warning", "Please enter a keyword for search.")

    def get_recommendations(self):
        selected_command = self.get_selected_command()
        if selected_command:
            # Add your code to provide recommendations based on the selected command
            # Placeholder implementation, replace with actual recommendation logic
            recommendations = generator.get_command_recommendation(selected_command)
            messagebox.showinfo("Recommendations", f"Recommended Commands:\n{', '.join(recommendations)}")

    def get_selected_command(self):
        selected_indices = self.command_listbox.curselection()
        if selected_indices:
            return self.command_listbox.get(selected_indices[0])
        else:
            messagebox.showwarning("Selection Warning", "Please select a command.")
            return None
