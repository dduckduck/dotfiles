local M = {}

function M.mostrar()
  vim.cmd("enew")
  local bufnr = vim.api.nvim_get_current_buf()

  vim.bo[bufnr].buftype = "nofile"
  vim.bo[bufnr].bufhidden = "wipe"
  vim.bo[bufnr].swapfile = false
  vim.wo[0].number = false
  vim.wo[0].relativenumber = false
  vim.wo[0].cursorline = false

  local lines = {
    "╔══════════════════════════════════╗",
    "║        BIENVENIDO A NEOVIM       ║",
    "╚══════════════════════════════════╝",
    "",
    "[e] Nuevo archivo",
    "[q] Salir",
    "",
    "Sesiones disponibles:",
  }

  -- Obtener las sesiones
  local sesion_dir = vim.fn.stdpath("data") .. "/sesiones"
  if vim.fn.isdirectory(sesion_dir) == 0 then
    vim.fn.mkdir(sesion_dir, "p")
  end

  local sesiones = vim.fn.glob(sesion_dir .. "/*.vim", false, true)

  for i, path in ipairs(sesiones) do
    local nombre = vim.fn.fnamemodify(path, ":t"):gsub("%%", "/"):gsub("%.vim$", "")
    table.insert(lines, string.format(" [%d] %s", i, nombre))

    vim.keymap.set("n", tostring(i), function()
      vim.cmd("source " .. vim.fn.fnameescape(path))
    end, { buffer = bufnr, desc = "Cargar sesión " .. nombre })
  end

  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)

  -- Atajos básicos
  vim.keymap.set("n", "e", ":enew<CR>", { buffer = bufnr, desc = "Nuevo archivo" })
  vim.keymap.set("n", "q", ":qa<CR>", { buffer = bufnr, desc = "Salir" })
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then
      M.mostrar()
    end
  end
})

return M

