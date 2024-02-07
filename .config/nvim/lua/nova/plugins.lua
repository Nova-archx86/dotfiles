local status_ok, packer = pcall(require, 'packer')
if not status_ok then
	print '[Error] Packer is not installed!'
	return
end

packer.startup(function()
	use "EdenEast/nightfox.nvim"	
	use 'williamboman/mason.nvim'
	use 'nvim-treesitter/nvim-treesitter'
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'L3MON4D3/LuaSnip'
 	use 'saadparwaiz1/cmp_luasnip'
	use 'patstockwell/vim-monokai-tasty'
	use 'bluz71/vim-nightfly-colors'
	use {"akinsho/toggleterm.nvim", tag = '*', config = function()
  require("toggleterm").setup()
	end}
	use 'tanvirtin/monokai.nvim'
	use 'ellisonleao/gruvbox.nvim'
	use({ 'toppair/peek.nvim', run = 'deno task --quiet build:fast' })
end)
