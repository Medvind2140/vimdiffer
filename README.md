A small tool to open a file in Vim with a vertical split for diffing against clipboard content.

The setup script installs xclip.

## INSTALL
1. Clone the vimdiffer-setup.sh to your home folder(or anyone you like)

2. Make the script executable, then run it as sudo in your terminal
```bash
chmod +x .vimdiffer-setup.sh 
sudo ./vimdiffer-setup.sh
```

3. Read the instructions.

## USAGE

1. copy code/text to clipbaord

2. run it

```bash
vimdiffer <filename>
```
3. diff away!

## INSTRUCTIONS

<span style="color:red;">NOTE!</span> Remember to copy the content you want to compare before running the command.

Usage: <span style="color:blue;">vimdiffer <filename></span>

This will open the specified file in Vim with a vertical split diff against the content of your clipboard.

<span style="color:yellow;">Key commands in Vim diff mode:</span>
<span style="color:blue;">]c</span> : Jump to the next difference
<span style="color:blue;">[c</span> : Jump to the previous difference
<span style="color:blue;">do</span> : Obtain the difference from the other window (clipboard content)
<span style="color:blue;">dp</span> : Put the difference to the other window (clipboard content)
<span style="color:blue;">:diffupdate</span> : Refresh the diff highlighting
<span style="color:blue;">:q</span> : Quit one window
<span style="color:blue;">:qa</span> : Quit all windows

TIP! Setup <span style="color:blue;">aliase vd="vimdiffer"</span> in your .bashrc or .bash_aliases file.
