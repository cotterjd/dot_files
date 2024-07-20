-- ~/.config/lvim/config.lua
-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.keys.normal_mode["<leader>="] = ":vertical resize +5<CR>" -- +
lvim.keys.normal_mode["<leader>-"] = ":vertical resize -5<CR>" -- -
lvim.keys.normal_mode["<leader>+"] = ":resize +5<CR>" -- shift +
lvim.keys.normal_mode["<leader>_"] = ":resize -5<CR>" -- shift -
lvim.keys.normal_mode["<tab>"] = ":bn<CR>"
lvim.keys.normal_mode["<leader>p"] = "\"+p" -- past from clipboard
lvim.keys.normal_mode["<leader>v"] = ":vsp<CR>" -- v for vertical
lvim.keys.normal_mode["<leader>s"] = ":sp<CR>" -- s for split
lvim.keys.normal_mode["<leader>rn"] = ":set relativenumber<CR>" -- relativenumber is set by default (see below). this is to be used with the explorer

vim.opt.relativenumber = true
vim.opt.foldmethod = "indent"

vim.cmd([[
  command! -nargs=0 ShowFilePath lua print(vim.api.nvim_buf_get_name(0))
]])

local function open_tree_and_set_relativenumber()
    vim.cmd([[NvimTreeToggle]])
    vim.cmd([[set relativenumber]])
end
vim.keymap.set('n', '<leader>e', open_tree_and_set_relativenumber, { remap = true })

lvim.plugins = {
  { "github/copilot.vim" },
  { "neovim/nvim-lspconfig" },
  { "jose-elias-alvarez/null-ls.nvim" },
  { "MunifTanjim/prettier.nvim" },
  {
    "ray-x/lsp_signature.nvim", -- show signature when using function
    event = "VeryLazy",
    opts = {},
    config = function(_, opts) require'lsp_signature'.setup(opts) end
  }
}

local null_ls = require("null-ls")

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

null_ls.setup({
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      -- vim.keymap.set("n", "<Leader>r", function()
      --   vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
      -- end, { buffer = bufnr, desc = "[lsp] format" })

      -- format on save
      vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
      vim.api.nvim_create_autocmd(event, {
        buffer = bufnr,
        group = group,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr, async = async })
        end,
        desc = "[lsp] format on save",
      })
    end

    -- if client.supports_method("textDocument/rangeFormatting") then
    --   vim.keymap.set("x", "<Leader>r", function()
    --     vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
    --   end, { buffer = bufnr, desc = "[lsp] format" })
    -- end
  end,
})

local prettier = require("prettier")

prettier.setup({
  bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
})

