local M = {}

M.setup = function()
	local map = vim.keymap.set
	local core = require("nvim_md.core")

	local function map_wrap(keys, desc, chars)
		-- For visual mode: call function directly while still in visual mode
		map("v", keys, function()
			core.wrap_or_unwrap(chars)
		end, { desc = desc .. " (selection)" })

		-- For normal mode: select word and then call function
		map("n", keys, function()
			vim.cmd("normal! viw") -- Select word under cursor
			core.wrap_or_unwrap(chars) -- Call immediately while still in visual mode
		end, { desc = desc .. " (word)" })
	end

	-- Markdown commands under <leader>m
	map_wrap("<leader>mb", "󰉤 Bold", { "**", "**" })
	map_wrap("<leader>mi", "󰉷 Italic", { "*", "*" })
	map_wrap("<leader>ms", "󰊀 Strikethrough", { "~~", "~~" })
	map_wrap("<leader>mc", "  C0DE", { "`", "`" })
end

return M
