return {
  cmd = { "sifr", "lsp", "--stdio" },
  filetypes = { "sifr" },
  root_markers = { "sifr.toml", ".git" },
  settings = {
    sifr = {
      diagnostics = {
        mode = "open-files",
      },
      format = {
        enable = true,
      },
      lint = {
        enable = true,
      },
    },
  },
  on_attach = function(_, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end,
    })
  end,
}
