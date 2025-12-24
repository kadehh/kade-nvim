-- kade-duckybones: Ducky Bones with bright, readable comments
-- Based on mcchrish/zenbones.nvim (duckbones variant)

local M = {}

local colors = {
  -- Ducky Bones palette (warm, duck-inspired variant of zenbones)
  bg = "#0d1117",
  bg_dark = "#010409",
  bg_highlight = "#161b22",
  bg_visual = "#21262d",
  bg_search = "#3d4752",

  fg = "#c9d1d9",
  fg_dark = "#8b949e",
  fg_muted = "#6e7681",

  -- Accent colors (warm duck theme - oranges and yellows)
  orange = "#f0883e",
  yellow = "#d29922",
  gold = "#e3b341",
  red = "#f85149",
  green = "#56d364",
  teal = "#39d353",
  cyan = "#79c0ff",
  blue = "#58a6ff",
  purple = "#bc8cff",
  pink = "#ff7b72",

  -- KADE MODIFICATION: Bright, vivid comments using gold
  -- Original fg_muted: #6e7681 (muted, hard to read)
  -- New: Warm gold - bright and fits the duck/warm theme aesthetic
  comment = "#e3b341",

  -- Git
  git_add = "#56d364",
  git_change = "#e3b341",
  git_delete = "#f85149",

  -- Diagnostics
  error = "#f85149",
  warning = "#d29922",
  info = "#58a6ff",
  hint = "#56d364",

  none = "NONE",
}

function M.load(config)
  local utils = require("kade.utils")
  config = config or {}

  -- Terminal colors
  if config.terminal_colors then
    vim.g.terminal_color_0 = colors.bg_highlight
    vim.g.terminal_color_1 = colors.red
    vim.g.terminal_color_2 = colors.green
    vim.g.terminal_color_3 = colors.yellow
    vim.g.terminal_color_4 = colors.blue
    vim.g.terminal_color_5 = colors.purple
    vim.g.terminal_color_6 = colors.cyan
    vim.g.terminal_color_7 = colors.fg
    vim.g.terminal_color_8 = colors.fg_muted
    vim.g.terminal_color_9 = colors.red
    vim.g.terminal_color_10 = colors.green
    vim.g.terminal_color_11 = colors.yellow
    vim.g.terminal_color_12 = colors.blue
    vim.g.terminal_color_13 = colors.purple
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
    CursorLineNr = { fg = colors.gold, bold = true },
    LineNr = { fg = colors.fg_muted },
    SignColumn = { fg = colors.fg_muted, bg = bg },
    VertSplit = { fg = colors.bg_highlight },
    WinSeparator = { fg = colors.bg_highlight },
    Folded = { fg = colors.blue, bg = colors.bg_highlight },
    FoldColumn = { fg = colors.fg_muted, bg = bg },
    IncSearch = { fg = colors.bg, bg = colors.orange },
    Search = { fg = colors.fg, bg = colors.bg_search },
    CurSearch = { fg = colors.bg, bg = colors.orange },
    MatchParen = { fg = colors.orange, bold = true },
    ModeMsg = { fg = colors.fg_dark, bold = true },
    MoreMsg = { fg = colors.blue },
    NonText = { fg = colors.fg_muted },
    Pmenu = { fg = colors.fg, bg = colors.bg_dark },
    PmenuSel = { bg = colors.bg_visual },
    PmenuSbar = { bg = colors.bg_visual },
    PmenuThumb = { bg = colors.fg_muted },
    Question = { fg = colors.blue },
    QuickFixLine = { bg = colors.bg_visual, bold = true },
    SpecialKey = { fg = colors.fg_muted },
    StatusLine = { fg = colors.fg, bg = colors.bg_dark },
    StatusLineNC = { fg = colors.fg_muted, bg = colors.bg_dark },
    TabLine = { fg = colors.fg_muted, bg = colors.bg_dark },
    TabLineFill = { bg = colors.bg_dark },
    TabLineSel = { fg = colors.fg, bg = colors.bg_highlight },
    Title = { fg = colors.blue, bold = true },
    Visual = { bg = colors.bg_visual },
    VisualNOS = { bg = colors.bg_visual },
    WarningMsg = { fg = colors.warning },
    Whitespace = { fg = colors.fg_muted },
    WildMenu = { bg = colors.bg_visual },

    -- Syntax - KADE bright comments
    Comment = { fg = colors.comment, italic = true },

    Constant = { fg = colors.orange },
    String = { fg = colors.green },
    Character = { fg = colors.green },
    Number = { fg = colors.orange },
    Boolean = { fg = colors.orange },
    Float = { fg = colors.orange },

    Identifier = { fg = colors.fg },
    Function = { fg = colors.blue },

    Statement = { fg = colors.purple },
    Conditional = { fg = colors.purple },
    Repeat = { fg = colors.purple },
    Label = { fg = colors.purple },
    Operator = { fg = colors.fg_dark },
    Keyword = { fg = colors.purple, italic = true },
    Exception = { fg = colors.purple },

    PreProc = { fg = colors.pink },
    Include = { fg = colors.purple },
    Define = { fg = colors.purple },
    Macro = { fg = colors.purple },
    PreCondit = { fg = colors.pink },

    Type = { fg = colors.yellow },
    StorageClass = { fg = colors.yellow },
    Structure = { fg = colors.yellow },
    Typedef = { fg = colors.yellow },

    Special = { fg = colors.gold },
    SpecialChar = { fg = colors.gold },
    Tag = { fg = colors.blue },
    Delimiter = { fg = colors.fg_dark },
    SpecialComment = { fg = colors.comment },
    Debug = { fg = colors.orange },

    Underlined = { fg = colors.blue, underline = true },
    Bold = { bold = true },
    Italic = { italic = true },
    Ignore = { fg = colors.fg_muted },
    Error = { fg = colors.error },
    Todo = { fg = colors.bg, bg = colors.gold, bold = true },

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
    DiffAdd = { bg = "#1b3525" },
    DiffChange = { bg = "#2e2a1e" },
    DiffDelete = { bg = "#3d2525" },
    DiffText = { bg = "#3e3a2a" },
    diffAdded = { fg = colors.git_add },
    diffChanged = { fg = colors.git_change },
    diffRemoved = { fg = colors.git_delete },

    -- TreeSitter
    ["@comment"] = { link = "Comment" },
    ["@constant"] = { fg = colors.orange },
    ["@constant.builtin"] = { fg = colors.orange },
    ["@constant.macro"] = { fg = colors.purple },
    ["@string"] = { fg = colors.green },
    ["@string.escape"] = { fg = colors.cyan },
    ["@string.regex"] = { fg = colors.gold },
    ["@character"] = { fg = colors.green },
    ["@number"] = { fg = colors.orange },
    ["@boolean"] = { fg = colors.orange },
    ["@float"] = { fg = colors.orange },
    ["@function"] = { fg = colors.blue },
    ["@function.builtin"] = { fg = colors.cyan },
    ["@function.macro"] = { fg = colors.purple },
    ["@parameter"] = { fg = colors.fg },
    ["@method"] = { fg = colors.blue },
    ["@field"] = { fg = colors.fg },
    ["@property"] = { fg = colors.fg },
    ["@constructor"] = { fg = colors.yellow },
    ["@conditional"] = { fg = colors.purple },
    ["@repeat"] = { fg = colors.purple },
    ["@label"] = { fg = colors.blue },
    ["@operator"] = { fg = colors.fg_dark },
    ["@keyword"] = { fg = colors.purple, italic = true },
    ["@keyword.function"] = { fg = colors.purple, italic = true },
    ["@keyword.return"] = { fg = colors.purple, italic = true },
    ["@exception"] = { fg = colors.purple },
    ["@variable"] = { fg = colors.fg },
    ["@variable.builtin"] = { fg = colors.pink },
    ["@type"] = { fg = colors.yellow },
    ["@type.builtin"] = { fg = colors.yellow },
    ["@type.definition"] = { fg = colors.yellow },
    ["@namespace"] = { fg = colors.fg },
    ["@include"] = { fg = colors.purple },
    ["@preproc"] = { fg = colors.pink },
    ["@define"] = { fg = colors.pink },
    ["@macro"] = { fg = colors.purple },
    ["@punctuation.delimiter"] = { fg = colors.fg_dark },
    ["@punctuation.bracket"] = { fg = colors.fg_dark },
    ["@punctuation.special"] = { fg = colors.gold },
    ["@tag"] = { fg = colors.blue },
    ["@tag.attribute"] = { fg = colors.yellow },
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
    ["@lsp.type.enum"] = { fg = colors.yellow },
    ["@lsp.type.interface"] = { fg = colors.yellow },
    ["@lsp.type.keyword"] = { fg = colors.purple },
    ["@lsp.type.namespace"] = { fg = colors.fg },
    ["@lsp.type.parameter"] = { fg = colors.fg },
    ["@lsp.type.property"] = { fg = colors.fg },
    ["@lsp.type.variable"] = { fg = colors.fg },

    -- Telescope
    TelescopeNormal = { fg = colors.fg, bg = colors.bg_dark },
    TelescopeBorder = { fg = colors.blue, bg = colors.bg_dark },
    TelescopePromptNormal = { fg = colors.fg, bg = colors.bg_highlight },
    TelescopePromptBorder = { fg = colors.bg_highlight, bg = colors.bg_highlight },
    TelescopePromptTitle = { fg = colors.bg, bg = colors.blue },
    TelescopePreviewTitle = { fg = colors.bg, bg = colors.green },
    TelescopeResultsTitle = { fg = colors.bg, bg = colors.gold },
    TelescopeSelection = { bg = colors.bg_visual },
    TelescopeMatching = { fg = colors.orange, bold = true },

    -- NvimTree
    NvimTreeNormal = { fg = colors.fg, bg = colors.bg_dark },
    NvimTreeRootFolder = { fg = colors.blue, bold = true },
    NvimTreeFolderIcon = { fg = colors.gold },
    NvimTreeOpenedFolderName = { fg = colors.gold },
    NvimTreeGitDirty = { fg = colors.git_change },
    NvimTreeGitNew = { fg = colors.git_add },
    NvimTreeGitDeleted = { fg = colors.git_delete },

    -- GitSigns
    GitSignsAdd = { fg = colors.git_add },
    GitSignsChange = { fg = colors.git_change },
    GitSignsDelete = { fg = colors.git_delete },

    -- Indent Blankline
    IndentBlanklineChar = { fg = colors.bg_highlight },
    IndentBlanklineContextChar = { fg = colors.purple },

    -- nvim-cmp
    CmpItemAbbr = { fg = colors.fg },
    CmpItemAbbrMatch = { fg = colors.blue, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = colors.blue, bold = true },
    CmpItemKind = { fg = colors.purple },
    CmpItemMenu = { fg = colors.fg_muted },
  }

  utils.apply_highlights(highlights)
end

return M
