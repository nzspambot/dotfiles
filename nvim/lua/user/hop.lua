local status_ok, hop = pcall(require, "hop")
if not status_ok then
  return
end

hop.setup{}

vim.keymap.set("n", "<leader>hw", "<CMD>HopWord<CR>", {})
vim.keymap.set("n", "<leader>hl", "<CMD>HopLine<CR>", {})
vim.keymap.set("n", "<leader>hc", "<CMD>HopChar1<CR>", {})
vim.keymap.set("n", "<leader>hp", "<CMD>HopPattern<CR>", {})
vim.keymap.set("n", "<leader>hs", "<CMD>HopLineStart<CR>", {})
vim.keymap.set("n", "<leader>haw", "<CMD>HopWordMW<CR>", {})
vim.keymap.set("n", "<leader>hal", "<CMD>HopLineMW<CR>", {})
vim.keymap.set("n", "<leader>hac", "<CMD>HopChar1MW<CR>", {})
vim.keymap.set("n", "<leader>hap", "<CMD>HopPatternMW<CR>", {})
vim.keymap.set("n", "<leader>has", "<CMD>HopLineStartMW<CR>", {})
