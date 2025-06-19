# Minimal NeoVim setup
Yet another minimal setup that focuses on simplicity and claritty. 

# Structure
Its organized in logical folders to separate concerns.

## plugins/lsp:
Handles everying related to lsp, mason and treesitter.
To add new languages modify ```languages.lua```.
Each language should provide a name for mason, treesitter and optionally tools like formatters or linters.

## plugins/completions
Adds support for autocompletion and snippets. Nothing fancy here.

## plugins/git
Integrates git into neovim


# Plugins summary
![plugins summary](img/Screenshot_plugins.png)
