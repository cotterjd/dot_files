-- ~/.config/lvim/config.lua
-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.keys.normal_mode["<leader>="] = ":vertical resize +2<CR>" -- +
lvim.keys.normal_mode["<leader>-"] = ":vertical resize -2<CR>" -- -
lvim.keys.normal_mode["<leader>+"] = ":resize +2<CR>" -- shift +
lvim.keys.normal_mode["<leader>_"] = ":resize -2<CR>" -- shift -
lvim.keys.normal_mode["<tab>"] = ":bn<CR>"
lvim.keys.normal_mode["<leader>p"] = "\"+p" -- past from clipboard
lvim.keys.normal_mode["<leader>v"] = ":vsp<CR>" -- v for vertical
lvim.keys.normal_mode["<leader>s"] = ":sp<CR>" -- s for split
lvim.keys.normal_mode["<leader>rn"] = ":set relativenumber<CR>" -- relativenumber is set by default (see below). this is to be used with the explorer


vim.opt.relativenumber = true
vim.opt.foldmethod = "indent"

lvim.plugins = {
  { "github/copilot.vim" },
}
