local M = {}

-- Check if text is already wrapped
local function isWrapped(text, start, end_)
	return text:sub(1, #start) == start and text:sub(-#end_) == end_
end

function M.wrap_or_unwrap(chars)
	local start, end_ = unpack(chars)

	-- Check current mode to see if we're still in visual mode
	local mode = vim.api.nvim_get_mode().mode

	local text
	if mode:match("^[vV\x16]") then
		-- Still in visual mode, yank the selection
		vim.cmd('normal! "xy')
		text = vim.fn.getreg("x")
	else
		-- Not in visual mode, try to get from visual marks
		vim.cmd('normal! `<v`>"xy') -- Select from start mark to end mark and yank
		text = vim.fn.getreg("x")
	end

	if not text or text == "" then
		vim.notify("No text selected.", vim.log.levels.WARN)
		return
	end

	-- Check if the text looks corrupted
	if text:match("c+>") then
		vim.notify("Detected corrupted selection. Try the operation again.", vim.log.levels.ERROR)
		return
	end

	local new_text
	if isWrapped(text, start, end_) then
		-- Unwrap: remove the wrapper characters
		new_text = text:sub(#start + 1, -#end_ - 1)
	else
		-- Wrap: add the wrapper characters
		new_text = start .. text .. end_
	end

	-- Put the new text back
	vim.fn.setreg("x", new_text)

	-- Reselect the same area and paste
	vim.cmd('normal! gv"xp')
end

return M
