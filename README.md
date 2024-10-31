An easy tool to open a file in Vim with a vertical split for diffing against clipboard content.

![vimdiffer](https://github.com/user-attachments/assets/7740b8dd-2ea5-40ed-b1fd-eeac85539f1c)

## INSTALL
NOTE! The setup script installs xclip.

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

Key commands in Vim diff mode (NOTE! not INSERT mode):
```md
]c : Jump to the next difference
[c : Jump to the previous difference
do : Obtain the difference from the other window (clipboard content)
zf : Toggle folds
u : Undo
r : Redo
:diffupdate : Refresh the diff highlighting
:w : Write file
:qa : Quit all windows
:wqa! : Write and Quit all windows
```

TIP! Setup aliase vd="vimdiffer" in your .bashrc or .bash_aliases file.
