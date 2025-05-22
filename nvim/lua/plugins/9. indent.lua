return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = {
      char = "|",  -- Cambia a un carácter que parezca más grueso
      highlight = { "IblIndent" },
    },
    scope = {
      enabled = true,
      char = "┆",
      show_start = true,
      show_end = true,
    },
    whitespace = {
      remove_blankline_trail = false,
    },
  },
}

