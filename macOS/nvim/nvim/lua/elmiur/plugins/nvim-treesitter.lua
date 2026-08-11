-- Parsers to install. `main` has no `auto_install`, so this list is explicit.
local parsers = {
	"bash",
	"c",
	"cpp",
	"css",
	"git_rebase",
	"gitcommit",
	"gitignore",
	"glimmer",
	"go",
	"graphql",
	"html",
	"ini",
	"javascript",
	"json",
	"latex",
	"lua",
	"markdown",
	"markdown_inline",
	"nginx",
	"pem",
	"php",
	"python",
	"scss",
	"ssh_config",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
}

-- vimtex owns syntax/conceal for LaTeX; keep treesitter highlight off there.
local no_highlight = { "latex", "tex" }

-- Treesitter indent is experimental upstream; vimtex indents .tex better.
local no_indent = { "latex", "tex" }

local function attach(buf)
	local ft = vim.bo[buf].filetype
	if ft == "" then
		return
	end

	local lang = vim.treesitter.language.get_lang(ft)
	if not lang or not pcall(vim.treesitter.language.add, lang) then
		return -- no parser installed for this filetype
	end

	if not vim.tbl_contains(no_highlight, ft) then
		pcall(vim.treesitter.start, buf, lang)
	end

	if not vim.tbl_contains(no_indent, ft) and vim.treesitter.query.get(lang, "indents") then
		vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end
end

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		-- `main` does not support lazy-loading.
		lazy = false,
		build = ":TSUpdate",
		priority = 999,
		config = function()
			require("nvim-treesitter").setup({
				install_dir = vim.fn.stdpath("data") .. "/site",
			})

			require("nvim-treesitter").install(parsers)

			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("elmiur_treesitter", { clear = true }),
				callback = function(ev)
					attach(ev.buf)
				end,
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("nvim-treesitter-textobjects").setup({
				select = {
					lookahead = true, -- jump forward to textobj, like targets.vim
					include_surrounding_whitespace = false,
				},
				move = {
					set_jumps = true, -- record moves in the jumplist
				},
			})

			local select = require("nvim-treesitter-textobjects.select")
			local move = require("nvim-treesitter-textobjects.move")
			local swap = require("nvim-treesitter-textobjects.swap")

			local function sel(key, query, desc)
				vim.keymap.set({ "x", "o" }, key, function()
					select.select_textobject(query, "textobjects")
				end, { desc = desc })
			end

			-- assignments
			sel("a=", "@assignment.outer", "Select outer part of an assignment")
			sel("i=", "@assignment.inner", "Select inner part of an assignment")
			sel("l=", "@assignment.lhs", "Select left hand side of an assignment")
			sel("r=", "@assignment.rhs", "Select right hand side of an assignment")

			-- parameters
			sel("aa", "@parameter.outer", "Select outer part of a parameter")
			sel("ia", "@parameter.inner", "Select inner part of a parameter")

			-- functions
			sel("af", "@function.outer", "Select outer part of a function")
			sel("if", "@function.inner", "Select inner part of a function")

			-- classes
			sel("ac", "@class.outer", "Select outer part of a class")
			sel("ic", "@class.inner", "Select inner part of a class")

			local function mv(key, fn, query, desc)
				vim.keymap.set({ "n", "x", "o" }, key, function()
					fn(query, "textobjects")
				end, { desc = desc })
			end

			mv("]m", move.goto_next_start, "@function.outer", "Next function start")
			mv("]]", move.goto_next_start, "@class.outer", "Next class start")
			mv("]M", move.goto_next_end, "@function.outer", "Next function end")
			mv("][", move.goto_next_end, "@class.outer", "Next class end")
			mv("[m", move.goto_previous_start, "@function.outer", "Previous function start")
			mv("[[", move.goto_previous_start, "@class.outer", "Previous class start")
			mv("[M", move.goto_previous_end, "@function.outer", "Previous function end")
			mv("[]", move.goto_previous_end, "@class.outer", "Previous class end")

			vim.keymap.set("n", "<leader>s", function()
				swap.swap_next("@parameter.inner")
			end, { desc = "Swap with next parameter" })

			vim.keymap.set("n", "<leader>S", function()
				swap.swap_previous("@parameter.inner")
			end, { desc = "Swap with previous parameter" })
		end,
	},

	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			opts = {
				enable_close_on_slash = false,
			},
		},
	},

	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		lazy = true,
		init = function()
			vim.g.skip_ts_context_commentstring_module = true
		end,
		opts = {
			enable_autocmd = false,
		},
	},
}
