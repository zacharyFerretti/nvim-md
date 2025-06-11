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

	local function invoke_prepend(keys, desc, chars)
		vim.keymap.set("n", keys, function()
			core.prepend(chars)
		end, { desc = desc })
	end

	-- Markdown commands under <leader>m
	map_wrap("<leader>mb", "󰉤 Bold", { "**", "**" })
	map_wrap("<leader>mi", "󰉷 Italic", { "*", "*" })
	map_wrap("<leader>ms", "󰊀 Strikethrough", { "~~", "~~" })
	map_wrap("<leader>mc", " C0DE", { "`", "`" })

	-- Header commands under `<leader>m - followed by number indicating what header level.
	invoke_prepend("<leader>m1", "󰉫 Header 1", "#")
	invoke_prepend("<leader>m2", "󰉬 Header 2", "##")
	invoke_prepend("<leader>m3", "󰉭 Header 3", "###")
	invoke_prepend("<leader>m4", "󰉮 Header 4", "####")
	invoke_prepend("<leader>m5", "󰉯 Header 5", "#####")
	invoke_prepend("<leader>m6", "󰉰 Header 6", "######")
end

return M
