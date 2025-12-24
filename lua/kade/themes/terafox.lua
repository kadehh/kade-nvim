-- kade-terafox: Terafox with bright, readable comments
-- Based on EdenEast/nightfox.nvim (terafox variant)

local M = {}

local colors = {
  -- Terafox palette (teal-focused dark theme)
  bg = "#152528",
  bg_dark = "#0f1c1e",
  bg_float = "#0f1c1e",
  bg_highlight = "#1d3337",
  bg_popup = "#1d3337",
  bg_search = "#5a93aa",
  bg_sidebar = "#0f1c1e",
  bg_statusline = "#0f1c1e",
  bg_visual = "#293e40",

  fg = "#e6eaea",
  fg_gutter = "#587b7b",
  fg_sidebar = "#587b7b",

  -- Accent colors
  black = "#1d3337",
  red = "#e85c51",
  green = "#7aa4a1",
  yellow = "#fda47f",
  blue = "#5a93aa",
  magenta = "#ad5c7c",
  cyan = "#a1cdd8",
  white = "#ebebeb",
  orange = "#ff8349",
  pink = "#cb7985",

  -- Extended palette
  comment_original = "#6d7f8b", -- original comment color

  -- KADE MODIFICATION: Bright, vivid comments using theme's cyan
  -- Original: #6d7f8b (muted, hard to read)
  -- New: Bright cyan that matches Terafox's teal-focused palette
  comment = "#a1cdd8",

  -- Git
  git_add = "#70a288",
  git_change = "#a1cdd8",
  git_delete = "#e85c51",

  -- Diagnostics
  error = "#e85c51",
  warning = "#fda47f",
  info = "#5a93aa",
  hint = "#7aa4a1",

  none = "NONE",
}

function M.load(config)
  local utils = require("kade.utils")
  config = config or {}

  -- Terminal colors
  if config.terminal_colors then
    vim.g.terminal_color_0 = colors.black
    vim.g.terminal_color_1 = colors.red
    vim.g.terminal_color_2 = colors.green
    vim.g.terminal_color_3 = colors.yellow
    vim.g.terminal_color_4 = colors.blue
    vim.g.terminal_color_5 = colors.magenta
    vim.g.terminal_color_6 = colors.cyan
    vim.g.terminal_color_7 = colors.white
    vim.g.terminal_color_8 = colors.fg_gutter
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
    NormalFloat = { fg = colors.fg, bg = colors.bg_float },
    FloatBorder = { fg = colors.blue, bg = colors.bg_float },
    ColorColumn = { bg = colors.bg_highlight },
    Cursor = { fg = colors.bg, bg = colors.fg },
    CursorLine = { bg = colors.bg_highlight },
    CursorColumn = { bg = colors.bg_highlight },
    CursorLineNr = { fg = colors.cyan, bold = true },
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
    ModeMsg = { fg = colors.fg, bold = true },
    MoreMsg = { fg = colors.blue },
    NonText = { fg = colors.fg_gutter },
    Pmenu = { fg = colors.fg, bg = colors.bg_popup },
    PmenuSel = { fg = colors.fg, bg = colors.bg_visual },
    PmenuSbar = { bg = colors.bg_visual },
    PmenuThumb = { bg = colors.fg_gutter },
    Question = { fg = colors.blue },
    QuickFixLine = { bg = colors.bg_visual, bold = true },
    SpecialKey = { fg = colors.fg_gutter },
    StatusLine = { fg = colors.fg, bg = colors.bg_statusline },
    StatusLineNC = { fg = colors.fg_gutter, bg = colors.bg_statusline },
    TabLine = { fg = colors.fg_gutter, bg = colors.bg_statusline },
    TabLineFill = { bg = colors.bg_statusline },
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

    Identifier = { fg = colors.cyan },
    Function = { fg = colors.blue },

    Statement = { fg = colors.magenta },
    Conditional = { fg = colors.magenta },
    Repeat = { fg = colors.magenta },
    Label = { fg = colors.magenta },
    Operator = { fg = colors.fg },
    Keyword = { fg = colors.magenta, italic = true },
    Exception = { fg = colors.magenta },

    PreProc = { fg = colors.pink },
    Include = { fg = colors.magenta },
    Define = { fg = colors.magenta },
    Macro = { fg = colors.cyan },
    PreCondit = { fg = colors.pink },

    Type = { fg = colors.yellow },
    StorageClass = { fg = colors.yellow },
    Structure = { fg = colors.yellow },
    Typedef = { fg = colors.yellow },

    Special = { fg = colors.cyan },
    SpecialChar = { fg = colors.cyan },
    Tag = { fg = colors.blue },
    Delimiter = { fg = colors.fg },
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
    DiffAdd = { bg = "#1e3a31" },
    DiffChange = { bg = "#1e2e3a" },
    DiffDelete = { bg = "#3a2424" },
    DiffText = { bg = "#2e4550" },
    diffAdded = { fg = colors.git_add },
    diffChanged = { fg = colors.git_change },
    diffRemoved = { fg = colors.git_delete },

    -- TreeSitter
    ["@comment"] = { link = "Comment" },
    ["@constant"] = { fg = colors.orange },
    ["@constant.builtin"] = { fg = colors.orange },
    ["@constant.macro"] = { fg = colors.cyan },
    ["@string"] = { fg = colors.green },
    ["@string.escape"] = { fg = colors.pink },
    ["@string.regex"] = { fg = colors.orange },
    ["@character"] = { fg = colors.green },
    ["@number"] = { fg = colors.orange },
    ["@boolean"] = { fg = colors.orange },
    ["@float"] = { fg = colors.orange },
    ["@function"] = { fg = colors.blue },
    ["@function.builtin"] = { fg = colors.cyan },
    ["@function.macro"] = { fg = colors.cyan },
    ["@parameter"] = { fg = colors.fg },
    ["@method"] = { fg = colors.blue },
    ["@field"] = { fg = colors.cyan },
    ["@property"] = { fg = colors.cyan },
    ["@constructor"] = { fg = colors.cyan },
    ["@conditional"] = { fg = colors.magenta },
    ["@repeat"] = { fg = colors.magenta },
    ["@label"] = { fg = colors.blue },
    ["@operator"] = { fg = colors.fg },
    ["@keyword"] = { fg = colors.magenta, italic = true },
    ["@keyword.function"] = { fg = colors.magenta, italic = true },
    ["@keyword.return"] = { fg = colors.magenta, italic = true },
    ["@exception"] = { fg = colors.magenta },
    ["@variable"] = { fg = colors.fg },
    ["@variable.builtin"] = { fg = colors.red },
    ["@type"] = { fg = colors.yellow },
    ["@type.builtin"] = { fg = colors.yellow },
    ["@type.definition"] = { fg = colors.yellow },
    ["@namespace"] = { fg = colors.cyan },
    ["@include"] = { fg = colors.magenta },
    ["@preproc"] = { fg = colors.pink },
    ["@define"] = { fg = colors.pink },
    ["@macro"] = { fg = colors.cyan },
    ["@punctuation.delimiter"] = { fg = colors.fg },
    ["@punctuation.bracket"] = { fg = colors.fg },
    ["@punctuation.special"] = { fg = colors.cyan },
    ["@tag"] = { fg = colors.blue },
    ["@tag.attribute"] = { fg = colors.cyan },
    ["@tag.delimiter"] = { fg = colors.fg },
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
    ["@lsp.type.keyword"] = { fg = colors.magenta },
    ["@lsp.type.namespace"] = { fg = colors.cyan },
    ["@lsp.type.parameter"] = { fg = colors.fg },
    ["@lsp.type.property"] = { fg = colors.cyan },
    ["@lsp.type.variable"] = { fg = colors.fg },

    -- Telescope
    TelescopeNormal = { fg = colors.fg, bg = colors.bg_float },
    TelescopeBorder = { fg = colors.blue, bg = colors.bg_float },
    TelescopePromptNormal = { fg = colors.fg, bg = colors.bg_highlight },
    TelescopePromptBorder = { fg = colors.bg_highlight, bg = colors.bg_highlight },
    TelescopePromptTitle = { fg = colors.bg, bg = colors.blue },
    TelescopePreviewTitle = { fg = colors.bg, bg = colors.green },
    TelescopeResultsTitle = { fg = colors.bg, bg = colors.cyan },
    TelescopeSelection = { bg = colors.bg_visual },
    TelescopeMatching = { fg = colors.orange, bold = true },

    -- NvimTree
    NvimTreeNormal = { fg = colors.fg, bg = colors.bg_sidebar },
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
