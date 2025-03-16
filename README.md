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
- Whlie in file do `:Ex` to open explorer, and while in explorer do `%` to create a new file.


## Kick Start NVIM
- https://github.com/nvim-lua/kickstart.nvim?tab=readme-ov-file

Install dependencies as
```
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip neovim
```


Install Kickstart init.lua
```
git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

Open Lazy in nvim
```
:Lazy
```

- Updated `init.lua` to ignore arrow keys.
```
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
```

- source `init.lua` as `source %`
- Move between windows/splits using `CTRL+h/j/k/l`
- Open terminal as `:terminal` and press `i` to start typeing in terminal. Then use `<Esc><Esc>` to move out. If this don't work then use `CTRL+\,CTRL+n`.
- Split vertically `CTRL+w , v`, or `:vsplit`.
- Split Horizontally `CTRL+w, s`, or `:split`.
- Reset size of split `CTRL+w, =`.
- Change Horizontal split to vertical

- Put this in `init.lua` to use Alt for changing split orientation.
```bash
-- Use Alt key to change orientation of splits
vim.keymap.set('n', '<M-1>', '<C-w>t<C-w>K', { desc = 'Convert vertical to horizontal split' })
vim.keymap.set('n', '<M-2>', '<C-w>t<C-w>H', { desc = 'Convert horizontal to vertical split' })
```

## Plugins
Create a dir `~/.config/nvim/lua/custom/plugins/` if not already exits. Any file inside `plugins` dir will be source in `init.lua`. This directory is specifically for user's custom plugins other than the plugins that comes with kickstart.

Add this lines in `init.lua` to so we import the plugins from these two places, these lines import plugins from `~/.config/nvim/lua/kickstart/plugins/` and `~/.config/nvim/lua/custom/plugins/` without overriding over the plugins already present in it.

```lua
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  { import = 'kickstart.plugins' }, -- Keep existing Kickstart plugins
  { import = 'custom.plugins' }, -- Load your custom plugins
```

- Terminal

Make a file `toggleterm.lua` and save this into the file

```lua
return {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        size = 15, -- Height for horizontal terminal
        open_mapping = [[<C-\>]], -- Default key to toggle
        shade_terminals = true,
        direction = 'float', -- Options: 'vertical' | 'horizontal' | 'tab' | 'float'
        float_opts = {
          border = 'curved', -- 'single', 'double', 'shadow', 'curved'
        },
      }

    -- Keymaps
    -- vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Toggle horizontal terminal" })
    -- vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", { desc = "Toggle vertical terminal" })

    end,
}
```
  - `CTRL+\` to toggle terminal, terminal retains state.
  - For more: https://github.com/akinsho/toggleterm.nvim

- Comment

Make a file `comment.lua` and save this into the file
```lua
return {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup()
  end,
}
```
  - `gcc` comment one line
  - `gbc` comment one line using block comment
  - `gc` comment selection in visual mode
  - `gb` comment selection in visual mode using block comment
  - For more: https://github.com/numToStr/Comment.nvim

- Telescope

  - `<leader>sh` to pop open fuzzy file search.
```lua
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })


      -- Jump to the definition of the word under your cursor.
      --  This is where a variable was first declared, or where a function is defined, etc.
      --  To jump back, press <C-t>.
      map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

      -- Find references for the word under your cursor.
      map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

      -- Jump to the implementation of the word under your cursor.
      --  Useful when your language has ways of declaring types without an actual implementation.
      map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

      -- Jump to the type of the word under your cursor.
      --  Useful when you're not sure what type a variable is and you want to see
      --  the definition of its *type*, not where it was *defined*.
      map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

      -- Fuzzy find all the symbols in your current document.
      --  Symbols are things like variables, functions, types, etc.
      map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

      -- Fuzzy find all the symbols in your current workspace.
      --  Similar to document symbols, except searches over your entire project.
      map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

      -- Rename the variable under your cursor.
      --  Most Language Servers support renaming across files, etc.
      map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

      -- Execute a code action, usually your cursor needs to be on top of an error
      -- or a suggestion from your LSP for this to activate.
      map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

      -- WARN: This is not Goto Definition, this is Goto Declaration.
      --  For example, in C this would take you to the header.
      map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

```

## LSP for Ruby - Solargraph

- Install solargraph `gem install solargraph`
- Make `solargraph.yml` file in rails directory

```yml
---
include:
  - "app/**/*.rb"
  - "lib/**/*.rb"
exclude:
  - "db/schema.rb"
  - "db/migrate/**/*.rb"
  - "config/**/*.rb"
  - "vendor/**/*.rb"
  - "spec/**/*.rb"
  - "test/**/*.rb"
  - "node_modules/**/*.rb"
  - "tmp/**/*.rb"
  - "log/**/*.rb"
require: []
domains: []
reporters:
  - rubocop
plugins:
  - solargraph-rails
```
- Update `init.lua` to have below changes
```lua
{
  solargraph = {
    filetypes = { 'ruby' },
  },

  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
      },
    },
  },
}
```
And here
```lua
vim.list_extend(ensure_installed, {
  'stylua',     -- Used to format Lua code
  'solargraph', -- Added Solargraph to Mason install list
})
```


- Use `:LspInfo` and check if you see below output

```bash
 lspconfig: require("lspconfig.health").check()    
      
  LSP configs active in this session (globally)    
  - Configured servers: solargraph, lua_ls    
  - OK Deprecated servers: (none)    
      
  LSP configs active in this buffer (bufnr: 1)    
  - Language client log: ~/.local/state/nvim/lsp.log    
  - Detected filetype: ruby    
  - 1 client(s) attached to this buffer    
  - Client: solargraph (id: 1, bufnr: [1, 28])    
    root directory:    ~/Workspace/repos/adwyze/    
    filetypes:         ruby    
    cmd:               ~/.local/share/nvim/mason/bin/solargraph stdio    
    version:           0.52.0    
    executable:        true    
    autostart:         true    
      
  Docs for active configs:    
  - solargraph docs:
```


## To Do
- Checkout this one: https://github.com/lewis6991/gitsigns.nvim
- Save editor state when quit
- Manage multiple tabs
- Max or Minimize splits

