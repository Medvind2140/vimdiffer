#!/bin/bash
# Install script for vimdiffer
# (c) 2024 Medvind2140

YELLOW='\033[0;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

if [ "$EUID" -ne 0 ]; then
  echo -e "${YELLOW}Please run as root or with sudo${NC}"
  exit 1
fi

apt-get install -y xclip

cat << 'EOF' > /usr/local/bin/vimdiffer
#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $(basename "$0") <filename>"
    exit 1
fi

filename="$1"
temp_file=$(mktemp)

xclip -selection clipboard -o > "$temp_file"

vim -c "vertical diffsplit $temp_file" "$filename"

rm "$temp_file"
EOF

chmod +x /usr/local/bin/vimdiffer

INSTRUCTIONS=$(cat << EOF

${YELLOW}Vimdiffer has been successfully installed!${NC}

${RED}NOTE!${NC} Remember to copy the content you want to compare before running the command.

Usage: ${BLUE}vimdiffer <filename>${NC}

This will open the specified file in Vim with a vertical split diff against the content of your clipboard.

${YELLOW}Key commands in Vim diff mode:${NC}
${BLUE}]c${NC} : Jump to the next difference
${BLUE}[c${NC} : Jump to the previous difference
${BLUE}do${NC} : Obtain the difference from the other window (clipboard content)
${BLUE}dp${NC} : Put the difference to the other window (clipboard content)
${BLUE}:diffupdate${NC} : Refresh the diff highlighting
${BLUE}:q${NC} : Quit one window
${BLUE}:qa${NC} : Quit all windows

TIP! Setup ${BLUE}aliase vd="vimdiffer"${NC} in your .bashrc or .bash_aliases file.

EOF
)

echo -e "$INSTRUCTIONS"
