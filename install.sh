#!/bin/bash

# Colors
C1='\033[1;34m' # Blue
C2='\033[1;36m' # Cyan
C3='\033[1;32m' # Green
NC='\033[0m'    # No Color

clear

# Stylized ASCII Header (Clear Tilted Block style)
echo -e "${C1}      ___  _   ___ _____ ___ ___ _____ ___ _  _ ${NC}"
echo -e "${C1}     | __|/_\ / __|_   _| __| __|_   _/ __| || |${NC}"
echo -e "${C2}    | _|/ _ \\\\__ \ | | | _|| _|  | || (__| __ |${NC}"
echo -e "${C2}   |_|/_/ \_\___/ |_| |_| |___| |_| \___|_||_|${NC}"
echo -e "${C3}    ___ ___  _  _ ___ ___ ___     ___ _  _ ___ _____ _   _    _    ${NC}"
echo -e "${C3}   / __/ _ \| \| | __|_ _/ __|   |_ _| \| / __|_   _/_\ | |  | |   ${NC}"
echo -e "${C2}  | (_| (_) | .\` | _| | | (_ |    | || .\` \__ \ | |/ _ \| |__| |__ ${NC}"
echo -e "${C1}   \___\___/|_|\_|_| |___\___|   |___|_|\_|___/ |_/_/ \_\____|____|${NC}"
echo ""
echo -e "${C2}>>> Fastfetch Configuration Installer <<<${NC}"
echo ""

# Configuration Paths
CONFIG_DIR="$HOME/.config/fastfetch"
IMAGE_DIR="$CONFIG_DIR/image"
PRESETS_DIR="./presets"
IMAGES_DIR="./images"

# 1. Select Preset
echo -e "${C3}[Step 1] Select a Preset (01-14):${NC}"
ls "$PRESETS_DIR"
read -p "Enter preset number (e.g., 01): " PRESET_NUM

SELECTED_PRESET="$PRESETS_DIR/$PRESET_NUM.jsonc"

if [ ! -f "$SELECTED_PRESET" ]; then
    echo -e "${C1}Error: Preset $PRESET_NUM not found!${NC}"
    exit 1
fi

# 2. Select Logo
echo ""
echo -e "${C3}[Step 2] Select Logo Option:${NC}"
echo "1) Choose a Custom Image (001-250)"
echo "2) Use Operating System Default Logo"
read -p "Selection (1 or 2): " LOGO_OPT

# Execution
mkdir -p "$IMAGE_DIR"
cp "$SELECTED_PRESET" "$CONFIG_DIR/config.jsonc"

if [ "$LOGO_OPT" == "1" ]; then
    read -p "Enter image number (e.g., 001): " IMAGE_NUM
    SELECTED_IMAGE="$IMAGES_DIR/$IMAGE_NUM.png"
    
    if [ ! -f "$SELECTED_IMAGE" ]; then
        echo -e "${C1}Error: Image $IMAGE_NUM not found!${NC}"
        exit 1
    fi
    
    cp "$SELECTED_IMAGE" "$IMAGE_DIR/image.png"
    echo -e "${C2}Successfully installed preset $PRESET_NUM with image $IMAGE_NUM.${NC}"
else
    # Use OS Default: Set source to "" and type to auto
    # We use sed to modify the installed config.jsonc
    if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i '' 's/"source": ".*"/"source": ""/' "$CONFIG_DIR/config.jsonc"
    else
        sed -i 's/"source": ".*"/"source": ""/' "$CONFIG_DIR/config.jsonc"
    fi
    echo -e "${C2}Successfully installed preset $PRESET_NUM with Operating System default logo.${NC}"
fi

echo ""
echo -e "${C3}Run 'fastfetch' to see your new setup!${NC}"
echo ""
