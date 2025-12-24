-- kade-moonlight: Moonlight with bright, readable comments
-- Based on shaunsingh/moonlight.nvim

local M = {}

local colors = {
  -- Moonlight palette (space/lunar inspired)
  bg = "#212337",
  bg_dark = "#1b1d2b",
  bg_highlight = "#2f334d",
  bg_popup = "#2f334d",
  bg_search = "#6a6eaf",
  bg_visual = "#383a5e",

  fg = "#c8d3f5",
  fg_dark = "#a9b8e8",
  fg_gutter = "#444a73",

  -- Accent colors
  blue = "#82aaff",
  cyan = "#86e1fc",
  green = "#c3e88d",
  magenta = "#c099ff",
  orange = "#ff966c",
  pink = "#fca7ea",
  purple = "#c099ff",
  red = "#ff757f",
  teal = "#4fd6be",
  yellow = "#ffc777",

  -- Extended
  blue0 = "#3e68d7",
  blue1 = "#65bcff",
  blue2 = "#0db9d7",
  gray = "#636da6",
  dark3 = "#545c7e",
  dark5 = "#737aa2",

  -- KADE MODIFICATION: Bright, vivid comments using teal
  -- Original: #636da6 (muted, hard to read)
  -- New: Bright teal - vibrant and fits the space/lunar aesthetic
  comment = "#4fd6be",

  -- Git
  git_add = "#b8db87",
  git_change = "#7ca1f2",
  git_delete = "#e26a75",

  -- Diagnostics
  error = "#ff757f",
  warning = "#ffc777",
  info = "#0db9d7",
  hint = "#4fd6be",

  none = "NONE",
}

function M.load(config)
  local utils = require("kade.utils")
  config = config or {}

  -- Terminal colors
  if config.terminal_colors then
    vim.g.terminal_color_0 = colors.bg_dark
    vim.g.terminal_color_1 = colors.red
    vim.g.terminal_color_2 = colors.green
    vim.g.terminal_color_3 = colors.yellow
    vim.g.terminal_color_4 = colors.blue
    vim.g.terminal_color_5 = colors.magenta
    vim.g.terminal_color_6 = colors.cyan
    vim.g.terminal_color_7 = colors.fg
    vim.g.terminal_color_8 = colors.dark3
    vim.g.terminal_color_9 = colors.red
    vim.g.terminal_color_10 = colors.green
    vim.g.terminal_color_11 = colors.yellow
    vim.g.terminal_color_12 = colors.blue
    vim.g.terminal_color_13 = colors.magenta
    vim.g.terminal_color_14 = colors.cyan
    vim.g.terminal_color_15 = colors.fg
  end

  local bg = config.transparent and colors.none or colors.bg

  local highlights = {
    -- Editor
    Normal = { fg = colors.fg, bg = bg },
    NormalFloat = { fg = colors.fg, bg = colors.bg_dark },
    FloatBorder = { fg = colors.blue, bg = colors.bg_dark },
    ColorColumn = { bg = colors.bg_highlight },
    Cursor = { fg = colors.bg, bg = colors.fg },
    CursorLine = { bg = colors.bg_highlight },
    CursorColumn = { bg = colors.bg_highlight },
    CursorLineNr = { fg = colors.yellow, bold = true },
    LineNr = { fg = colors.fg_gutter },
    SignColumn = { fg = colors.fg_gutter, bg = bg },
    VertSplit = { fg = colors.bg_highlight },
    WinSeparator = { fg = colors.bg_highlight },
    Folded = { fg = colors.blue, bg = colors.bg_highlight },
    FoldColumn = { fg = colors.fg_gutter, bg = bg },
    IncSearch = { fg = colors.bg, bg = colors.orange },
    Search = { fg = colors.fg, bg = colors.bg_search },
    CurSearch = { fg = colors.bg, bg = colors.orange },
    MatchParen = { fg = colors.orange, bold = true },
    ModeMsg = { fg = colors.fg_dark, bold = true },
    MoreMsg = { fg = colors.blue },
    NonText = { fg = colors.fg_gutter },
    Pmenu = { fg = colors.fg, bg = colors.bg_popup },
    PmenuSel = { bg = colors.bg_visual },
    PmenuSbar = { bg = colors.bg_visual },
    PmenuThumb = { bg = colors.fg_gutter },
    Question = { fg = colors.blue },
    QuickFixLine = { bg = colors.bg_visual, bold = true },
    SpecialKey = { fg = colors.fg_gutter },
    StatusLine = { fg = colors.fg, bg = colors.bg_dark },
    StatusLineNC = { fg = colors.fg_gutter, bg = colors.bg_dark },
    TabLine = { fg = colors.fg_gutter, bg = colors.bg_dark },
    TabLineFill = { bg = colors.bg_dark },
    TabLineSel = { fg = colors.fg, bg = colors.bg_highlight },
    Title = { fg = colors.blue, bold = true },
    Visual = { bg = colors.bg_visual },
    VisualNOS = { bg = colors.bg_visual },
    WarningMsg = { fg = colors.warning },
    Whitespace = { fg = colors.fg_gutter },
    WildMenu = { bg = colors.bg_visual },

    -- Syntax - KADE bright comments
    Comment = { fg = colors.comment, italic = true },

    Constant = { fg = colors.orange },
    String = { fg = colors.green },
    Character = { fg = colors.green },
    Number = { fg = colors.orange },
    Boolean = { fg = colors.orange },
    Float = { fg = colors.orange },

    Identifier = { fg = colors.magenta },
    Function = { fg = colors.blue },

    Statement = { fg = colors.magenta },
    Conditional = { fg = colors.magenta },
    Repeat = { fg = colors.magenta },
    Label = { fg = colors.magenta },
    Operator = { fg = colors.cyan },
    Keyword = { fg = colors.magenta, italic = true },
    Exception = { fg = colors.magenta },

    PreProc = { fg = colors.cyan },
    Include = { fg = colors.blue },
    Define = { fg = colors.magenta },
    Macro = { fg = colors.magenta },
    PreCondit = { fg = colors.cyan },

    Type = { fg = colors.blue1 },
    StorageClass = { fg = colors.blue1 },
    Structure = { fg = colors.blue1 },
    Typedef = { fg = colors.blue1 },

    Special = { fg = colors.cyan },
    SpecialChar = { fg = colors.cyan },
    Tag = { fg = colors.cyan },
    Delimiter = { fg = colors.fg_dark },
    SpecialComment = { fg = colors.comment },
    Debug = { fg = colors.orange },

    Underlined = { fg = colors.blue, underline = true },
    Bold = { bold = true },
    Italic = { italic = true },
    Ignore = { fg = colors.fg_gutter },
    Error = { fg = colors.error },
    Todo = { fg = colors.bg, bg = colors.yellow, bold = true },

    -- Diagnostics
    DiagnosticError = { fg = colors.error },
    DiagnosticWarn = { fg = colors.warning },
    DiagnosticInfo = { fg = colors.info },
    DiagnosticHint = { fg = colors.hint },
    DiagnosticUnderlineError = { undercurl = true, sp = colors.error },
    DiagnosticUnderlineWarn = { undercurl = true, sp = colors.warning },
    DiagnosticUnderlineInfo = { undercurl = true, sp = colors.info },
    DiagnosticUnderlineHint = { undercurl = true, sp = colors.hint },

    -- Git
    DiffAdd = { bg = "#2a3834" },
    DiffChange = { bg = "#272d43" },
    DiffDelete = { bg = "#3d2d3d" },
    DiffText = { bg = "#394b70" },
    diffAdded = { fg = colors.git_add },
    diffChanged = { fg = colors.git_change },
    diffRemoved = { fg = colors.git_delete },

    -- TreeSitter
    ["@comment"] = { link = "Comment" },
    ["@constant"] = { fg = colors.orange },
    ["@constant.builtin"] = { fg = colors.orange },
    ["@constant.macro"] = { fg = colors.orange },
    ["@string"] = { fg = colors.green },
    ["@string.escape"] = { fg = colors.magenta },
    ["@string.regex"] = { fg = colors.cyan },
    ["@character"] = { fg = colors.green },
    ["@number"] = { fg = colors.orange },
    ["@boolean"] = { fg = colors.orange },
    ["@float"] = { fg = colors.orange },
    ["@function"] = { fg = colors.blue },
    ["@function.builtin"] = { fg = colors.cyan },
    ["@function.macro"] = { fg = colors.magenta },
    ["@parameter"] = { fg = colors.yellow },
    ["@method"] = { fg = colors.blue },
    ["@field"] = { fg = colors.teal },
    ["@property"] = { fg = colors.teal },
    ["@constructor"] = { fg = colors.magenta },
    ["@conditional"] = { fg = colors.magenta },
    ["@repeat"] = { fg = colors.magenta },
    ["@label"] = { fg = colors.blue },
    ["@operator"] = { fg = colors.cyan },
    ["@keyword"] = { fg = colors.magenta, italic = true },
    ["@keyword.function"] = { fg = colors.magenta, italic = true },
    ["@keyword.return"] = { fg = colors.magenta, italic = true },
    ["@exception"] = { fg = colors.magenta },
    ["@variable"] = { fg = colors.fg },
    ["@variable.builtin"] = { fg = colors.red },
    ["@type"] = { fg = colors.blue1 },
    ["@type.builtin"] = { fg = colors.blue1 },
    ["@type.definition"] = { fg = colors.blue1 },
    ["@namespace"] = { fg = colors.fg },
    ["@include"] = { fg = colors.blue },
    ["@preproc"] = { fg = colors.cyan },
    ["@define"] = { fg = colors.cyan },
    ["@macro"] = { fg = colors.magenta },
    ["@punctuation.delimiter"] = { fg = colors.fg_dark },
    ["@punctuation.bracket"] = { fg = colors.fg_dark },
    ["@punctuation.special"] = { fg = colors.cyan },
    ["@tag"] = { fg = colors.red },
    ["@tag.attribute"] = { fg = colors.teal },
    ["@tag.delimiter"] = { fg = colors.fg_dark },
    ["@text"] = { fg = colors.fg },
    ["@text.strong"] = { bold = true },
    ["@text.emphasis"] = { italic = true },
    ["@text.underline"] = { underline = true },
    ["@text.title"] = { fg = colors.blue, bold = true },
    ["@text.literal"] = { fg = colors.green },
    ["@text.uri"] = { fg = colors.cyan, underline = true },
    ["@text.todo"] = { link = "Todo" },

    -- LSP Semantic Tokens
    ["@lsp.type.comment"] = { link = "Comment" },
    ["@lsp.type.enum"] = { fg = colors.blue1 },
    ["@lsp.type.interface"] = { fg = colors.blue1 },
    ["@lsp.type.keyword"] = { fg = colors.magenta },
    ["@lsp.type.namespace"] = { fg = colors.fg },
    ["@lsp.type.parameter"] = { fg = colors.yellow },
    ["@lsp.type.property"] = { fg = colors.teal },
    ["@lsp.type.variable"] = { fg = colors.fg },
    ["@lsp.typemod.variable.defaultLibrary"] = { fg = colors.red },
    ["@lsp.typemod.function.defaultLibrary"] = { fg = colors.cyan },

    -- Telescope
    TelescopeNormal = { fg = colors.fg, bg = colors.bg_dark },
    TelescopeBorder = { fg = colors.blue, bg = colors.bg_dark },
    TelescopePromptNormal = { fg = colors.fg, bg = colors.bg_highlight },
    TelescopePromptBorder = { fg = colors.bg_highlight, bg = colors.bg_highlight },
    TelescopePromptTitle = { fg = colors.bg, bg = colors.blue },
    TelescopePreviewTitle = { fg = colors.bg, bg = colors.green },
    TelescopeResultsTitle = { fg = colors.bg, bg = colors.cyan },
    TelescopeSelection = { bg = colors.bg_visual },
    TelescopeMatching = { fg = colors.blue, bold = true },

    -- NvimTree
    NvimTreeNormal = { fg = colors.fg, bg = colors.bg_dark },
    NvimTreeRootFolder = { fg = colors.blue, bold = true },
    NvimTreeFolderIcon = { fg = colors.blue },
    NvimTreeOpenedFolderName = { fg = colors.blue },
    NvimTreeGitDirty = { fg = colors.git_change },
    NvimTreeGitNew = { fg = colors.git_add },
    NvimTreeGitDeleted = { fg = colors.git_delete },

    -- GitSigns
    GitSignsAdd = { fg = colors.git_add },
    GitSignsChange = { fg = colors.git_change },
    GitSignsDelete = { fg = colors.git_delete },

    -- Indent Blankline
    IndentBlanklineChar = { fg = colors.bg_highlight },
    IndentBlanklineContextChar = { fg = colors.magenta },

    -- nvim-cmp
    CmpItemAbbr = { fg = colors.fg },
    CmpItemAbbrMatch = { fg = colors.blue, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = colors.blue, bold = true },
    CmpItemKind = { fg = colors.magenta },
    CmpItemMenu = { fg = colors.fg_gutter },
  }

  utils.apply_highlights(highlights)
end

return M
