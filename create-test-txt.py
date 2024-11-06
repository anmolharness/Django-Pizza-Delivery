import re
import os

def extract_test_classes(file_path):
    test_classes = []
    with open(file_path, 'r') as file:
        lines = file.readlines()
        for line in lines:
            match = re.search(r'class\s+(\w+)\(.*\)\s*:', line)
            if match:
                test_classes.append(match.group(1))
    return test_classes

def find_test_files(directory):
    test_files = []
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.startswith("test_") and file.endswith(".py"):
                test_files.append(os.path.join(root, file))
    return test_files

def main():
    directory = "."  # Change this to your test directory
    test_files = find_test_files(directory)
    
    # Create a list of fully qualified test class names
    test_classes_list = []
    for file_path in test_files:
        module_path = os.path.splitext(file_path)[0].replace(os.sep, '.').lstrip('.')
        test_classes = extract_test_classes(file_path)
        if test_classes:
            for test_class in test_classes:
                test_classes_list.append(f"{module_path}.{test_class}")

    # Write the list to a text file
    with open("test_classes.txt", "w") as txt_file:
        for test_class in test_classes_list:
            txt_file.write(test_class + "\n")

    print("Fully qualified test class names list written to test_classes.txt")

if __name__ == "__main__":
    main()
