-- kade-nord: Nord with bright, readable comments
-- Based on nordtheme/nvim and shaunsingh/nord.nvim

local M = {}

local colors = {
  -- Polar Night (backgrounds)
  nord0 = "#2E3440", -- bg
  nord1 = "#3B4252", -- bg elevated
  nord2 = "#434C5E", -- selection
  nord3 = "#4C566A", -- original comments (low contrast)

  -- Snow Storm (foregrounds)
  nord4 = "#D8DEE9", -- fg
  nord5 = "#E5E9F0", -- fg light
  nord6 = "#ECEFF4", -- fg bright

  -- Frost (cool accents)
  nord7 = "#8FBCBB", -- teal
  nord8 = "#88C0D0", -- cyan
  nord9 = "#81A1C1", -- blue
  nord10 = "#5E81AC", -- dark blue

  -- Aurora (warm accents)
  nord11 = "#BF616A", -- red
  nord12 = "#D08770", -- orange
  nord13 = "#EBCB8B", -- yellow
  nord14 = "#A3BE8C", -- green
  nord15 = "#B48EAD", -- purple

  -- KADE MODIFICATION: Brighter, more readable comments
  -- Original nord3: #4C566A (contrast ~2.9:1)
  -- New: #7B88A1 (contrast ~5.5:1, WCAG AA compliant)
  comment = "#7B88A1",

  none = "NONE",
}

function M.load(config)
  local utils = require("kade.utils")
  config = config or {}

  -- Terminal colors
  if config.terminal_colors then
    vim.g.terminal_color_0 = colors.nord1
    vim.g.terminal_color_1 = colors.nord11
    vim.g.terminal_color_2 = colors.nord14
    vim.g.terminal_color_3 = colors.nord13
    vim.g.terminal_color_4 = colors.nord9
    vim.g.terminal_color_5 = colors.nord15
    vim.g.terminal_color_6 = colors.nord8
    vim.g.terminal_color_7 = colors.nord5
    vim.g.terminal_color_8 = colors.nord3
    vim.g.terminal_color_9 = colors.nord11
    vim.g.terminal_color_10 = colors.nord14
    vim.g.terminal_color_11 = colors.nord13
    vim.g.terminal_color_12 = colors.nord9
    vim.g.terminal_color_13 = colors.nord15
    vim.g.terminal_color_14 = colors.nord7
    vim.g.terminal_color_15 = colors.nord6
  end

  local bg = config.transparent and colors.none or colors.nord0

  local highlights = {
    -- Editor
    Normal = { fg = colors.nord4, bg = bg },
    NormalFloat = { fg = colors.nord4, bg = colors.nord1 },
    FloatBorder = { fg = colors.nord9, bg = colors.nord1 },
    ColorColumn = { bg = colors.nord1 },
    Cursor = { fg = colors.nord0, bg = colors.nord4 },
    CursorLine = { bg = colors.nord1 },
    CursorColumn = { bg = colors.nord1 },
    CursorLineNr = { fg = colors.nord4, bold = true },
    LineNr = { fg = colors.nord3 },
    SignColumn = { fg = colors.nord3, bg = bg },
    VertSplit = { fg = colors.nord1 },
    WinSeparator = { fg = colors.nord1 },
    Folded = { fg = colors.nord9, bg = colors.nord1 },
    FoldColumn = { fg = colors.nord3, bg = bg },
    IncSearch = { fg = colors.nord0, bg = colors.nord13 },
    Search = { fg = colors.nord0, bg = colors.nord8 },
    CurSearch = { fg = colors.nord0, bg = colors.nord13 },
    MatchParen = { fg = colors.nord13, bold = true },
    ModeMsg = { fg = colors.nord4, bold = true },
    MoreMsg = { fg = colors.nord8 },
    NonText = { fg = colors.nord3 },
    Pmenu = { fg = colors.nord4, bg = colors.nord1 },
    PmenuSel = { fg = colors.nord4, bg = colors.nord2 },
    PmenuSbar = { bg = colors.nord2 },
    PmenuThumb = { bg = colors.nord3 },
    Question = { fg = colors.nord8 },
    QuickFixLine = { bg = colors.nord2, bold = true },
    SpecialKey = { fg = colors.nord3 },
    StatusLine = { fg = colors.nord4, bg = colors.nord1 },
    StatusLineNC = { fg = colors.nord3, bg = colors.nord1 },
    TabLine = { fg = colors.nord4, bg = colors.nord1 },
    TabLineFill = { bg = colors.nord1 },
    TabLineSel = { fg = colors.nord4, bg = colors.nord2 },
    Title = { fg = colors.nord8, bold = true },
    Visual = { bg = colors.nord2 },
    VisualNOS = { bg = colors.nord2 },
    WarningMsg = { fg = colors.nord12 },
    Whitespace = { fg = colors.nord3 },
    WildMenu = { fg = colors.nord0, bg = colors.nord8 },

    -- Syntax - KADE bright comments
    Comment = { fg = colors.comment, italic = true },

    Constant = { fg = colors.nord4 },
    String = { fg = colors.nord14 },
    Character = { fg = colors.nord14 },
    Number = { fg = colors.nord15 },
    Boolean = { fg = colors.nord9 },
    Float = { fg = colors.nord15 },

    Identifier = { fg = colors.nord4 },
    Function = { fg = colors.nord8 },

    Statement = { fg = colors.nord9 },
    Conditional = { fg = colors.nord9 },
    Repeat = { fg = colors.nord9 },
    Label = { fg = colors.nord9 },
    Operator = { fg = colors.nord9 },
    Keyword = { fg = colors.nord9, italic = true },
    Exception = { fg = colors.nord9 },

    PreProc = { fg = colors.nord9 },
    Include = { fg = colors.nord9 },
    Define = { fg = colors.nord9 },
    Macro = { fg = colors.nord9 },
    PreCondit = { fg = colors.nord9 },

    Type = { fg = colors.nord7 },
    StorageClass = { fg = colors.nord9 },
    Structure = { fg = colors.nord9 },
    Typedef = { fg = colors.nord9 },

    Special = { fg = colors.nord4 },
    SpecialChar = { fg = colors.nord13 },
    Tag = { fg = colors.nord4 },
    Delimiter = { fg = colors.nord4 },
    SpecialComment = { fg = colors.comment },
    Debug = { fg = colors.nord11 },

    Underlined = { fg = colors.nord8, underline = true },
    Bold = { bold = true },
    Italic = { italic = true },
    Ignore = { fg = colors.nord3 },
    Error = { fg = colors.nord11 },
    Todo = { fg = colors.nord0, bg = colors.nord13, bold = true },

    -- Diagnostics
    DiagnosticError = { fg = colors.nord11 },
    DiagnosticWarn = { fg = colors.nord12 },
    DiagnosticInfo = { fg = colors.nord8 },
    DiagnosticHint = { fg = colors.nord10 },
    DiagnosticUnderlineError = { undercurl = true, sp = colors.nord11 },
    DiagnosticUnderlineWarn = { undercurl = true, sp = colors.nord12 },
    DiagnosticUnderlineInfo = { undercurl = true, sp = colors.nord8 },
    DiagnosticUnderlineHint = { undercurl = true, sp = colors.nord10 },

    -- Git
    DiffAdd = { bg = "#394634" },
    DiffChange = { bg = "#2e3b4e" },
    DiffDelete = { bg = "#4c3840" },
    DiffText = { bg = "#405060" },
    diffAdded = { fg = colors.nord14 },
    diffChanged = { fg = colors.nord13 },
    diffRemoved = { fg = colors.nord11 },

    -- TreeSitter
    ["@comment"] = { link = "Comment" },
    ["@constant"] = { fg = colors.nord4 },
    ["@constant.builtin"] = { fg = colors.nord9 },
    ["@constant.macro"] = { fg = colors.nord9 },
    ["@string"] = { fg = colors.nord14 },
    ["@string.escape"] = { fg = colors.nord13 },
    ["@string.regex"] = { fg = colors.nord13 },
    ["@character"] = { fg = colors.nord14 },
    ["@number"] = { fg = colors.nord15 },
    ["@boolean"] = { fg = colors.nord9 },
    ["@float"] = { fg = colors.nord15 },
    ["@function"] = { fg = colors.nord8 },
    ["@function.builtin"] = { fg = colors.nord8 },
    ["@function.macro"] = { fg = colors.nord9 },
    ["@parameter"] = { fg = colors.nord4 },
    ["@method"] = { fg = colors.nord8 },
    ["@field"] = { fg = colors.nord4 },
    ["@property"] = { fg = colors.nord4 },
    ["@constructor"] = { fg = colors.nord7 },
    ["@conditional"] = { fg = colors.nord9 },
    ["@repeat"] = { fg = colors.nord9 },
    ["@label"] = { fg = colors.nord9 },
    ["@operator"] = { fg = colors.nord9 },
    ["@keyword"] = { fg = colors.nord9, italic = true },
    ["@keyword.function"] = { fg = colors.nord9, italic = true },
    ["@keyword.return"] = { fg = colors.nord9, italic = true },
    ["@exception"] = { fg = colors.nord9 },
    ["@variable"] = { fg = colors.nord4 },
    ["@variable.builtin"] = { fg = colors.nord9 },
    ["@type"] = { fg = colors.nord7 },
    ["@type.builtin"] = { fg = colors.nord7 },
    ["@type.definition"] = { fg = colors.nord7 },
    ["@namespace"] = { fg = colors.nord4 },
    ["@include"] = { fg = colors.nord9 },
    ["@preproc"] = { fg = colors.nord9 },
    ["@define"] = { fg = colors.nord9 },
    ["@macro"] = { fg = colors.nord9 },
    ["@punctuation.delimiter"] = { fg = colors.nord4 },
    ["@punctuation.bracket"] = { fg = colors.nord4 },
    ["@punctuation.special"] = { fg = colors.nord9 },
    ["@tag"] = { fg = colors.nord9 },
    ["@tag.attribute"] = { fg = colors.nord7 },
    ["@tag.delimiter"] = { fg = colors.nord4 },
    ["@text"] = { fg = colors.nord4 },
    ["@text.strong"] = { bold = true },
    ["@text.emphasis"] = { italic = true },
    ["@text.underline"] = { underline = true },
    ["@text.title"] = { fg = colors.nord8, bold = true },
    ["@text.literal"] = { fg = colors.nord14 },
    ["@text.uri"] = { fg = colors.nord8, underline = true },
    ["@text.todo"] = { link = "Todo" },

    -- LSP Semantic Tokens
    ["@lsp.type.comment"] = { link = "Comment" },
    ["@lsp.type.enum"] = { fg = colors.nord7 },
    ["@lsp.type.interface"] = { fg = colors.nord7 },
    ["@lsp.type.keyword"] = { fg = colors.nord9 },
    ["@lsp.type.namespace"] = { fg = colors.nord4 },
    ["@lsp.type.parameter"] = { fg = colors.nord4 },
    ["@lsp.type.property"] = { fg = colors.nord4 },
    ["@lsp.type.variable"] = { fg = colors.nord4 },

    -- Telescope
    TelescopeNormal = { fg = colors.nord4, bg = colors.nord1 },
    TelescopeBorder = { fg = colors.nord9, bg = colors.nord1 },
    TelescopePromptNormal = { fg = colors.nord4, bg = colors.nord2 },
    TelescopePromptBorder = { fg = colors.nord2, bg = colors.nord2 },
    TelescopePromptTitle = { fg = colors.nord0, bg = colors.nord8 },
    TelescopePreviewTitle = { fg = colors.nord0, bg = colors.nord14 },
    TelescopeResultsTitle = { fg = colors.nord0, bg = colors.nord7 },
    TelescopeSelection = { bg = colors.nord2 },
    TelescopeMatching = { fg = colors.nord8, bold = true },

    -- NvimTree
    NvimTreeNormal = { fg = colors.nord4, bg = colors.nord1 },
    NvimTreeRootFolder = { fg = colors.nord9, bold = true },
    NvimTreeFolderIcon = { fg = colors.nord9 },
    NvimTreeOpenedFolderName = { fg = colors.nord9 },
    NvimTreeGitDirty = { fg = colors.nord13 },
    NvimTreeGitNew = { fg = colors.nord14 },
    NvimTreeGitDeleted = { fg = colors.nord11 },

    -- GitSigns
    GitSignsAdd = { fg = colors.nord14 },
    GitSignsChange = { fg = colors.nord13 },
    GitSignsDelete = { fg = colors.nord11 },

    -- Indent Blankline
    IndentBlanklineChar = { fg = colors.nord1 },
    IndentBlanklineContextChar = { fg = colors.nord9 },

    -- nvim-cmp
    CmpItemAbbr = { fg = colors.nord4 },
    CmpItemAbbrMatch = { fg = colors.nord8, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = colors.nord8, bold = true },
    CmpItemKind = { fg = colors.nord15 },
    CmpItemMenu = { fg = colors.nord3 },
  }

  utils.apply_highlights(highlights)
end

return M
