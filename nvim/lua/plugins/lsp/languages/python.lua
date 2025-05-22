return {
  server = "pylsp",
  treesitter = "python",
  config = {
    settings = {
      pylsp = {
        plugins = {
          pycodestyle = {
            ignore = { "W391" },
            maxLineLength = 100,
          },
        },
      },
    },
  },
}

