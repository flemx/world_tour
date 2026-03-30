#!/bin/bash

set -e  # Exit on error

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}Starting skills sync...${NC}"

# Configuration
GITHUB_REPO="https://github.com/forcedotcom/afv-library"
SKILLS_PATH="skills"
TARGET_DIR=".a4drules/skills"

# Get the script's directory (works even if script is called from elsewhere)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Create target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Create temporary directory
TEMP_DIR=$(mktemp -d)
trap "rm -rf $TEMP_DIR" EXIT

echo -e "${YELLOW}Cloning skills from repository...${NC}"

# Clone only the skills directory using sparse checkout
cd "$TEMP_DIR"
git clone --depth 1 --filter=blob:none --sparse "$GITHUB_REPO" repo
cd repo
git sparse-checkout set "$SKILLS_PATH"

# Check if skills directory exists in the repo
if [ ! -d "$SKILLS_PATH" ]; then
    echo -e "${RED}Error: Skills directory not found in repository${NC}"
    exit 1
fi

# Copy skills to target directory
echo -e "${YELLOW}Copying skills to $TARGET_DIR...${NC}"
cp -r "$SKILLS_PATH/"* "$SCRIPT_DIR/$TARGET_DIR/"

# Count files copied
FILE_COUNT=$(find "$SCRIPT_DIR/$TARGET_DIR" -type f | wc -l | tr -d ' ')

echo -e "${GREEN}✓ Successfully synced $FILE_COUNT skill files to $TARGET_DIR${NC}"
echo -e "${GREEN}✓ Done!${NC}"
