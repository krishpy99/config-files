import os
import re

def convert_to_autosnippet(content):
    def modify_trigger(match):
        trigger = match.group(1)
        if trigger.startswith('"'):
            # For string triggers
            return f's({{"t{trigger[1:]}, snippetType = "autosnippet"}}, {{'
        elif trigger.startswith('{'):
            # For table triggers
            return f's({{trig = "t" .. {trigger[1:]}, snippetType = "autosnippet"}}, {{'
        else:
            return match.group(0)  # No change if format is unexpected

    # Regular expression to find snippet definitions
    snippet_pattern = r's\(((".*?")|({.*?})),\s*{'

    # Replace snippet definitions with autosnippet versions and modified triggers
    modified_content = re.sub(snippet_pattern, modify_trigger, content)

    return modified_content

def process_file(file_path):
    with open(file_path, 'r') as file:
        content = file.read()

    modified_content = convert_to_autosnippet(content)

    if content != modified_content:
        with open(file_path, 'w') as file:
            file.write(modified_content)
        print(f"Updated: {file_path}")
    else:
        print(f"No changes: {file_path}")

def process_directory(directory):
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith('.lua'):
                file_path = os.path.join(root, file)
                process_file(file_path)

# Replace this with the path to your snippets directory
snippets_directory = "cp-snippets"

process_directory(snippets_directory)
print("Conversion complete!")
