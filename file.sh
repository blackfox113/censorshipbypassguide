#!/usr/bin/env bash

set -euo pipefail

DOCS_DIR="docs"

echo "--- Starting Markdown File Renaming Script ---"

if [ -z "${1:-}" ]; then
    echo "Usage: $0 <language_code>"
    echo "Example: $0 en  (to rename all .md files to .en.md)"
    echo "Example: $0 ru  (to rename all .md files to .ru.md)"
    exit 1
fi

LANGUAGE_CODE="$1"

if [ ! -d "$DOCS_DIR" ]; then
    echo "Error: The '$DOCS_DIR' directory does not exist."
    echo "Please ensure you are running this script from your MkDocs project's root directory."
    exit 1
fi

echo "Renaming all .md files in '$DOCS_DIR' to include the '$LANGUAGE_CODE' suffix..."

find "$DOCS_DIR" -type f -name "*.md" -print0 | while IFS= read -r -d '' filepath; do
    dir=$(dirname "$filepath")
    filename=$(basename "$filepath")

    if [[ "$filename" =~ \.[a-z]{2}\.md$ ]]; then
        echo "Skipping already suffixed file: $filepath"
        continue
    fi

    new_filename="${filename%.md}.${LANGUAGE_CODE}.md"
    new_filepath="$dir/$new_filename"

    mv "$filepath" "$new_filepath"
    echo "Renamed: $filepath -> $new_filepath"
done

echo "--- Renaming complete! ---"
echo "All applicable .md files in '$DOCS_DIR' have been renamed to include the '.$LANGUAGE_CODE.md' suffix."
echo ""
echo "--- Next Steps ---"
echo "1. **Run this script again for your second language (e.g., 'ru').**"
echo "   Example: $0 ru"
echo "   Repeat for each language suffix you need."
echo "   You will then need to manually translate the content of the new files."
echo ""
echo "2. **Ensure your 'mkdocs.yml' is updated** with the 'i18n' plugin configuration."
echo "   The 'nav' section should use base filenames (e.g., 'index.md', 'Server/VLESS.md')."
echo ""
echo "3. **Build your multi-language site** using: 'mkdocs build --clean'"
echo "4. **Serve your site locally** using: 'mkdocs serve'"

