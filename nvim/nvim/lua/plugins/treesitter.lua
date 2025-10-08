return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      auto_install = true,
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "query",
        "c",
        "elixir",
        "heex",
        "javascript",
        "html",
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
