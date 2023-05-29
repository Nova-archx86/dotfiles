local status_ok, packer = pcall(require, 'packer')
if not status_ok then
	print 'Error: Packer is not installed!'
	return
end

packer.startup(function()
	use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
}
	use { 'catppuccin/nvim', as = 'catppuccin' }
	use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
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
	use {'romgrk/barbar.nvim', requires = 'nvim-web-devicons'}
end)
