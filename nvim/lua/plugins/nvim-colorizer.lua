return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      css = { hsl_fn = true, rgb_fn = true },
    })
  end,
}
