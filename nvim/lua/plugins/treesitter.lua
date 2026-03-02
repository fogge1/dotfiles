return {
	{
		-- install tree-sitter-cli
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		build = ':TSUpdate',
		config = function()
			require'nvim-treesitter'.setup {
				install_dir = vim.fn.stdpath('data') .. '/site'
			}

			require'nvim-treesitter'.install{'python', 'cpp', 'c', 'java', 'rust', 'javascript'}
			vim.api.nvim_create_autocmd('FileType', {
				pattern = { "python", "cpp", "c", "java", "rust", "javascript", "lua" },
				callback = function() vim.treesitter.start() end,
			})
		end,
	},
}


