function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

--	vim.api.nvim_set_hl(0, "Normal", {})
--	vim.api.nvim_set_hl(0, "NormalFloat", {})
end
-- vim.api.nvim_set_hl(0, "Normal", {})
 ColorMyPencils();
