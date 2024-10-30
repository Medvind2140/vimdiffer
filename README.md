An easy tool to open a file in Vim with a vertical split for diffing against clipboard content.

The setup script installs xclip.

## INSTALL
1. Clone the vimdiffer-setup.sh to your home folder(or anyone you like)

2. Make the script executable, then run it as sudo in your terminal
```bash
chmod +x .vimdiffer-setup.sh 
sudo ./vimdiffer-setup.sh
```

3. Read the instructions!

## USAGE

1. copy your new code/text to the clipboard

2. run it

```bash
vimdiffer <file-to-check>
```
3. diff away!

## VIM INSTRUCTIONS

Key commands in Vim diff mode:
```md
]c : Jump to the next difference
[c : Jump to the previous difference
do : Obtain the difference from the other window (clipboard content)
dp : Put the difference to the other window (clipboard content)
:diffupdate : Refresh the diff highlighting
:q : Quit one window
:qa : Quit all windows
```

TIP! Setup aliase vd="vimdiffer" in your .bashrc or .bash_aliases file.
