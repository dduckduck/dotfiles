return {
  "catppuccin/nvim",
    name = "catppuccin",
  lazy = false, -- Asegúrate de cargar esto durante el inicio si es tu esquema de colores principal
  priority = 1000, -- Asegúrate de cargar esto antes que todos los demás plugins de inicio
  config = function()
        require("catppuccin").setup({
      flavour = "mocha", -- Puedes usar "latte", "frappe", "macchiato" o "mocha"
      transparent_background = true, -- Activa la transparencia
      term_colors = true, -- Ajusta los colores del terminal
    default_integrations = true,
    })

    -- Cargar el esquema de colores aquí
    vim.cmd([[colorscheme catppuccin]])

    -- Configurar la transparencia
  end,
}
