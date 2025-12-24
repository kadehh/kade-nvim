-- Plugin loader for kade-nvim
if vim.g.loaded_kade then
  return
end
vim.g.loaded_kade = true

-- Create commands for each theme
local themes = {
  "kade-tokyonight",
  "kade-duckybones",
  "kade-nord",
  "kade-moonlight",
  "kade-terafox",
  "kade-kanagawa",
  "kade-rosepine",
  "kade-catppuccin",
}

-- Main colorscheme command
vim.api.nvim_create_user_command("Kade", function(opts)
  local theme = opts.args
  if theme == "" then
    theme = nil
  end
  require("kade").load(theme)
end, {
  nargs = "?",
  complete = function()
    return themes
  end,
})
