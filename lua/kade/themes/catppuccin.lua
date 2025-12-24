-- kade-catppuccin: Catppuccin Mocha with bright, readable comments
-- Based on catppuccin/nvim (mocha variant)

local M = {}

local colors = {
  -- Mocha palette (darkest variant)
  rosewater = "#f5e0dc",
  flamingo = "#f2cdcd",
  pink = "#f5c2e7",
  mauve = "#cba6f7",
  red = "#f38ba8",
  maroon = "#eba0ac",
  peach = "#fab387",
  yellow = "#f9e2af",
  green = "#a6e3a1",
  teal = "#94e2d5",
  sky = "#89dceb",
  sapphire = "#74c7ec",
  blue = "#89b4fa",
  lavender = "#b4befe",

  text = "#cdd6f4",
  subtext1 = "#bac2de",
  subtext0 = "#a6adc8",
  overlay2 = "#9399b2",
  overlay1 = "#7f849c",
  overlay0 = "#6c7086",
  surface2 = "#585b70",
  surface1 = "#45475a",
  surface0 = "#313244",
  base = "#1e1e2e",
  mantle = "#181825",
  crust = "#11111b",

  -- KADE MODIFICATION: Bright, vivid comments using lavender
  -- Original overlay0: #6c7086 (muted, hard to read)
  -- New: Lavender - bright pastel that fits the Catppuccin aesthetic
  comment = "#b4befe",

  none = "NONE",
}

function M.load(config)
  local utils = require("kade.utils")
  config = config or {}

  -- Terminal colors
  if config.terminal_colors then
    vim.g.terminal_color_0 = colors.surface1
    vim.g.terminal_color_1 = colors.red
    vim.g.terminal_color_2 = colors.green
    vim.g.terminal_color_3 = colors.yellow
    vim.g.terminal_color_4 = colors.blue
    vim.g.terminal_color_5 = colors.pink
    vim.g.terminal_color_6 = colors.teal
    vim.g.terminal_color_7 = colors.subtext1
    vim.g.terminal_color_8 = colors.surface2
    vim.g.terminal_color_9 = colors.red
    vim.g.terminal_color_10 = colors.green
    vim.g.terminal_color_11 = colors.yellow
    vim.g.terminal_color_12 = colors.blue
    vim.g.terminal_color_13 = colors.pink
    vim.g.terminal_color_14 = colors.teal
    vim.g.terminal_color_15 = colors.text
  end

  local bg = config.transparent and colors.none or colors.base

  local highlights = {
    -- Editor
    Normal = { fg = colors.text, bg = bg },
    NormalFloat = { fg = colors.text, bg = colors.mantle },
    FloatBorder = { fg = colors.blue, bg = colors.mantle },
    ColorColumn = { bg = colors.surface0 },
    Cursor = { fg = colors.base, bg = colors.text },
    CursorLine = { bg = colors.surface0 },
    CursorColumn = { bg = colors.surface0 },
    CursorLineNr = { fg = colors.lavender, bold = true },
    LineNr = { fg = colors.surface1 },
    SignColumn = { fg = colors.surface1, bg = bg },
    VertSplit = { fg = colors.surface0 },
    WinSeparator = { fg = colors.surface0 },
    Folded = { fg = colors.blue, bg = colors.surface1 },
    FoldColumn = { fg = colors.overlay0, bg = bg },
    IncSearch = { fg = colors.mantle, bg = colors.peach },
    Search = { fg = colors.text, bg = colors.surface2 },
    CurSearch = { fg = colors.mantle, bg = colors.peach },
    MatchParen = { fg = colors.peach, bold = true },
    ModeMsg = { fg = colors.text, bold = true },
    MoreMsg = { fg = colors.blue },
    NonText = { fg = colors.overlay0 },
    Pmenu = { fg = colors.text, bg = colors.mantle },
    PmenuSel = { fg = colors.text, bg = colors.surface1 },
    PmenuSbar = { bg = colors.surface1 },
    PmenuThumb = { bg = colors.overlay0 },
    Question = { fg = colors.blue },
    QuickFixLine = { bg = colors.surface1, bold = true },
    SpecialKey = { fg = colors.overlay0 },
    StatusLine = { fg = colors.text, bg = colors.mantle },
    StatusLineNC = { fg = colors.surface1, bg = colors.mantle },
    TabLine = { fg = colors.surface1, bg = colors.mantle },
    TabLineFill = { bg = colors.mantle },
    TabLineSel = { fg = colors.green, bg = colors.surface1 },
    Title = { fg = colors.blue, bold = true },
    Visual = { bg = colors.surface1 },
    VisualNOS = { bg = colors.surface1 },
    WarningMsg = { fg = colors.yellow },
    Whitespace = { fg = colors.surface1 },
    WildMenu = { bg = colors.surface1 },

    -- Syntax - KADE bright comments
    Comment = { fg = colors.comment, italic = true },

    Constant = { fg = colors.peach },
    String = { fg = colors.green },
    Character = { fg = colors.teal },
    Number = { fg = colors.peach },
    Boolean = { fg = colors.peach },
    Float = { fg = colors.peach },

    Identifier = { fg = colors.flamingo },
    Function = { fg = colors.blue },

    Statement = { fg = colors.mauve },
    Conditional = { fg = colors.mauve },
    Repeat = { fg = colors.mauve },
    Label = { fg = colors.sapphire },
    Operator = { fg = colors.sky },
    Keyword = { fg = colors.mauve, italic = true },
    Exception = { fg = colors.mauve },

    PreProc = { fg = colors.pink },
    Include = { fg = colors.mauve },
    Define = { fg = colors.mauve },
    Macro = { fg = colors.mauve },
    PreCondit = { fg = colors.pink },

    Type = { fg = colors.yellow },
    StorageClass = { fg = colors.yellow },
    Structure = { fg = colors.yellow },
    Typedef = { fg = colors.yellow },

    Special = { fg = colors.pink },
    SpecialChar = { fg = colors.pink },
    Tag = { fg = colors.lavender },
    Delimiter = { fg = colors.overlay2 },
    SpecialComment = { fg = colors.comment },
    Debug = { fg = colors.peach },

    Underlined = { fg = colors.blue, underline = true },
    Bold = { bold = true },
    Italic = { italic = true },
    Ignore = { fg = colors.overlay0 },
    Error = { fg = colors.red },
    Todo = { fg = colors.base, bg = colors.yellow, bold = true },

    -- Diagnostics
    DiagnosticError = { fg = colors.red },
    DiagnosticWarn = { fg = colors.yellow },
    DiagnosticInfo = { fg = colors.sky },
    DiagnosticHint = { fg = colors.teal },
    DiagnosticUnderlineError = { undercurl = true, sp = colors.red },
    DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellow },
    DiagnosticUnderlineInfo = { undercurl = true, sp = colors.sky },
    DiagnosticUnderlineHint = { undercurl = true, sp = colors.teal },

    -- Git
    DiffAdd = { bg = "#2e4235" },
    DiffChange = { bg = "#2e3244" },
    DiffDelete = { bg = "#443344" },
    DiffText = { bg = "#3e4955" },
    diffAdded = { fg = colors.green },
    diffChanged = { fg = colors.blue },
    diffRemoved = { fg = colors.red },

    -- TreeSitter
    ["@comment"] = { link = "Comment" },
    ["@constant"] = { fg = colors.peach },
    ["@constant.builtin"] = { fg = colors.peach },
    ["@constant.macro"] = { fg = colors.mauve },
    ["@string"] = { fg = colors.green },
    ["@string.escape"] = { fg = colors.pink },
    ["@string.regex"] = { fg = colors.peach },
    ["@character"] = { fg = colors.teal },
    ["@number"] = { fg = colors.peach },
    ["@boolean"] = { fg = colors.peach },
    ["@float"] = { fg = colors.peach },
    ["@function"] = { fg = colors.blue },
    ["@function.builtin"] = { fg = colors.peach },
    ["@function.macro"] = { fg = colors.teal },
    ["@parameter"] = { fg = colors.maroon },
    ["@method"] = { fg = colors.blue },
    ["@field"] = { fg = colors.lavender },
    ["@property"] = { fg = colors.lavender },
    ["@constructor"] = { fg = colors.sapphire },
    ["@conditional"] = { fg = colors.mauve },
    ["@repeat"] = { fg = colors.mauve },
    ["@label"] = { fg = colors.sapphire },
    ["@operator"] = { fg = colors.sky },
    ["@keyword"] = { fg = colors.mauve, italic = true },
    ["@keyword.function"] = { fg = colors.mauve, italic = true },
    ["@keyword.return"] = { fg = colors.mauve, italic = true },
    ["@exception"] = { fg = colors.mauve },
    ["@variable"] = { fg = colors.text },
    ["@variable.builtin"] = { fg = colors.red },
    ["@type"] = { fg = colors.yellow },
    ["@type.builtin"] = { fg = colors.yellow },
    ["@type.definition"] = { fg = colors.yellow },
    ["@namespace"] = { fg = colors.lavender },
    ["@include"] = { fg = colors.mauve },
    ["@preproc"] = { fg = colors.pink },
    ["@define"] = { fg = colors.pink },
    ["@macro"] = { fg = colors.mauve },
    ["@punctuation.delimiter"] = { fg = colors.overlay2 },
    ["@punctuation.bracket"] = { fg = colors.overlay2 },
    ["@punctuation.special"] = { fg = colors.sky },
    ["@tag"] = { fg = colors.mauve },
    ["@tag.attribute"] = { fg = colors.teal },
    ["@tag.delimiter"] = { fg = colors.sky },
    ["@text"] = { fg = colors.text },
    ["@text.strong"] = { bold = true },
    ["@text.emphasis"] = { italic = true },
    ["@text.underline"] = { underline = true },
    ["@text.title"] = { fg = colors.blue, bold = true },
    ["@text.literal"] = { fg = colors.green },
    ["@text.uri"] = { fg = colors.rosewater, underline = true },
    ["@text.todo"] = { link = "Todo" },

    -- LSP Semantic Tokens
    ["@lsp.type.comment"] = { link = "Comment" },
    ["@lsp.type.enum"] = { fg = colors.teal },
    ["@lsp.type.interface"] = { fg = colors.flamingo },
    ["@lsp.type.keyword"] = { fg = colors.mauve },
    ["@lsp.type.namespace"] = { fg = colors.lavender },
    ["@lsp.type.parameter"] = { fg = colors.maroon },
    ["@lsp.type.property"] = { fg = colors.lavender },
    ["@lsp.type.variable"] = { fg = colors.text },
    ["@lsp.typemod.variable.defaultLibrary"] = { fg = colors.red },
    ["@lsp.typemod.function.defaultLibrary"] = { fg = colors.peach },

    -- Telescope
    TelescopeNormal = { fg = colors.text, bg = colors.mantle },
    TelescopeBorder = { fg = colors.blue, bg = colors.mantle },
    TelescopePromptNormal = { fg = colors.text, bg = colors.surface0 },
    TelescopePromptBorder = { fg = colors.surface0, bg = colors.surface0 },
    TelescopePromptTitle = { fg = colors.mantle, bg = colors.blue },
    TelescopePreviewTitle = { fg = colors.mantle, bg = colors.green },
    TelescopeResultsTitle = { fg = colors.mantle, bg = colors.mauve },
    TelescopeSelection = { bg = colors.surface1 },
    TelescopeMatching = { fg = colors.blue, bold = true },

    -- NvimTree
    NvimTreeNormal = { fg = colors.text, bg = colors.mantle },
    NvimTreeRootFolder = { fg = colors.mauve, bold = true },
    NvimTreeFolderIcon = { fg = colors.blue },
    NvimTreeOpenedFolderName = { fg = colors.blue },
    NvimTreeGitDirty = { fg = colors.yellow },
    NvimTreeGitNew = { fg = colors.green },
    NvimTreeGitDeleted = { fg = colors.red },

    -- GitSigns
    GitSignsAdd = { fg = colors.green },
    GitSignsChange = { fg = colors.blue },
    GitSignsDelete = { fg = colors.red },

    -- Indent Blankline
    IndentBlanklineChar = { fg = colors.surface0 },
    IndentBlanklineContextChar = { fg = colors.mauve },

    -- nvim-cmp
    CmpItemAbbr = { fg = colors.text },
    CmpItemAbbrMatch = { fg = colors.blue, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = colors.blue, bold = true },
    CmpItemKind = { fg = colors.mauve },
    CmpItemMenu = { fg = colors.overlay0 },
  }

  utils.apply_highlights(highlights)
end

return M
