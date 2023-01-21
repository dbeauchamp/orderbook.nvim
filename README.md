# orderbook.nvim

For when you don't want to leave your editor to see a token price.

## Installation

Using [plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'nvim-lua/plenary.nvim'
Plug 'dbeauchamp/orderbook.nvim'
```

Using [packer](https://github.com/wbthomason/packer.nvim):

```lua
use {
  'dbeauchamp/orderbook.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
}
```

## Usage
```lua
local ob = require('orderbook')
vim.keymap.set('n', '<leader>q', ob.price)
```
