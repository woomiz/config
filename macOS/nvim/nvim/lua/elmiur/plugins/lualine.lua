return {
	"nvim-lualine/lualine.nvim",
	event = { "VimEnter", "BufReadPost", "BufNewFile" },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local attached_clients = {
			require("elmiur.utils.lualine").get_attached_clients,
			color = {
				gui = "bold",
			},
		}
		-- Example lualine setup
		require("lualine").setup({
			options = {
				theme = "catppuccin-nvim",
				globalstatus = true,
			},

			sections = {
				lualine_b = { "branch", "diff" },
				lualine_x = { attached_clients, "diagnostics", "filetype" },
			},
		})
	end,
}
