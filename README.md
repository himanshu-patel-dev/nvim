# nvim

## Install nvim

```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
```

add below line in `~/.bashrc`
```
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
```

## Getting Started
To start tutor, just open nvim and type `:Tutor`

- quit `:q`
- save `:wq`
- quit and discard `:q!`
- delete char in normal mode `x`
- append in the end of line (end of line + insert) `A`
- delete word `dw` (delete till the start of next word, space btw wors is also deletd)
- delete to end of line `d$`
- delete to the end of current word `de` (delete till the end of current word - space btw word is saved). 
- move to start of line `0`.
- move 2 words forward `2w`.
- move 2 words backward `2b`.
- delete a whole line `dd`.
- delete a line `dd`, delete 5 lines `5dd`.
- Undo `u`, undo whole line `U`.
- Use `p` to put/paste.
- Replace a char `r<char>` while in normal mode.
- Move to bottom of file `G` and start of file with `gg`.
- Search in forward direction `/`, search in backword direction `?`.
- Find next occurance in search `n`, find prev occurance `N`.
- Use `%` to jump to matching bracket (,[,{ etc.
- Find and Replace in line, `:s/old/new/g` without `g` this command only replace `old` with `new` in current line, first instance. While `g` replaced.
- Find and Replace in file, `:%s/old/new/g` - change all occurance in file. `:%s/old/new/gc` - change all occurange in file with prompt.
- Run any shell command, `:!ls`, i.e. `:!<command>`.
- Save current file `:w <filename>`. Select test after pressing `v` in normal mode and then save the file to write selected content to the file.
- Read the file content `r <FILENAME>` (this also read and paste the content into current file). This comes in handy when we have to paste output of a shell command into a file, then just do `r !ls`.
- Start new line and insert mode below the line of cursor - `o` (small O).
- Start new line and insert mode above the line of cursor - `O` (capital O).
- Start visual mode with `v` and select the test, press `y` to yank/copy the text and paste using `p`.
- Set options like this `:set hls is` (highlight search and partial matches) and `:set ic` (ignore case in search).
- Search only one word without ignoring case `/<word>\c`.
- Get some help `:help`. While opening help it opens in a split window. Use this command to switch between windows `<C-w><C-w>`



