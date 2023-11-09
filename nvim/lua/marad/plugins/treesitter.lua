return {
	'nvim-treesitter/nvim-treesitter',
	build = ":TSUpdate",
	config = function()
		require('nvim-treesitter.configs').setup({
			ensure_installed = {
				"java", "kotlin", "rust", "c", "lua", "vim", "vimdoc", "query"
			},
			sync_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			}
		})

		--require('nvim-treesitter.install').compilers = { "clan
	end,
}
