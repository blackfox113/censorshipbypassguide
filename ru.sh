#!/usr/bin/env bash

set -euo pipefail

DOCS_DIR="docs"
MKDOCS_YML_PATH="mkdocs.yml"

check_command() {
    if ! command -v "$1" &> /dev/null; then
        echo "Error: '$1' is not installed or not in your PATH."
        exit 1
    fi
}

print_i18n_config() {
    cat <<'YAML_BLOCK'
## Add this under your existing `plugins:` section in mkdocs.yml:

  - i18n:
      default_language: en
      languages:
        - locale: en
          name: English
          nav_translations:
            Home: "Home"
            Server Side: "Server Side"
            Client Side: "Client Side"
            Useful Links: "Useful Links"
            Misc: "Misc"
        - locale: ru
          name: Русский
          nav_translations:
            Home: "Главная"
            Server Side: "Сторона сервера"
            Client Side: "Сторона клиента"
            Useful Links: "Полезные ссылки"
            Misc: "Разное"

# Remove `extra.alternate` if it exists — the i18n plugin handles language switching.
YAML_BLOCK
}

echo "--- Starting MkDocs Multi-language Setup ---"

if [ ! -f "$MKDOCS_YML_PATH" ]; then
    echo "Error: '$MKDOCS_YML_PATH' not found in the current directory."
    exit 1
fi

echo "Checking for required tools..."
check_command python3
check_command pip3
check_command mkdocs

echo "Installing mkdocs-static-i18n plugin..."
pip3 install -q mkdocs-static-i18n

echo ""
echo "--- Manual Step: Update mkdocs.yml ---"
print_i18n_config
echo ""
echo "Add the config above to your mkdocs.yml plugins section, then re-run this script."

echo ""
echo "--- Next Steps ---"
echo "1. Ensure all docs files are named with suffixes: filename.en.md, filename.ru.md"
echo "2. Run 'mkdocs build --clean' to build the site"
echo "3. Run 'mkdocs serve' to preview locally"

