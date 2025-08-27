#!/bin/bash

# --- Configuration Variables ---
# The script will now operate in the current directory.
# DOCS_DIR refers to your existing 'docs' folder.
DOCS_DIR="docs"
# MKDOCS_YML_PATH refers to your existing 'mkdocs.yml' file.
MKDOCS_YML_PATH="mkdocs.yml"

# --- Functions ---

# Function to check if a command exists
check_command() {
    if ! command -v "$1" &> /dev/null; then
        echo "Error: '$1' is not installed or not in your PATH."
        echo "Please install '$1' before running this script."
        echo "For Python/pip, visit: https://www.python.org/downloads/"
        echo "For MkDocs, run: pip install mkdocs"
        exit 1
    fi
}

# Function to provide instructions for updating the mkdocs.yml file
provide_mkdocs_yml_update_instructions() {
    echo "--- IMPORTANT: Manual Update Required for mkdocs.yml ---"
    echo "You already have an existing 'mkdocs.yml' file."
    echo "Please manually add or merge the following sections into your '$MKDOCS_YML_PATH' file:"
    echo ""
    echo "1. **Locate your existing 'plugins:' section.**"
    echo "   It should look something like this already:"
    echo "```yaml"
    echo "plugins:"
    echo "  - social:"
    echo "      cards_layout: default"
    echo "# ... possibly other plugins you have"
    echo "```"
    echo ""
    echo "2. **Merge the 'i18n' plugin into this 'plugins:' section.**"
    echo "   The entire 'plugins:' section in your 'mkdocs.yml' should look exactly like this *after* merging:"
    echo "   (Pay very close attention to indentation!)"
    # Using a heredoc with quoted EOF to print the YAML content literally
    cat <<'YAML_CONTENT_TO_COPY'
```yaml
plugins:
  - social:
      cards_layout: default
  - i18n:
      default_language: en
      languages:
        - locale: en
          name: English
          nav_translations:
            Home: "Home"
            Server Side: "Server Side"
            Client Side: "Client Side"
            Environments: "Environments"
            Useful Links: "Useful Links"
            Misc: "Misc"
        - locale: ru
          name: Русский
          nav_translations:
            Home: "Главная"
            Server Side: "Сторона сервера"
            Client Side: "Сторона клиента"
            Environments: "Среды"
            Useful Links: "Полезные ссылки"
            Misc: "Разное"
# If you have other plugins, add them here, indented under 'plugins:'
# For example:
#  - another-plugin:
#      option: value
```
YAML_CONTENT_TO_COPY
    echo ""
    echo "3. **Remove 'extra.alternate' if it exists.**"
    echo "   The 'i18n' plugin automatically handles the language selector, so you no longer need the 'extra.alternate' section."
    echo ""
    echo "4. **Verify your 'nav' section.**"
    echo "   Make sure your 'nav' section uses base filenames (e.g., 'index.md', 'Server/VLESS.md'),"
    echo "   as the plugin will automatically look for 'index.en.md', 'index.ru.md', etc."
    echo ""
    echo "Press Enter when you have updated your '$MKDOCS_YML_PATH' file."
    read -r
}

# Function to create dummy content files for demonstration
create_dummy_content() {
    echo "Creating dummy content files for demonstration..."
    mkdir -p "$DOCS_DIR/Server" "$DOCS_DIR/Client Side" "$DOCS_DIR/Environments" "$DOCS_DIR/Misc"

    # English dummy content
    echo "# Welcome to the English Guide!" > "$DOCS_DIR/index.en.md"
    echo "This is the English VLESS guide." > "$DOCS_DIR/Server/VLESS.en.md"
    echo "This is the English Clients guide." > "$DOCS_DIR/Client Side/Clients.en.md"
    echo "This is the English Fortinet guide." > "$DOCS_DIR/Environments/Fortinet.en.md"
    echo "This is the English Safety Note." > "$DOCS_DIR/Misc/safety.en.md"

    # Russian dummy content
    echo "# Добро пожаловать в русское руководство!" > "$DOCS_DIR/index.ru.md"
    echo "Это русское руководство по VLESS." > "$DOCS_DIR/Server/VLESS.ru.md"
    echo "Это русское руководство по клиентам." > "$DOCS_DIR/Client Side/Clients.ru.md"
    echo "Это русское руководство по Fortinet." > "$DOCS_DIR/Environments/Fortinet.ru.md"
    echo "Это русское примечание по безопасности." > "$DOCS_DIR/Misc/safety.ru.md"

    echo "Dummy content created in '$DOCS_DIR'."
    echo "Remember to replace these with your actual translated content."
    echo "Ensure your files are named like 'filename.en.md' and 'filename.ru.md'."
}

# --- Main Script Execution ---

echo "--- Starting MkDocs Multi-language Setup Automation ---"

# 1. Check if the current directory contains mkdocs.yml
if [ ! -f "$MKDOCS_YML_PATH" ]; then
    echo "Error: '$MKDOCS_YML_PATH' not found in the current directory."
    echo "Please run this script from the root of your MkDocs project."
    exit 1
fi

# 2. Check for necessary commands (Python, pip, MkDocs)
echo "Checking for required tools (python3, pip3, mkdocs)..."
check_command "python3"
check_command "pip3"
check_command "mkdocs"
echo "All required tools found."

# 3. Install mkdocs-static-i18n plugin
echo "Installing 'mkdocs-static-i18n' plugin..."
pip3 install mkdocs-static-i18n || { echo "Error: Failed to install 'mkdocs-static-i18n'. Please check your internet connection or pip3 setup. Exiting."; exit 1; }
echo "'mkdocs-static-i18n' installed successfully."

# 4. Provide instructions for updating the mkdocs.yml file
provide_mkdocs_yml_update_instructions

# 5. Create dummy content (user will replace these)
create_dummy_content

# 6. Build the multi-language site
echo "Building the multi-language MkDocs site..."
# The --clean option removes any existing build artifacts before building
mkdocs build --clean || { echo "Error: MkDocs build failed. Please check your mkdocs.yml and content files for errors. Exiting."; exit 1; }
echo "--- Site built successfully! ---"
echo "Your multi-language website is now in the './site' directory."
echo "The English version is at './site/'"
echo "The Russian version is at './site/ru/'"

# 7. Provide instructions for local serving
echo ""
echo "To view your site locally in your web browser:"
echo "1. Ensure you are in your project root directory."
echo "2. Run the MkDocs development server:"
echo "   mkdocs serve"
echo "Then open your browser to http://127.0.0.1:8000"
echo ""
echo "--- IMPORTANT NEXT STEPS ---"
echo "1. **Replace Dummy Content:** Go into the '$DOCS_DIR' folder."
echo "   You will find files like 'index.en.md' and 'index.ru.md'."
echo "   Replace the content of these files with your actual English and Russian guides."
echo "2. **Rename Existing Pages:** If you have existing Markdown files like 'index.md' or 'Server/VLESS.md',"
echo "   you need to rename them to include the language code, e.g., 'index.en.md' and 'Server/VLESS.en.md'."
echo "   Then create their corresponding Russian versions (e.g., 'index.ru.md', 'Server/VLESS.ru.md')."
echo "   Keep the folder structure (e.g., 'Server/') the same for both languages."
echo "3. **Customize:** Feel free to modify your '$MKDOCS_YML_PATH' file to adjust colors, fonts, etc."
echo "   Remember the navigation section in 'mkdocs.yml' uses the base filename (e.g., 'index.md', 'Server/VLESS.md'),"
echo "   and the plugin automatically finds the language-specific versions."
echo "Good luck with your Censorship Bypass Guide!"

