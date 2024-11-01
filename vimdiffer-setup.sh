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
# Tool for fast diff execution from clipboard to vim.
cat << 'EOF' > /usr/local/bin/vimdiffer
#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $(basename "$0") <filename>"
    exit 1
fi

filename="$1"
temp_file=$(mktemp)

xclip -selection clipboard -o > "$temp_file"

vim -c "set noswapfile" \
    -c "set backupdir=/tmp/,." \
    -c "set directory=/tmp/,." \
    -c "autocmd VimEnter * wincmd h" \
    -c "vertical diffsplit $temp_file" \
    "$filename"

rm "$temp_file"
EOF

chmod +x /usr/local/bin/vimdiffer

INSTRUCTIONS=$(cat << EOF

${YELLOW}Vimdiffer has been successfully installed!${NC}

${RED}NOTE!${NC} Remember to copy the content you want to compare before running the command.

Usage: ${BLUE}vimdiffer <filename>${NC}

This will open the specified file in Vim with a vertical split diff against the content of your clipboard.

${YELLOW}Key commands in Vim diff mode (NOTE! not INSERT mode):${NC}
${BLUE}]c${NC} : Jump to the next difference
${BLUE}[c${NC} : Jump to the previous difference
${BLUE}do${NC} : Obtain the difference from the other window (clipboard content)
${BLUE}u${NC} : Undo 
${BLUE}r${NC} : Redo  
${BLUE}za${NC} : Toggle folds
${BLUE}:diffupdate${NC} : Refresh the diff highlighting
${BLUE}:w${NC} : Write file
${BLUE}:qa${NC} : Quit all windows
${BLUE}:wqa!${NC} : Write & Quit all windows

TIP! Setup ${BLUE}aliase vd="vimdiffer"${NC} in your .bashrc or .bash_aliases file.

EOF
)

echo -e "$INSTRUCTIONS"
