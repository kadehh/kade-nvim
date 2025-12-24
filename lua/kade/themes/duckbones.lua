-- kade-duckbones: Duckbones with bright, readable comments
-- Based on zenbones-theme/zenbones.nvim (duckbones variant)
-- Exact colors extracted from the official repository

local M = {}

local colors = {
  -- Duckbones palette (exact from zenbones.nvim)
  bg = "#0E101A",
  bg_dark = "#0A0B12",
  bg_float = "#222536",
  bg_highlight = "#161926",
  bg_visual = "#37382D",
  bg_search = "#4D3191",
  bg_statusline = "#232738",
  bg_colorcolumn = "#443426",

  fg = "#EBEFC0",
  fg_dark = "#B3B692",
  fg_dim = "#F0F5C4",

  -- Syntax colors (exact from source)
  identifier = "#C6CAA1",
  constant = "#AEB18D",       -- Also used for strings, numbers
  type = "#898FB1",
  delimiter = "#6D759D",
  comment_orig = "#5A5F7B",   -- Original muted comment

  -- Accent colors (from palette.lua)
  rose = "#E03600",           -- Errors
  leaf = "#5DCD97",           -- Special, success
  wood = "#E39500",           -- Warnings, orange accent
  water = "#00A3CB",          -- PreProc, info
  blossom = "#795CCC",        -- Statements, keywords
  blossom1 = "#B3A1E6",       -- Light lavender

  -- Bright variants (terminal colors)
  rose_bright = "#FF4821",
  leaf_bright = "#58DB9E",
  wood_bright = "#F6A100",
  water_bright = "#00B4E0",

  -- UI elements
  line_nr = "#51587A",
  float_border = "#6B729B",
  non_text = "#484E6D",
  fold = "#9A9FBC",
  fold_bg = "#272B3E",
  incsearch_bg = "#9A87DC",
  lsp_inlay = "#596392",

  -- KADE MODIFICATION: Bright, vivid comments
  -- Original: #5A5F7B (muted blue-gray, hard to read)
  -- New: Using water/cyan - bright, readable, fits the cool-toned theme
  comment = "#00A3CB",

  -- Git
  git_add = "#5DCD97",
  git_change = "#00A3CB",
  git_delete = "#E03600",

  -- Diagnostics
  error = "#E03600",
  warning = "#E39500",
  info = "#00A3CB",
  hint = "#795CCC",
  ok = "#5DCD97",

  none = "NONE",
}

function M.load(config)
  local utils = require("kade.utils")
  config = config or {}

  -- Terminal colors (exact from duckbones.vim)
  if config.terminal_colors then
    vim.g.terminal_color_0 = "#0E101A"
    vim.g.terminal_color_1 = "#E03600"
    vim.g.terminal_color_2 = "#5DCD97"
    vim.g.terminal_color_3 = "#E39500"
    vim.g.terminal_color_4 = "#00A3CB"
    vim.g.terminal_color_5 = "#795CCC"
    vim.g.terminal_color_6 = "#00A3CB"
    vim.g.terminal_color_7 = "#EBEFC0"
    vim.g.terminal_color_8 = "#2B2F46"
    vim.g.terminal_color_9 = "#FF4821"
    vim.g.terminal_color_10 = "#58DB9E"
    vim.g.terminal_color_11 = "#F6A100"
    vim.g.terminal_color_12 = "#00B4E0"
    vim.g.terminal_color_13 = "#B3A1E6"
    vim.g.terminal_color_14 = "#00B4E0"
    vim.g.terminal_color_15 = "#B3B692"
  end

  local bg = config.transparent and colors.none or colors.bg

  local highlights = {
    -- Editor (exact matches from duckbones.vim)
    Normal = { fg = colors.fg, bg = bg },
    NormalFloat = { fg = colors.fg, bg = colors.bg_float },
    FloatBorder = { fg = colors.float_border },
    FloatTitle = { fg = colors.fg, bg = colors.bg_float, bold = true },
    ColorColumn = { bg = colors.bg_colorcolumn },
    Cursor = { fg = colors.bg, bg = "#EDF2C2" },
    lCursor = { fg = colors.bg, bg = "#939677" },
    CursorLine = { bg = colors.bg_highlight },
    CursorColumn = { bg = colors.bg_highlight },
    CursorLineNr = { fg = colors.fg, bold = true },
    LineNr = { fg = colors.line_nr },
    SignColumn = { fg = colors.line_nr },
    VertSplit = { fg = colors.line_nr },
    WinSeparator = { fg = colors.line_nr },
    Folded = { fg = colors.fold, bg = colors.fold_bg },
    FoldColumn = { fg = colors.line_nr, bold = true },
    IncSearch = { fg = colors.bg, bg = colors.incsearch_bg, bold = true },
    CurSearch = { fg = colors.bg, bg = colors.incsearch_bg, bold = true },
    Search = { fg = colors.fg, bg = colors.bg_search },
    MatchParen = { fg = colors.fg, bg = colors.bg_search },
    ModeMsg = { fg = colors.fg },
    MoreMsg = { fg = colors.leaf, bold = true },
    NonText = { fg = colors.non_text },
    EndOfBuffer = { fg = colors.non_text },
    Whitespace = { fg = colors.non_text },
    Pmenu = { bg = colors.bg_float },
    PmenuSel = { bg = "#383C55" },
    PmenuSbar = { bg = "#4B5170" },
    PmenuThumb = { bg = "#757DA3" },
    Question = { fg = colors.leaf, bold = true },
    QuickFixLine = { fg = colors.fg, bg = colors.bg_search },
    SpecialKey = { fg = colors.non_text, italic = true },
    StatusLine = { fg = colors.fg, bg = colors.bg_statusline },
    StatusLineNC = { fg = colors.fg_dim, bg = "#1A1D2B" },
    TabLine = { fg = colors.fg, bg = colors.bg_statusline },
    TabLineFill = { fg = colors.fg_dim, bg = "#1A1D2B" },
    TabLineSel = { bold = true },
    Title = { fg = colors.fg, bold = true },
    Visual = { bg = colors.bg_visual },
    VisualNOS = { bg = colors.bg_visual },
    WarningMsg = { fg = colors.warning },
    WildMenu = { fg = colors.bg, bg = colors.blossom },
    WinBar = { fg = colors.fg, bg = colors.bg_statusline },
    WinBarNC = { fg = colors.fg_dim, bg = "#1A1D2B" },

    -- Syntax - KADE bright comments (cyan for readability)
    Comment = { fg = colors.comment, italic = true },
    SpecialComment = { fg = colors.comment_orig },

    Constant = { fg = colors.constant, italic = true },
    String = { fg = colors.constant, italic = true },
    Character = { fg = colors.constant, italic = true },
    Number = { fg = colors.constant },
    Float = { fg = colors.constant },
    Boolean = { fg = colors.fg, italic = true },

    Identifier = { fg = colors.identifier },
    Function = { fg = colors.fg },

    Statement = { fg = colors.blossom, bold = true },
    Conditional = { fg = colors.blossom, bold = true },
    Repeat = { fg = colors.blossom, bold = true },
    Label = { fg = colors.blossom, bold = true },
    Operator = { fg = colors.fg },
    Keyword = { fg = colors.blossom, bold = true },
    Exception = { fg = colors.blossom, bold = true },

    PreProc = { fg = colors.water },
    Include = { fg = colors.water },
    Define = { fg = colors.water },
    Macro = { fg = colors.water },
    PreCondit = { fg = colors.water },

    Type = { fg = colors.type },
    StorageClass = { fg = colors.type },
    Structure = { fg = colors.type },
    Typedef = { fg = colors.type },

    Special = { fg = colors.leaf },
    SpecialChar = { fg = colors.leaf },
    Tag = { fg = colors.leaf },
    Delimiter = { fg = colors.delimiter },
    Debug = { fg = colors.rose },

    Underlined = { underline = true },
    Bold = { bold = true },
    Italic = { italic = true },
    Ignore = { fg = colors.line_nr },
    Error = { fg = colors.error },
    Todo = { bold = true, underline = true },

    -- Diagnostics
    DiagnosticError = { fg = colors.error },
    DiagnosticWarn = { fg = colors.warning },
    DiagnosticInfo = { fg = colors.info },
    DiagnosticHint = { fg = colors.hint },
    DiagnosticOk = { fg = colors.ok },
    DiagnosticSignError = { fg = colors.error },
    DiagnosticSignWarn = { fg = colors.warning },
    DiagnosticSignInfo = { fg = colors.info },
    DiagnosticSignHint = { fg = colors.hint },
    DiagnosticSignOk = { fg = colors.ok },
    DiagnosticUnderlineError = { undercurl = true, sp = colors.error },
    DiagnosticUnderlineWarn = { undercurl = true, sp = colors.warning },
    DiagnosticUnderlineInfo = { undercurl = true, sp = colors.info },
    DiagnosticUnderlineHint = { undercurl = true, sp = colors.hint },
    DiagnosticUnderlineOk = { undercurl = true, sp = colors.ok },
    DiagnosticVirtualTextError = { fg = colors.error, bg = "#1E1818" },
    DiagnosticVirtualTextWarn = { fg = colors.warning, bg = "#1B1918" },
    DiagnosticVirtualTextInfo = { fg = colors.info, bg = "#181A1B" },
    DiagnosticVirtualTextHint = { fg = colors.hint, bg = "#1A191E" },
    DiagnosticVirtualTextOk = { fg = colors.ok, bg = "#181A19" },

    -- LSP
    LspReferenceRead = { bg = colors.bg_colorcolumn },
    LspReferenceText = { bg = colors.bg_colorcolumn },
    LspReferenceWrite = { bg = colors.bg_colorcolumn },
    LspInlayHint = { fg = colors.lsp_inlay, bg = colors.bg_highlight },
    LspCodeLens = { fg = colors.line_nr },

    -- Git
    DiffAdd = { bg = "#15251C" },
    DiffChange = { bg = "#17232A" },
    DiffDelete = { bg = "#311C1A" },
    DiffText = { fg = colors.fg, bg = "#2A3E48" },
    diffAdded = { bg = "#15251C" },
    diffChanged = { bg = "#17232A" },
    diffRemoved = { bg = "#311C1A" },
    diffFile = { fg = colors.wood, bold = true },
    diffIndexLine = { fg = colors.wood },
    diffLine = { fg = colors.blossom, bold = true },
    diffNewFile = { fg = colors.leaf, italic = true },
    diffOldFile = { fg = colors.rose, italic = true },

    -- TreeSitter
    ["@comment"] = { link = "Comment" },
    ["@constant"] = { fg = colors.constant, italic = true },
    ["@constant.builtin"] = { fg = colors.constant, italic = true },
    ["@constant.macro"] = { fg = colors.constant, italic = true },
    ["@string"] = { fg = colors.constant, italic = true },
    ["@string.escape"] = { fg = colors.leaf },
    ["@string.regex"] = { fg = colors.leaf },
    ["@character"] = { fg = colors.constant, italic = true },
    ["@number"] = { fg = colors.constant },
    ["@boolean"] = { fg = colors.fg, italic = true },
    ["@float"] = { fg = colors.constant },
    ["@function"] = { fg = colors.fg },
    ["@function.builtin"] = { fg = colors.fg },
    ["@function.macro"] = { fg = colors.water },
    ["@parameter"] = { fg = colors.identifier },
    ["@method"] = { fg = colors.fg },
    ["@field"] = { fg = colors.identifier },
    ["@property"] = { fg = colors.identifier },
    ["@constructor"] = { fg = colors.type },
    ["@conditional"] = { fg = colors.blossom, bold = true },
    ["@repeat"] = { fg = colors.blossom, bold = true },
    ["@label"] = { fg = colors.blossom, bold = true },
    ["@operator"] = { fg = colors.fg },
    ["@keyword"] = { fg = colors.blossom, bold = true },
    ["@keyword.function"] = { fg = colors.blossom, bold = true },
    ["@keyword.return"] = { fg = colors.blossom, bold = true },
    ["@exception"] = { fg = colors.blossom, bold = true },
    ["@variable"] = { fg = colors.fg },
    ["@variable.builtin"] = { fg = colors.identifier },
    ["@type"] = { fg = colors.type },
    ["@type.builtin"] = { fg = colors.type },
    ["@type.definition"] = { fg = colors.type },
    ["@namespace"] = { fg = colors.identifier },
    ["@include"] = { fg = colors.water },
    ["@preproc"] = { fg = colors.water },
    ["@define"] = { fg = colors.water },
    ["@macro"] = { fg = colors.water },
    ["@punctuation.delimiter"] = { fg = colors.delimiter },
    ["@punctuation.bracket"] = { fg = colors.delimiter },
    ["@punctuation.special"] = { fg = colors.leaf },
    ["@tag"] = { fg = colors.blossom },
    ["@tag.attribute"] = { fg = colors.identifier },
    ["@tag.delimiter"] = { fg = colors.delimiter },
    ["@text"] = { fg = colors.fg },
    ["@text.strong"] = { bold = true },
    ["@text.emphasis"] = { italic = true },
    ["@text.underline"] = { underline = true },
    ["@text.title"] = { fg = colors.fg, bold = true },
    ["@text.literal"] = { fg = colors.type },
    ["@text.uri"] = { fg = colors.water, underline = true },
    ["@text.todo"] = { bold = true, underline = true },

    -- LSP Semantic Tokens
    ["@lsp.type.comment"] = { link = "Comment" },
    ["@lsp.type.enum"] = { fg = colors.type },
    ["@lsp.type.interface"] = { fg = colors.type },
    ["@lsp.type.keyword"] = { fg = colors.blossom, bold = true },
    ["@lsp.type.namespace"] = { fg = colors.identifier },
    ["@lsp.type.parameter"] = { fg = colors.identifier },
    ["@lsp.type.property"] = { fg = colors.identifier },
    ["@lsp.type.variable"] = { fg = colors.fg },

    -- Telescope
    TelescopeNormal = { bg = colors.bg_float },
    TelescopeBorder = { fg = colors.float_border, bg = colors.bg_float },
    TelescopePromptNormal = { bg = colors.bg_highlight },
    TelescopePromptBorder = { fg = colors.bg_highlight, bg = colors.bg_highlight },
    TelescopePromptTitle = { fg = colors.bg, bg = colors.water },
    TelescopePreviewTitle = { fg = colors.bg, bg = colors.leaf },
    TelescopeResultsTitle = { fg = colors.bg, bg = colors.blossom },
    TelescopeSelection = { bg = "#383C55" },
    TelescopeMatching = { fg = colors.blossom, bold = true },

    -- NvimTree
    NvimTreeNormal = { fg = colors.fg, bg = colors.bg_float },
    NvimTreeRootFolder = { fg = colors.water, bold = true },
    NvimTreeFolderIcon = { fg = colors.water },
    NvimTreeOpenedFolderName = { fg = colors.water },
    NvimTreeGitDirty = { fg = colors.git_change },
    NvimTreeGitNew = { fg = colors.git_add },
    NvimTreeGitDeleted = { fg = colors.git_delete },

    -- GitSigns
    GitSignsAdd = { fg = colors.git_add },
    GitSignsChange = { fg = colors.git_change },
    GitSignsDelete = { fg = colors.git_delete },

    -- Indent Blankline
    IblIndent = { fg = "#1F212D" },
    IblScope = { fg = "#393D50" },
    IndentBlanklineChar = { fg = "#1F212D" },
    IndentBlanklineContextChar = { fg = "#393D50" },

    -- nvim-cmp
    CmpItemAbbr = { fg = colors.fg },
    CmpItemAbbrMatch = { fg = colors.blossom, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = colors.blossom, bold = true },
    CmpItemKind = { fg = colors.type },
    CmpItemMenu = { fg = colors.delimiter },

    -- Flash
    FlashBackdrop = { fg = colors.comment_orig },
    FlashLabel = { fg = colors.fg, bg = "#004B5F" },

    -- Snacks
    SnacksIndent = { fg = "#1F212D" },
    SnacksIndentScope = { fg = "#393D50" },
    SnacksPickerMatch = { fg = colors.blossom, bold = true },
    SnacksPickerBorder = { bg = colors.bg_float },

    -- FzfLua
    FzfLuaBufFlagAlt = { fg = colors.water },
    FzfLuaBufFlagCur = { fg = colors.wood },
    FzfLuaBufNr = { fg = colors.leaf },
    FzfLuaFzfMatch = { fg = colors.blossom, bold = true },
    FzfLuaHeaderBind = { fg = colors.leaf },
    FzfLuaHeaderText = { fg = colors.wood },
    FzfLuaLiveSym = { fg = colors.wood },
    FzfLuaPathColNr = { fg = colors.type, bold = true },
    FzfLuaPathLineNr = { fg = colors.type, bold = true },
    FzfLuaTabMarker = { fg = colors.leaf },
    FzfLuaTabTitle = { fg = colors.water },
    FzfLuaBufName = { fg = colors.blossom, bold = true },
    FzfLuaTitle = { fg = colors.fg, bold = true },
    FzfLuaFzfCursorLine = { bg = colors.bg_highlight },

    -- Markdown
    markdownCode = { fg = colors.type },
    markdownUrl = { fg = colors.comment_orig },
    markdownLinkText = { fg = colors.identifier, underline = true },
    markdownLinkTextDelimiter = { fg = colors.delimiter },

    -- Help
    helpSpecial = { fg = colors.type },
    helpOption = { fg = colors.constant, italic = true },
    helpHyperTextEntry = { fg = colors.type, bold = true },
    helpHyperTextJump = { fg = colors.identifier, underline = true },

    -- Render Markdown
    RenderMarkdownCode = { bg = colors.bg_highlight },
  }

  utils.apply_highlights(highlights)
end

return M
