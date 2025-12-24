-- kade-duckbones: Duckbones with bright, readable comments
-- Based on zenbones-theme/zenbones.nvim (duckbones variant)
-- A warm, duck-themed colorscheme with cream/gold tones

local M = {}

local colors = {
  -- Duckbones palette (from zenbones.nvim)
  bg = "#0E101A",           -- Deep dark blue-black
  bg_dark = "#080810",      -- Darker variant
  bg_highlight = "#1A1C2A", -- Slightly lighter for highlights
  bg_visual = "#37382D",    -- Selection background
  bg_search = "#4D3191",    -- Search highlight (purple tint)

  fg = "#EBEFC0",           -- Light cream/pale yellow (main text)
  fg_dark = "#B3B692",      -- Dimmed foreground
  fg_muted = "#5A5F7B",     -- Original muted comment color

  -- Accent colors (Duckbones specific)
  rose = "#E03600",         -- Bright orange-red (errors, important)
  leaf = "#5DCD97",         -- Mint green (strings, success)
  wood = "#E39500",         -- Warm orange/gold (constants, duck theme!)
  water = "#00A3CB",        -- Cyan/teal (functions, info)
  blossom = "#795CCC",      -- Purple/violet (keywords, statements)
  blossom1 = "#B3A1E6",     -- Light lavender (special)
  sky = "#00A3CB",          -- Cyan (same as water)

  -- Bright variants (from terminal colors)
  rose_bright = "#FF4821",
  leaf_bright = "#58DB9E",
  wood_bright = "#F6A100",
  water_bright = "#00B4E0",

  -- String color (distinctive muted green)
  string = "#AEB18D",

  -- KADE MODIFICATION: Bright, vivid comments using wood/gold
  -- Original: #5A5F7B (muted blue-gray, hard to read)
  -- New: Warm gold - bright, readable, and perfectly duck-themed!
  comment = "#E39500",

  -- Git
  git_add = "#5DCD97",
  git_change = "#E39500",
  git_delete = "#E03600",

  -- Diagnostics
  error = "#E03600",
  warning = "#E39500",
  info = "#00A3CB",
  hint = "#5DCD97",

  none = "NONE",
}

function M.load(config)
  local utils = require("kade.utils")
  config = config or {}

  -- Terminal colors (Duckbones 16-color palette)
  if config.terminal_colors then
    vim.g.terminal_color_0 = "#0E101A"  -- black
    vim.g.terminal_color_1 = "#E03600"  -- red
    vim.g.terminal_color_2 = "#5DCD97"  -- green
    vim.g.terminal_color_3 = "#E39500"  -- yellow
    vim.g.terminal_color_4 = "#00A3CB"  -- blue
    vim.g.terminal_color_5 = "#795CCC"  -- magenta
    vim.g.terminal_color_6 = "#00A3CB"  -- cyan
    vim.g.terminal_color_7 = "#EBEFC0"  -- white
    vim.g.terminal_color_8 = "#2B2F46"  -- bright black
    vim.g.terminal_color_9 = "#FF4821"  -- bright red
    vim.g.terminal_color_10 = "#58DB9E" -- bright green
    vim.g.terminal_color_11 = "#F6A100" -- bright yellow
    vim.g.terminal_color_12 = "#00B4E0" -- bright blue
    vim.g.terminal_color_13 = "#B3A1E6" -- bright magenta
    vim.g.terminal_color_14 = "#00B4E0" -- bright cyan
    vim.g.terminal_color_15 = "#B3B692" -- bright white
  end

  local bg = config.transparent and colors.none or colors.bg

  local highlights = {
    -- Editor
    Normal = { fg = colors.fg, bg = bg },
    NormalFloat = { fg = colors.fg, bg = colors.bg_dark },
    FloatBorder = { fg = colors.water, bg = colors.bg_dark },
    ColorColumn = { bg = colors.bg_highlight },
    Cursor = { fg = colors.bg, bg = colors.fg },
    CursorLine = { bg = colors.bg_highlight },
    CursorColumn = { bg = colors.bg_highlight },
    CursorLineNr = { fg = colors.wood, bold = true },
    LineNr = { fg = "#2B2F46" },
    SignColumn = { fg = "#2B2F46", bg = bg },
    VertSplit = { fg = colors.bg_highlight },
    WinSeparator = { fg = colors.bg_highlight },
    Folded = { fg = colors.water, bg = colors.bg_highlight },
    FoldColumn = { fg = "#2B2F46", bg = bg },
    IncSearch = { fg = colors.bg, bg = colors.wood_bright },
    Search = { fg = colors.fg, bg = colors.bg_search },
    CurSearch = { fg = colors.bg, bg = colors.wood_bright },
    MatchParen = { fg = colors.wood_bright, bold = true },
    ModeMsg = { fg = colors.fg_dark, bold = true },
    MoreMsg = { fg = colors.water },
    NonText = { fg = "#2B2F46" },
    Pmenu = { fg = colors.fg, bg = colors.bg_dark },
    PmenuSel = { fg = colors.fg, bg = colors.bg_visual },
    PmenuSbar = { bg = colors.bg_visual },
    PmenuThumb = { bg = colors.fg_muted },
    Question = { fg = colors.water },
    QuickFixLine = { bg = colors.bg_visual, bold = true },
    SpecialKey = { fg = "#2B2F46" },
    StatusLine = { fg = colors.fg, bg = colors.bg_dark },
    StatusLineNC = { fg = colors.fg_muted, bg = colors.bg_dark },
    TabLine = { fg = colors.fg_muted, bg = "#232738" },
    TabLineFill = { bg = "#232738" },
    TabLineSel = { fg = colors.fg, bg = colors.bg_search },
    Title = { fg = colors.water, bold = true },
    Visual = { bg = colors.bg_visual },
    VisualNOS = { bg = colors.bg_visual },
    WarningMsg = { fg = colors.warning },
    Whitespace = { fg = "#2B2F46" },
    WildMenu = { fg = colors.bg, bg = colors.water },

    -- Syntax - KADE bright comments (warm gold, duck-themed!)
    Comment = { fg = colors.comment, italic = true },

    Constant = { fg = colors.wood },
    String = { fg = colors.string, italic = true },
    Character = { fg = colors.leaf },
    Number = { fg = colors.wood },
    Boolean = { fg = colors.wood },
    Float = { fg = colors.wood },

    Identifier = { fg = colors.fg },
    Function = { fg = colors.water },

    Statement = { fg = colors.blossom, bold = true },
    Conditional = { fg = colors.blossom, bold = true },
    Repeat = { fg = colors.blossom, bold = true },
    Label = { fg = colors.blossom },
    Operator = { fg = colors.fg_dark },
    Keyword = { fg = colors.blossom, italic = true },
    Exception = { fg = colors.rose },

    PreProc = { fg = colors.blossom1 },
    Include = { fg = colors.blossom },
    Define = { fg = colors.blossom },
    Macro = { fg = colors.blossom1 },
    PreCondit = { fg = colors.blossom1 },

    Type = { fg = colors.leaf },
    StorageClass = { fg = colors.blossom },
    Structure = { fg = colors.leaf },
    Typedef = { fg = colors.leaf },

    Special = { fg = colors.blossom1 },
    SpecialChar = { fg = colors.blossom1 },
    Tag = { fg = colors.water },
    Delimiter = { fg = colors.fg_dark },
    SpecialComment = { fg = colors.comment, bold = true },
    Debug = { fg = colors.rose },

    Underlined = { fg = colors.water, underline = true },
    Bold = { bold = true },
    Italic = { italic = true },
    Ignore = { fg = colors.fg_muted },
    Error = { fg = colors.error },
    Todo = { fg = colors.bg, bg = colors.wood, bold = true },

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
    DiffAdd = { bg = "#1a2e24" },
    DiffChange = { bg = "#2a2518" },
    DiffDelete = { bg = "#2e1a1a" },
    DiffText = { bg = "#3a3020" },
    diffAdded = { fg = colors.git_add },
    diffChanged = { fg = colors.git_change },
    diffRemoved = { fg = colors.git_delete },

    -- TreeSitter
    ["@comment"] = { link = "Comment" },
    ["@constant"] = { fg = colors.wood },
    ["@constant.builtin"] = { fg = colors.wood },
    ["@constant.macro"] = { fg = colors.blossom1 },
    ["@string"] = { fg = colors.string, italic = true },
    ["@string.escape"] = { fg = colors.blossom1 },
    ["@string.regex"] = { fg = colors.wood },
    ["@character"] = { fg = colors.leaf },
    ["@number"] = { fg = colors.wood },
    ["@boolean"] = { fg = colors.wood },
    ["@float"] = { fg = colors.wood },
    ["@function"] = { fg = colors.water },
    ["@function.builtin"] = { fg = colors.water_bright },
    ["@function.macro"] = { fg = colors.blossom1 },
    ["@parameter"] = { fg = colors.fg },
    ["@method"] = { fg = colors.water },
    ["@field"] = { fg = colors.fg },
    ["@property"] = { fg = colors.fg },
    ["@constructor"] = { fg = colors.leaf },
    ["@conditional"] = { fg = colors.blossom, bold = true },
    ["@repeat"] = { fg = colors.blossom, bold = true },
    ["@label"] = { fg = colors.blossom },
    ["@operator"] = { fg = colors.fg_dark },
    ["@keyword"] = { fg = colors.blossom, italic = true },
    ["@keyword.function"] = { fg = colors.blossom, italic = true },
    ["@keyword.return"] = { fg = colors.blossom, italic = true },
    ["@exception"] = { fg = colors.rose },
    ["@variable"] = { fg = colors.fg },
    ["@variable.builtin"] = { fg = colors.rose },
    ["@type"] = { fg = colors.leaf },
    ["@type.builtin"] = { fg = colors.leaf },
    ["@type.definition"] = { fg = colors.leaf },
    ["@namespace"] = { fg = colors.fg },
    ["@include"] = { fg = colors.blossom },
    ["@preproc"] = { fg = colors.blossom1 },
    ["@define"] = { fg = colors.blossom1 },
    ["@macro"] = { fg = colors.blossom1 },
    ["@punctuation.delimiter"] = { fg = colors.fg_dark },
    ["@punctuation.bracket"] = { fg = colors.fg_dark },
    ["@punctuation.special"] = { fg = colors.blossom1 },
    ["@tag"] = { fg = colors.water },
    ["@tag.attribute"] = { fg = colors.leaf },
    ["@tag.delimiter"] = { fg = colors.fg_dark },
    ["@text"] = { fg = colors.fg },
    ["@text.strong"] = { bold = true },
    ["@text.emphasis"] = { italic = true },
    ["@text.underline"] = { underline = true },
    ["@text.title"] = { fg = colors.water, bold = true },
    ["@text.literal"] = { fg = colors.string },
    ["@text.uri"] = { fg = colors.water, underline = true },
    ["@text.todo"] = { link = "Todo" },

    -- LSP Semantic Tokens
    ["@lsp.type.comment"] = { link = "Comment" },
    ["@lsp.type.enum"] = { fg = colors.leaf },
    ["@lsp.type.interface"] = { fg = colors.leaf },
    ["@lsp.type.keyword"] = { fg = colors.blossom },
    ["@lsp.type.namespace"] = { fg = colors.fg },
    ["@lsp.type.parameter"] = { fg = colors.fg },
    ["@lsp.type.property"] = { fg = colors.fg },
    ["@lsp.type.variable"] = { fg = colors.fg },

    -- Telescope
    TelescopeNormal = { fg = colors.fg, bg = colors.bg_dark },
    TelescopeBorder = { fg = colors.water, bg = colors.bg_dark },
    TelescopePromptNormal = { fg = colors.fg, bg = colors.bg_highlight },
    TelescopePromptBorder = { fg = colors.bg_highlight, bg = colors.bg_highlight },
    TelescopePromptTitle = { fg = colors.bg, bg = colors.water },
    TelescopePreviewTitle = { fg = colors.bg, bg = colors.leaf },
    TelescopeResultsTitle = { fg = colors.bg, bg = colors.wood },
    TelescopeSelection = { bg = colors.bg_visual },
    TelescopeMatching = { fg = colors.wood_bright, bold = true },

    -- NvimTree
    NvimTreeNormal = { fg = colors.fg, bg = colors.bg_dark },
    NvimTreeRootFolder = { fg = colors.water, bold = true },
    NvimTreeFolderIcon = { fg = colors.wood },
    NvimTreeOpenedFolderName = { fg = colors.wood },
    NvimTreeGitDirty = { fg = colors.git_change },
    NvimTreeGitNew = { fg = colors.git_add },
    NvimTreeGitDeleted = { fg = colors.git_delete },

    -- GitSigns
    GitSignsAdd = { fg = colors.git_add },
    GitSignsChange = { fg = colors.git_change },
    GitSignsDelete = { fg = colors.git_delete },

    -- Indent Blankline
    IndentBlanklineChar = { fg = colors.bg_highlight },
    IndentBlanklineContextChar = { fg = colors.blossom },

    -- nvim-cmp
    CmpItemAbbr = { fg = colors.fg },
    CmpItemAbbrMatch = { fg = colors.water, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = colors.water, bold = true },
    CmpItemKind = { fg = colors.blossom },
    CmpItemMenu = { fg = colors.fg_muted },
  }

  utils.apply_highlights(highlights)
end

return M
