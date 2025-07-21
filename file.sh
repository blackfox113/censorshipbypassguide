#!/bin/bash

# --- Configuration ---
# The directory where your Markdown files are located.
# This script assumes you are running it from your project's root directory.
DOCS_DIR="docs"

# --- Main Script ---

echo "--- Starting Markdown File Renaming Script ---"

# Check if a language code is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <language_code>"
    echo "Example: $0 en  (to rename all .md files to .en.md)"
    echo "Example: $0 ru  (to rename all .md files to .ru.md)"
    exit 1
fi

LANGUAGE_CODE="$1"

# Check if the docs directory exists
if [ ! -d "$DOCS_DIR" ]; then
    echo "Error: The '$DOCS_DIR' directory does not exist."
    echo "Please ensure you are running this script from your MkDocs project's root directory."
    exit 1
fi

echo "Renaming all .md files in '$DOCS_DIR' to include the '$LANGUAGE_CODE' suffix..."

# Find all .md files in the docs directory and its subdirectories
# and rename them to add the language code before the .md extension.
# It skips files that already have a language suffix (e.g., .en.md, .ru.md)
find "$DOCS_DIR" -type f -name "*.md" | while read -r filepath; do
    # Get the directory and filename without path
    dir=$(dirname "$filepath")
    filename=$(basename "$filepath")

    # Check if the filename already contains a language suffix (e.g., .en.md, .ru.md)
    # This regex checks for .<two_letter_code>.md at the end
    if [[ "$filename" =~ \.[a-z]{2}\.md$ ]]; then
        echo "Skipping already suffixed file: $filepath"
        continue
    fi

    # Construct the new filename with the language code
    new_filename="${filename%.md}.${LANGUAGE_CODE}.md"
    new_filepath="$dir/$new_filename"

    # Rename the file
    mv "$filepath" "$new_filepath"
    echo "Renamed: $filepath -> $new_filepath"
done

echo "--- Renaming complete! ---"
echo "All applicable .md files in '$DOCS_DIR' have been renamed to include the '.$LANGUAGE_CODE.md' suffix."
echo ""
echo "--- Next Steps ---"
echo "1. **Run this script again for your second language (e.g., 'ru').**"
echo "   Example: $0 ru"
echo "   This will create copies of your renamed English files (e.g., index.en.md) as Russian files (e.g., index.ru.md)."
echo "   You will then need to manually translate the content of the new Russian files."
echo ""
echo "2. **Ensure your 'mkdocs.yml' is updated** with the 'i18n' plugin configuration as instructed by the previous script."
echo "   Remember the 'nav' section in 'mkdocs.yml' should use the base filenames (e.g., 'index.md', 'Server/VLESS.md')."
echo ""
echo "3. **Build your multi-language site** using: 'mkdocs build --clean'"
echo "4. **Serve your site locally** using: 'mkdocs serve'"

