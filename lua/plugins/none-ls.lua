return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- Formatters
				null_ls.builtins.formatting.stylua, -- Lua formatter
				null_ls.builtins.formatting.clang_format, -- C/C++ formatter
				null_ls.builtins.formatting.shellharden, -- Bash/Shell scripts formatter
      },
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}

