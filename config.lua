-- ~/.config/lvim/config.lua
-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.keys.normal_mode["<leader>="] = ":vertical resize +2<CR>"
lvim.keys.normal_mode["<leader>-"] = ":vertical resize -2<CR>"
lvim.keys.normal_mode["<leader>+"] = ":resize +2<CR>"
lvim.keys.normal_mode["<leader>_"] = ":resize -2<CR>"
lvim.keys.normal_mode["<tab>"] = ":bn<CR>"
lvim.keys.normal_mode["<leader>p"] = "\"+p" -- past from clipboard

vim.opt.relativenumber = true
