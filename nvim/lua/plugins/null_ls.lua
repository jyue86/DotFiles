return {
	"jose-elias-alvarez/null-ls.nvim",
  event = "BufReadPre",
  config = function (_, opts)
    local null_ls_status_ok, null_ls = pcall(require, "null-ls")
    if not null_ls_status_ok then
      return
    end

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint.with({
          filetypes = {
            "json",
            "svelte",
            "typescript",
          },
        }),
        null_ls.builtins.formatting.prettierd.with({
          command = "prettierd",
          filetypes = {
            "json",
            "svelte",
            "typescript",
          },
        }),
        null_ls.builtins.formatting.clang_format.with({
          filetypes = {
            "cpp",
            "hpp",
          },
        }),
        null_ls.builtins.formatting.cmake_format.with({
          filetypes = {
            ".txt",
          },
        }),
        null_ls.builtins.formatting.isort,
        -- null_ls.builtins.diagnostics.flake8,
      },
    })
  end
}
