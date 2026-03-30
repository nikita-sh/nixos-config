return {
  {
    "mrcjkb/haskell-tools.nvim",
    version = "^4",
    lazy = false,
    config = function()
      vim.g.haskell_tools = {
        hls = {
          on_attach = function(client, bufnr)
            local opts = { buffer = bufnr }
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          end,
        },
      }
    end,
  },
}
