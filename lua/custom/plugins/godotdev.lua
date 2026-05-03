return {
  'Mathijs-Bakker/godotdev.nvim',
  config = function()
    require("godotdev").setup({
      csharp = true,
      treesitter = {
        auto_setup = false,
      },
    })
  end,
}