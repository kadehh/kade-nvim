-- kade-nvim: A collection of adjusted Neovim colorschemes with bright, readable comments
-- Each theme maintains its original aesthetic while ensuring comments are easily readable

local M = {}

M.config = {
  theme = "kade-tokyonight", -- default theme
  transparent = false,
  terminal_colors = true,
}

-- Available themes in the collection
M.themes = {
  "kade-tokyonight",
  "kade-duckybones",
  "kade-nord",
  "kade-moonlight",
  "kade-terafox",
  "kade-kanagawa",
  "kade-rosepine",
  "kade-catppuccin",
}

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

function M.load(theme)
  theme = theme or M.config.theme

  -- Clear existing highlights
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = theme

  -- Load the specific theme
  local theme_module = "kade.themes." .. theme:gsub("kade%-", "")
  local ok, theme_colors = pcall(require, theme_module)

  if not ok then
    vim.notify("kade-nvim: Theme '" .. theme .. "' not found", vim.log.levels.ERROR)
    return
  end

  theme_colors.load(M.config)
end

return M
