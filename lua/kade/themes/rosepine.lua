-- kade-rosepine: Rose Pine with bright, readable comments
-- Based on rose-pine/neovim (main variant)

local M = {}

local colors = {
  -- Base colors (main/dark variant)
  base = "#191724",
  surface = "#1f1d2e",
  overlay = "#26233a",
  muted = "#6e6a86", -- original comment color
  subtle = "#908caa",
  text = "#e0def4",
  love = "#eb6f92",
  gold = "#f6c177",
  rose = "#ebbcba",
  pine = "#31748f",
  foam = "#9ccfd8",
  iris = "#c4a7e7",
  highlight_low = "#21202e",
  highlight_med = "#403d52",
  highlight_high = "#524f67",

  -- KADE MODIFICATION: Bright, vivid comments using iris purple
  -- Original muted: #6e6a86 (too dim)
  -- New: Iris purple - bright and fits the dreamy rose pine aesthetic
  comment = "#c4a7e7",

  none = "NONE",
}

function M.load(config)
  local utils = require("kade.utils")
  config = config or {}

  -- Terminal colors
  if config.terminal_colors then
    vim.g.terminal_color_0 = colors.overlay
    vim.g.terminal_color_1 = colors.love
    vim.g.terminal_color_2 = colors.pine
    vim.g.terminal_color_3 = colors.gold
    vim.g.terminal_color_4 = colors.foam
    vim.g.terminal_color_5 = colors.iris
    vim.g.terminal_color_6 = colors.rose
    vim.g.terminal_color_7 = colors.text
    vim.g.terminal_color_8 = colors.highlight_high
    vim.g.terminal_color_9 = colors.love
    vim.g.terminal_color_10 = colors.pine
    vim.g.terminal_color_11 = colors.gold
    vim.g.terminal_color_12 = colors.foam
    vim.g.terminal_color_13 = colors.iris
    vim.g.terminal_color_14 = colors.rose
    vim.g.terminal_color_15 = colors.text
  end

  local bg = config.transparent and colors.none or colors.base

  local highlights = {
    -- Editor
    Normal = { fg = colors.text, bg = bg },
    NormalFloat = { fg = colors.text, bg = colors.surface },
    FloatBorder = { fg = colors.highlight_high, bg = colors.surface },
    ColorColumn = { bg = colors.surface },
    Cursor = { fg = colors.base, bg = colors.text },
    CursorLine = { bg = colors.highlight_low },
    CursorColumn = { bg = colors.highlight_low },
    CursorLineNr = { fg = colors.text, bold = true },
    LineNr = { fg = colors.muted },
    SignColumn = { fg = colors.muted, bg = bg },
    VertSplit = { fg = colors.overlay },
    WinSeparator = { fg = colors.overlay },
    Folded = { fg = colors.text, bg = colors.surface },
    FoldColumn = { fg = colors.muted, bg = bg },
    IncSearch = { fg = colors.base, bg = colors.gold },
    Search = { fg = colors.text, bg = colors.highlight_med },
    CurSearch = { fg = colors.base, bg = colors.gold },
    MatchParen = { fg = colors.gold, bold = true },
    ModeMsg = { fg = colors.subtle, bold = true },
    MoreMsg = { fg = colors.iris },
    NonText = { fg = colors.muted },
    Pmenu = { fg = colors.text, bg = colors.surface },
    PmenuSel = { fg = colors.text, bg = colors.overlay },
    PmenuSbar = { bg = colors.overlay },
    PmenuThumb = { bg = colors.highlight_med },
    Question = { fg = colors.gold },
    QuickFixLine = { bg = colors.highlight_med, bold = true },
    SpecialKey = { fg = colors.muted },
    StatusLine = { fg = colors.text, bg = colors.surface },
    StatusLineNC = { fg = colors.muted, bg = colors.surface },
    TabLine = { fg = colors.muted, bg = colors.surface },
    TabLineFill = { bg = colors.surface },
    TabLineSel = { fg = colors.text, bg = colors.overlay },
    Title = { fg = colors.foam, bold = true },
    Visual = { bg = colors.highlight_med },
    VisualNOS = { bg = colors.highlight_med },
    WarningMsg = { fg = colors.gold },
    Whitespace = { fg = colors.muted },
    WildMenu = { bg = colors.highlight_med },

    -- Syntax - KADE bright comments
    Comment = { fg = colors.comment, italic = true },

    Constant = { fg = colors.gold },
    String = { fg = colors.gold },
    Character = { fg = colors.gold },
    Number = { fg = colors.gold },
    Boolean = { fg = colors.rose },
    Float = { fg = colors.gold },

    Identifier = { fg = colors.rose },
    Function = { fg = colors.foam },

    Statement = { fg = colors.pine },
    Conditional = { fg = colors.pine },
    Repeat = { fg = colors.pine },
    Label = { fg = colors.pine },
    Operator = { fg = colors.subtle },
    Keyword = { fg = colors.pine, italic = true },
    Exception = { fg = colors.pine },

    PreProc = { fg = colors.iris },
    Include = { fg = colors.iris },
    Define = { fg = colors.iris },
    Macro = { fg = colors.iris },
    PreCondit = { fg = colors.iris },

    Type = { fg = colors.foam },
    StorageClass = { fg = colors.pine },
    Structure = { fg = colors.foam },
    Typedef = { fg = colors.foam },

    Special = { fg = colors.rose },
    SpecialChar = { fg = colors.rose },
    Tag = { fg = colors.foam },
    Delimiter = { fg = colors.subtle },
    SpecialComment = { fg = colors.comment },
    Debug = { fg = colors.love },

    Underlined = { fg = colors.foam, underline = true },
    Bold = { bold = true },
    Italic = { italic = true },
    Ignore = { fg = colors.muted },
    Error = { fg = colors.love },
    Todo = { fg = colors.base, bg = colors.rose, bold = true },

    -- Diagnostics
    DiagnosticError = { fg = colors.love },
    DiagnosticWarn = { fg = colors.gold },
    DiagnosticInfo = { fg = colors.foam },
    DiagnosticHint = { fg = colors.iris },
    DiagnosticUnderlineError = { undercurl = true, sp = colors.love },
    DiagnosticUnderlineWarn = { undercurl = true, sp = colors.gold },
    DiagnosticUnderlineInfo = { undercurl = true, sp = colors.foam },
    DiagnosticUnderlineHint = { undercurl = true, sp = colors.iris },

    -- Git
    DiffAdd = { bg = "#2a3834" },
    DiffChange = { bg = "#272636" },
    DiffDelete = { bg = "#3d2a36" },
    DiffText = { bg = "#3f3952" },
    diffAdded = { fg = colors.foam },
    diffChanged = { fg = colors.rose },
    diffRemoved = { fg = colors.love },

    -- TreeSitter
    ["@comment"] = { link = "Comment" },
    ["@constant"] = { fg = colors.gold },
    ["@constant.builtin"] = { fg = colors.love },
    ["@constant.macro"] = { fg = colors.iris },
    ["@string"] = { fg = colors.gold },
    ["@string.escape"] = { fg = colors.pine },
    ["@string.regex"] = { fg = colors.pine },
    ["@character"] = { fg = colors.gold },
    ["@number"] = { fg = colors.gold },
    ["@boolean"] = { fg = colors.rose },
    ["@float"] = { fg = colors.gold },
    ["@function"] = { fg = colors.foam },
    ["@function.builtin"] = { fg = colors.love },
    ["@function.macro"] = { fg = colors.iris },
    ["@parameter"] = { fg = colors.iris },
    ["@method"] = { fg = colors.foam },
    ["@field"] = { fg = colors.rose },
    ["@property"] = { fg = colors.rose },
    ["@constructor"] = { fg = colors.foam },
    ["@conditional"] = { fg = colors.pine },
    ["@repeat"] = { fg = colors.pine },
    ["@label"] = { fg = colors.foam },
    ["@operator"] = { fg = colors.subtle },
    ["@keyword"] = { fg = colors.pine, italic = true },
    ["@keyword.function"] = { fg = colors.pine, italic = true },
    ["@keyword.return"] = { fg = colors.pine, italic = true },
    ["@exception"] = { fg = colors.pine },
    ["@variable"] = { fg = colors.text },
    ["@variable.builtin"] = { fg = colors.love },
    ["@type"] = { fg = colors.foam },
    ["@type.builtin"] = { fg = colors.foam },
    ["@type.definition"] = { fg = colors.foam },
    ["@namespace"] = { fg = colors.rose },
    ["@include"] = { fg = colors.iris },
    ["@preproc"] = { fg = colors.iris },
    ["@define"] = { fg = colors.iris },
    ["@macro"] = { fg = colors.iris },
    ["@punctuation.delimiter"] = { fg = colors.subtle },
    ["@punctuation.bracket"] = { fg = colors.subtle },
    ["@punctuation.special"] = { fg = colors.subtle },
    ["@tag"] = { fg = colors.foam },
    ["@tag.attribute"] = { fg = colors.iris },
    ["@tag.delimiter"] = { fg = colors.subtle },
    ["@text"] = { fg = colors.text },
    ["@text.strong"] = { bold = true },
    ["@text.emphasis"] = { italic = true },
    ["@text.underline"] = { underline = true },
    ["@text.title"] = { fg = colors.foam, bold = true },
    ["@text.literal"] = { fg = colors.gold },
    ["@text.uri"] = { fg = colors.foam, underline = true },
    ["@text.todo"] = { link = "Todo" },

    -- LSP Semantic Tokens
    ["@lsp.type.comment"] = { link = "Comment" },
    ["@lsp.type.enum"] = { fg = colors.foam },
    ["@lsp.type.interface"] = { fg = colors.foam },
    ["@lsp.type.keyword"] = { fg = colors.pine },
    ["@lsp.type.namespace"] = { fg = colors.rose },
    ["@lsp.type.parameter"] = { fg = colors.iris },
    ["@lsp.type.property"] = { fg = colors.rose },
    ["@lsp.type.variable"] = { fg = colors.text },

    -- Telescope
    TelescopeNormal = { fg = colors.text, bg = colors.surface },
    TelescopeBorder = { fg = colors.highlight_high, bg = colors.surface },
    TelescopePromptNormal = { fg = colors.text, bg = colors.overlay },
    TelescopePromptBorder = { fg = colors.overlay, bg = colors.overlay },
    TelescopePromptTitle = { fg = colors.base, bg = colors.foam },
    TelescopePreviewTitle = { fg = colors.base, bg = colors.iris },
    TelescopeResultsTitle = { fg = colors.base, bg = colors.gold },
    TelescopeSelection = { bg = colors.highlight_med },
    TelescopeMatching = { fg = colors.gold, bold = true },

    -- NvimTree
    NvimTreeNormal = { fg = colors.text, bg = colors.surface },
    NvimTreeRootFolder = { fg = colors.iris, bold = true },
    NvimTreeFolderIcon = { fg = colors.foam },
    NvimTreeOpenedFolderName = { fg = colors.foam },
    NvimTreeGitDirty = { fg = colors.rose },
    NvimTreeGitNew = { fg = colors.foam },
    NvimTreeGitDeleted = { fg = colors.love },

    -- GitSigns
    GitSignsAdd = { fg = colors.foam },
    GitSignsChange = { fg = colors.rose },
    GitSignsDelete = { fg = colors.love },

    -- Indent Blankline
    IndentBlanklineChar = { fg = colors.overlay },
    IndentBlanklineContextChar = { fg = colors.iris },

    -- nvim-cmp
    CmpItemAbbr = { fg = colors.text },
    CmpItemAbbrMatch = { fg = colors.foam, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = colors.foam, bold = true },
    CmpItemKind = { fg = colors.iris },
    CmpItemMenu = { fg = colors.muted },
  }

  utils.apply_highlights(highlights)
end

return M
