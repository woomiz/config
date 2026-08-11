return {
	"lervag/vimtex",
	lazy = false,
	config = function()
		-- provide a list of |regular-expression|s for filtering out undesired errors and warnings.
		vim.g.vimtex_quickfix_ignore_filters = {
			"test text",
		}

		-- set latexmk config
		vim.g.vimtex_compiler_latexmk = {
			out_dir = "./output/",
		}

		-- control whether or not to automatically open the quickfix window in case there are warning messages and no error messages
		vim.g.vimtex_quickfix_open_on_warning = 0

		-- change graphic interface
		if vim.fn.has("mac") == 1 then
			vim.g.vimtex_view_method = "skim"
			vim.g.vimtex_view_skim_sync = 1
			vim.g.vimtex_view_skim_activate = 1
		else
			vim.g.vimtex_view_general_viewer = "okular"
			vim.g.vimtex_context_pdf_viewer = "okular"
		end

		-- Use this option to disable/enable syntax highlighting as provided by VimTeX.
		-- vim.g.vimtex_syntax_enabled = 0
		-- vim.g.vimtex_syntax_conceal_disable = 1
	end,
}
