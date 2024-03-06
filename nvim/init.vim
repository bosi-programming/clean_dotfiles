source ~/dotfiles/vim/basics.vim

luafile ~/dotfiles/nvim/plugins/packer.lua
luafile ~/dotfiles/nvim/plugins/telescope.lua
luafile ~/dotfiles/nvim/plugins/treesitter.lua
luafile ~/dotfiles/nvim/plugins/harpoon.lua
luafile ~/dotfiles/nvim/plugins/null.lua
luafile ~/dotfiles/nvim/plugins/lsp.lua
luafile ~/dotfiles/nvim/plugins/hop.lua
luafile ~/dotfiles/nvim/plugins/indent_blankline.lua
luafile ~/dotfiles/nvim/plugins/toggleTerm.lua
luafile ~/dotfiles/nvim/plugins/lightbulb.lua
luafile ~/dotfiles/nvim/plugins/which-key.lua

source ~/dotfiles/vim/plugins/fugitive.vim
source ~/dotfiles/vim/global_remaps.vim
luafile ~/dotfiles/nvim/remaps.lua

" has remap that overrides my remap
luafile ~/dotfiles/nvim/plugins/oil.lua

source ~/dotfiles/nvim/theme.vim
source ~/dotfiles/vim/functions.vim
source ~/dotfiles/vim/scripts/react.vim
source ~/dotfiles/vim/scripts/java.vim
