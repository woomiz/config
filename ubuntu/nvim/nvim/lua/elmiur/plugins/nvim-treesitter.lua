return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"JoosepAlviste/nvim-ts-context-commentstring",
			"windwp/nvim-ts-autotag",
		},
		priority = 999,
		opts = {
			-- Add languages to be installed here that you want installed for treesitter
			ensure_installed = {
				"c",
				"cpp",
				"css",
				"go",
				"graphql",
				"html",
				"javascript",
				"typescript",
				"lua",
				"python",
				"scss",
				"tsx",
				"vim",
				"vimdoc",
			},

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,

			indent = { enable = true },

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},

			highlight = {
				-- `false` will disable the whole extension
				enable = true,

				-- disable highlight for latex files
				disable = { "latex" },

				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,
			},

			-- nvim-ts-context-commentstring config
			ts_context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},

			-- nvim-treesitter-textobjects configs
			autotag = {
				enable = true,
				enable_close_on_slash = false,
			},

			-- nvim-treesitter-textobjects config
			textobjects = {
				select = {
					enable = true,
					lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
					keymaps = {
						-- for assignments
						["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
						["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
						["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
						["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

						["aa"] = "@parameter.outer",
						["ia"] = "@parameter.inner",

						-- for functions
						["af"] = "@function.outer",
						["if"] = "@function.inner",

						-- for classes
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
					},
				},
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						["]m"] = "@function.outer",
						["]]"] = "@class.outer",
					},
					goto_next_end = {
						["]M"] = "@function.outer",
						["]["] = "@class.outer",
					},
					goto_previous_start = {
						["[m"] = "@function.outer",
						["[["] = "@class.outer",
					},
					goto_previous_end = {
						["[M"] = "@function.outer",
						["[]"] = "@class.outer",
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>s"] = "@parameter.inner",
					},
					swap_previous = {
						["<leader>S"] = "@parameter.inner",
					},
				},
			},
		},
		config = function(_, opts)
			-- For nvim-ts-context-commentstring
			vim.g.skip_ts_context_commentstring_module = true

			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
