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


