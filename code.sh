#!/bin/sh

URL_BASE="https://raw.githubusercontent.com/thepinak503/vscode-config/refs/heads/main"

install_settings() {
    CODE_PATH="$1"
    VSCODE_DIR="$2"
    SETTINGS="$VSCODE_DIR/settings.json"
    BACKUP="$VSCODE_DIR/settings.json.bak"
    URL="$URL_BASE/settings.json"

    echo "[SCAN] Checking for VS Code..."
    echo "    Code: $CODE_PATH"
    echo "    User path: $VSCODE_DIR"

    if [ ! -d "$VSCODE_DIR" ]; then
        echo "[WARN] VS Code user directory not found."
        return 1
    fi

    echo "[FOUND] VS Code settings folder."

    if [ -f "$SETTINGS" ]; then
        echo "Backing up existing settings.json..."
        cp "$SETTINGS" "$BACKUP"
    fi

    if command -v curl >/dev/null 2>&1; then
        curl -fsSL "$URL" -o "$SETTINGS"
    elif command -v wget >/dev/null 2>&1; then
        wget -qO "$SETTINGS" "$URL"
    else
        echo "[ERR] Neither curl nor wget found."
        return 1
    fi

    if [ $? -eq 0 ]; then
        echo "[OK] Settings updated successfully!"
    else
        echo "[ERR] Failed to download settings."
    fi
}

install_extensions() {
    CODE_PATH="$1"
    echo "[INFO] Downloading and running install-extensions.sh..."
    curl -fsSL "$URL_BASE/install-extensions.sh" | sh
}

if [ "$(uname)" = "Darwin" ]; then
    echo "Detecting VS Code installations on macOS..."
    echo ""

    count=0

    if [ -f "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" ]; then
        count=$((count + 1))
        echo "$count. VS Code (System)"
    fi

    if [ -f "/Applications/Visual Studio Code - Insiders.app/Contents/Resources/app/bin/code-insiders" ]; then
        count=$((count + 1))
        echo "$count. VS Code Insiders (System)"
    fi

    if [ -f "$HOME/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" ]; then
        count=$((count + 1))
        echo "$count. VS Code (User)"
    fi

    if [ -f "$HOME/Applications/Visual Studio Code - Insiders.app/Contents/Resources/app/bin/code-insiders" ]; then
        count=$((count + 1))
        echo "$count. VS Code Insiders (User)"
    fi

    if [ $count -eq 0 ]; then
        echo "[ERR] No VS Code installation found."
        echo "Please install VS Code from: https://code.visualstudio.com"
        exit 1
    fi

    if [ $count -eq 1 ]; then
        SELECTED=1
    else
        echo ""
        printf "Select installation [1-$count]: "
        read SELECTED
    fi

    case $SELECTED in
        1) CODE_PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code"; VSCODE_DIR="$HOME/Library/Application Support/Code/User" ;;
        2) CODE_PATH="/Applications/Visual Studio Code - Insiders.app/Contents/Resources/app/bin/code-insiders"; VSCODE_DIR="$HOME/Library/Application Support/Code - Insiders/User" ;;
        3) CODE_PATH="$HOME/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code"; VSCODE_DIR="$HOME/Library/Application Support/Code/User" ;;
        4) CODE_PATH="$HOME/Applications/Visual Studio Code - Insiders.app/Contents/Resources/app/bin/code-insiders"; VSCODE_DIR="$HOME/Library/Application Support/Code - Insiders/User" ;;
        *) echo "[ERR] Invalid selection."; exit 1 ;;
    esac
else
    echo "Detecting VS Code installations on Linux..."
    echo ""

    count=0

    if [ -f "/usr/bin/code" ]; then
        count=$((count + 1))
        echo "$count. VS Code (System)"
    fi

    if [ -f "/usr/bin/code-insiders" ]; then
        count=$((count + 1))
        echo "$count. VS Code Insiders (System)"
    fi

    if [ -f "$HOME/.local/bin/code" ]; then
        count=$((count + 1))
        echo "$count. VS Code (User)"
    fi

    if [ -f "$HOME/.local/bin/code-insiders" ]; then
        count=$((count + 1))
        echo "$count. VS Code Insiders (User)"
    fi

    if [ -d "$HOME/snap/code/common" ]; then
        count=$((count + 1))
        echo "$count. VS Code (Snap)"
    fi

    if [ -d "$HOME/snap/code-insiders/common" ]; then
        count=$((count + 1))
        echo "$count. VS Code Insiders (Snap)"
    fi

    if [ $count -eq 0 ]; then
        echo "[ERR] No VS Code installation found."
        echo "Please install VS Code from: https://code.visualstudio.com"
        exit 1
    fi

    if [ $count -eq 1 ]; then
        SELECTED=1
    else
        echo ""
        printf "Select installation [1-$count]: "
        read SELECTED
    fi

    case $SELECTED in
        1) CODE_PATH="/usr/bin/code"; VSCODE_DIR="$HOME/.config/Code" ;;
        2) CODE_PATH="/usr/bin/code-insiders"; VSCODE_DIR="$HOME/.config/Code - Insiders" ;;
        3) CODE_PATH="$HOME/.local/bin/code"; VSCODE_DIR="$HOME/.config/Code" ;;
        4) CODE_PATH="$HOME/.local/bin/code-insiders"; VSCODE_DIR="$HOME/.config/Code - Insiders" ;;
        5) CODE_PATH="snap"; VSCODE_DIR="$HOME/.config/Code" ;;
        6) CODE_PATH="snap-insiders"; VSCODE_DIR="$HOME/.config/Code - Insiders" ;;
        *) echo "[ERR] Invalid selection."; exit 1 ;;
    esac
fi

echo ""
echo "=========================================="
echo "  VS Code Config Installer"
echo "  Edition: $CODE_PATH"
echo "=========================================="
echo ""
echo "1. Install settings.json"
echo "2. Install Extensions"
echo "3. Install Both"
echo "4. Exit"
echo ""

if [ ! -t 0 ]; then
    echo "Error: This script requires interactive mode."
    echo "Please download and run it manually:"
    echo "  curl -fsSL https://raw.githubusercontent.com/thepinak503/vscode-config/refs/heads/main/code.sh -o code.sh"
    echo "  chmod +x code.sh"
    echo "  ./code.sh"
    exit 1
fi

printf "Select option [1-4]: "
read choice

case $choice in
    1) install_settings "$CODE_PATH" "$VSCODE_DIR" ;;
    2) install_extensions "$CODE_PATH" ;;
    3)
        install_settings "$CODE_PATH" "$VSCODE_DIR"
        echo ""
        install_extensions "$CODE_PATH"
        ;;
    *) echo "[INFO] Exiting." ;;
esac
