Esto es mi configuración de Neovim que intenta ser lo más minimal posible. Para gestionar los plugins
se utiliza Lazy.nvim




# Plugins
En la carpeta plugins, cada archivo devuelve una tabla. Esta tiene el github del plugin y una función config con las caracteristicas de este plugin.
Un ejemplo podria ser el siguiente:

```lua
return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup({
            options = {
                theme = "gruvbox"
            }
        })
    end
}```

## 0.session
Gestión de sesiones para guardar y restaurar estados de trabajo.

## 1. NeoTree
Explorador de archivos para navegar y gestionar el sistema de ficheros.

## 2. Telescope
Fuzzy finder para búsqueda rápida de archivos, símbolos y más.

## 3. LSP

Este módulo configura el LSP (Language Server Protocol), que permite análisis semántico, navegación entre archivos, diagnóstico de errores y autocompletado inteligente.

Para simplificar y automatizar la configuración se usan los siguientes plugins:

- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig): conecta Neovim con servidores LSP instalados.
- [mason.nvim](https://github.com/mason-org/mason.nvim): gestiona la instalación y actualización de servidores LSP, linters y formatters.
- [mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim): puente entre Mason y LSPConfig.
- [mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim): instala herramientas adicionales como linters y formatters.
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp): conecta los servidores LSP con el sistema de autocompletado `nvim-cmp`.
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): proporciona resaltado de sintaxis, plegado e indentación basada en el árbol sintáctico del lenguaje.

La configuración de cada lenguaje se define en archivos individuales dentro de `lua/plugins/lsp/languages/`, permitiendo modularidad. Cada uno exporta el nombre del servidor LSP y el nombre del parser de Treesitter.

## 4. Completions

Sistema de autocompletado con soporte para snippets, firmas de funciones y cierre automático de paréntesis.

Plugins usados:

- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp): motor principal de autocompletado.
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip): motor de snippets.
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets): colección de snippets listos para usar.
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs): cierra paréntesis, comillas, etc. automáticamente.
- [cmp-nvim-lsp-signature-help](https://github.com/hrsh7th/cmp-nvim-lsp-signature-help): muestra ayuda de funciones al escribir.


## 5. Statusline
Muestra barra de estado con la información sobre el archivo,  carpeta y ventana. 

[Lualine](https://github.com/nvim-lualine/lualine.nvim)
## 6. whichkey
Utilidad para mostrar los atajos de teclado. Ayuda a familiarizarte con el flujo de neovim.
[Whichkey](https://github.com/folke/which-key.nvim)

## 7. colorscheme
Este archivo se encarga de configurar la apariencia (theme) de neovim.
[Catppuccin](https://github.com/catppuccin/nvim)

## 8. barbar
Plugin para configurar pestañas (tabs).
[Barbar](https://github.com/romgrk/barbar.nvim)

## 9. indent

Muestra guías de indentación para mejorar la legibilidad del código
