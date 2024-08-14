local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
require("telescope").load_extension('harpoon')

vim.keymap.set("n", "<leader>a", mark.add_file, { desc = '[A]dd file to marks'})
vim.keymap.set("n", "<C-e>", ":Telescope harpoon marks<CR>", opts)
vim.keymap.set("n", "<C-m>", ui.toggle_quick_menu)
vim.keymap.set("n", "<C-n>", ui.nav_next, { desc = '[N]ext harpooned file'})
vim.keymap.set("n", "<C-p>", ui.nav_prev, { desc = '[P]revious harpooned file})
