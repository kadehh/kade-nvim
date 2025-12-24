-- kade-kanagawa: Kanagawa with bright, readable comments
-- Based on rebelot/kanagawa.nvim (wave variant)

local M = {}

local colors = {
  -- Base colors (wave variant)
  bg = "#1F1F28",
  bg_dark = "#16161D",
  bg_light = "#2A2A37",
  bg_highlight = "#363646",
  bg_search = "#2D4F67",
  bg_visual = "#2D4F67",

  fg = "#DCD7BA",
  fg_dark = "#C8C093",
  fg_comment = "#727169", -- original

  -- KADE MODIFICATION: Bright, vivid comments using crystal blue
  -- Original: #727169 (muted gray, hard to read)
  -- New: Crystal blue - bright yet harmonious with Japanese ink aesthetic
  comment = "#7FB4CA",

  -- Diagnostic/UI
  diag_error = "#E82424",
  diag_warn = "#FF9E3B",
  diag_info = "#6A9589",
  diag_hint = "#658594",

  -- Palette
  fuji_white = "#DCD7BA",
  old_white = "#C8C093",
  sumi_ink0 = "#16161D",
  sumi_ink1 = "#1F1F28",
  sumi_ink2 = "#2A2A37",
  sumi_ink3 = "#363646",
  sumi_ink4 = "#54546D",
  wave_blue1 = "#223249",
  wave_blue2 = "#2D4F67",
  wave_aqua1 = "#6A9589",
  wave_aqua2 = "#7AA89F",

  -- Syntax
  spring_violet1 = "#938AA9",
  spring_violet2 = "#9CABCA",
  spring_blue = "#7E9CD8",
  spring_green = "#98BB6C",
  boat_yellow1 = "#938056",
  boat_yellow2 = "#C0A36E",
  carp_yellow = "#E6C384",
  sakura_pink = "#D27E99",
  wave_red = "#E46876",
  peach_red = "#FF5D62",
  surimi_orange = "#FFA066",
  katana_gray = "#717C7C",
  dragon_blue = "#658594",
  fuji_gray = "#727169",
  autumn_green = "#76946A",
  autumn_red = "#C34043",
  autumn_yellow = "#DCA561",
  ronin_yellow = "#FF9E3B",
  crystal_blue = "#7FB4CA",
  light_blue = "#A3D4D5",

  none = "NONE",
}

function M.load(config)
  local utils = require("kade.utils")
  config = config or {}

  -- Terminal colors
  if config.terminal_colors then
    vim.g.terminal_color_0 = colors.sumi_ink0
    vim.g.terminal_color_1 = colors.autumn_red
    vim.g.terminal_color_2 = colors.autumn_green
    vim.g.terminal_color_3 = colors.boat_yellow2
    vim.g.terminal_color_4 = colors.crystal_blue
    vim.g.terminal_color_5 = colors.spring_violet1
    vim.g.terminal_color_6 = colors.wave_aqua1
    vim.g.terminal_color_7 = colors.old_white
    vim.g.terminal_color_8 = colors.fuji_gray
    vim.g.terminal_color_9 = colors.wave_red
    vim.g.terminal_color_10 = colors.spring_green
    vim.g.terminal_color_11 = colors.carp_yellow
    vim.g.terminal_color_12 = colors.spring_blue
    vim.g.terminal_color_13 = colors.sakura_pink
    vim.g.terminal_color_14 = colors.wave_aqua2
    vim.g.terminal_color_15 = colors.fuji_white
  end

  local bg = config.transparent and colors.none or colors.bg

  local highlights = {
    -- Editor
    Normal = { fg = colors.fuji_white, bg = bg },
    NormalFloat = { fg = colors.fuji_white, bg = colors.bg_dark },
    FloatBorder = { fg = colors.sumi_ink4, bg = colors.bg_dark },
    ColorColumn = { bg = colors.bg_light },
    Cursor = { fg = colors.bg, bg = colors.fuji_white },
    CursorLine = { bg = colors.bg_highlight },
    CursorColumn = { bg = colors.bg_highlight },
    CursorLineNr = { fg = colors.carp_yellow, bold = true },
    LineNr = { fg = colors.sumi_ink4 },
    SignColumn = { fg = colors.sumi_ink4, bg = bg },
    VertSplit = { fg = colors.bg_light },
    WinSeparator = { fg = colors.bg_light },
    Folded = { fg = colors.dragon_blue, bg = colors.bg_light },
    FoldColumn = { fg = colors.sumi_ink4, bg = bg },
    IncSearch = { fg = colors.bg, bg = colors.carp_yellow },
    Search = { fg = colors.fg, bg = colors.bg_search },
    CurSearch = { fg = colors.bg, bg = colors.carp_yellow },
    MatchParen = { fg = colors.ronin_yellow, bold = true },
    ModeMsg = { fg = colors.old_white, bold = true },
    MoreMsg = { fg = colors.wave_aqua1 },
    NonText = { fg = colors.sumi_ink4 },
    Pmenu = { fg = colors.fuji_white, bg = colors.bg_dark },
    PmenuSel = { fg = colors.fuji_white, bg = colors.wave_blue1 },
    PmenuSbar = { bg = colors.bg_light },
    PmenuThumb = { bg = colors.sumi_ink4 },
    Question = { fg = colors.wave_aqua1 },
    QuickFixLine = { bg = colors.bg_visual, bold = true },
    SpecialKey = { fg = colors.sumi_ink4 },
    StatusLine = { fg = colors.fuji_white, bg = colors.bg_dark },
    StatusLineNC = { fg = colors.sumi_ink4, bg = colors.bg_dark },
    TabLine = { fg = colors.sumi_ink4, bg = colors.bg_dark },
    TabLineFill = { bg = colors.bg_dark },
    TabLineSel = { fg = colors.fuji_white, bg = colors.bg_highlight },
    Title = { fg = colors.spring_blue, bold = true },
    Visual = { bg = colors.bg_visual },
    VisualNOS = { bg = colors.bg_visual },
    WarningMsg = { fg = colors.ronin_yellow },
    Whitespace = { fg = colors.sumi_ink4 },
    WildMenu = { bg = colors.bg_visual },

    -- Syntax - KADE bright comments
    Comment = { fg = colors.comment, italic = true },

    Constant = { fg = colors.surimi_orange },
    String = { fg = colors.spring_green },
    Character = { fg = colors.spring_green },
    Number = { fg = colors.sakura_pink },
    Boolean = { fg = colors.surimi_orange },
    Float = { fg = colors.sakura_pink },

    Identifier = { fg = colors.fuji_white },
    Function = { fg = colors.spring_blue },

    Statement = { fg = colors.spring_violet2 },
    Conditional = { fg = colors.spring_violet2 },
    Repeat = { fg = colors.spring_violet2 },
    Label = { fg = colors.spring_violet2 },
    Operator = { fg = colors.boat_yellow2 },
    Keyword = { fg = colors.spring_violet2, italic = true },
    Exception = { fg = colors.peach_red },

    PreProc = { fg = colors.wave_red },
    Include = { fg = colors.spring_violet2 },
    Define = { fg = colors.spring_violet2 },
    Macro = { fg = colors.carp_yellow },
    PreCondit = { fg = colors.wave_red },

    Type = { fg = colors.wave_aqua2 },
    StorageClass = { fg = colors.spring_violet2 },
    Structure = { fg = colors.wave_aqua2 },
    Typedef = { fg = colors.wave_aqua2 },

    Special = { fg = colors.carp_yellow },
    SpecialChar = { fg = colors.carp_yellow },
    Tag = { fg = colors.spring_blue },
    Delimiter = { fg = colors.old_white },
    SpecialComment = { fg = colors.comment },
    Debug = { fg = colors.peach_red },

    Underlined = { fg = colors.crystal_blue, underline = true },
    Bold = { bold = true },
    Italic = { italic = true },
    Ignore = { fg = colors.sumi_ink4 },
    Error = { fg = colors.peach_red },
    Todo = { fg = colors.bg, bg = colors.carp_yellow, bold = true },

    -- Diagnostics
    DiagnosticError = { fg = colors.diag_error },
    DiagnosticWarn = { fg = colors.diag_warn },
    DiagnosticInfo = { fg = colors.diag_info },
    DiagnosticHint = { fg = colors.diag_hint },
    DiagnosticUnderlineError = { undercurl = true, sp = colors.diag_error },
    DiagnosticUnderlineWarn = { undercurl = true, sp = colors.diag_warn },
    DiagnosticUnderlineInfo = { undercurl = true, sp = colors.diag_info },
    DiagnosticUnderlineHint = { undercurl = true, sp = colors.diag_hint },

    -- Git
    DiffAdd = { bg = "#2b3328" },
    DiffChange = { bg = "#24283b" },
    DiffDelete = { bg = "#43242b" },
    DiffText = { bg = "#394b70" },
    diffAdded = { fg = colors.autumn_green },
    diffChanged = { fg = colors.autumn_yellow },
    diffRemoved = { fg = colors.autumn_red },

    -- TreeSitter
    ["@comment"] = { link = "Comment" },
    ["@constant"] = { fg = colors.surimi_orange },
    ["@constant.builtin"] = { fg = colors.surimi_orange },
    ["@constant.macro"] = { fg = colors.carp_yellow },
    ["@string"] = { fg = colors.spring_green },
    ["@string.escape"] = { fg = colors.spring_blue },
    ["@string.regex"] = { fg = colors.boat_yellow2 },
    ["@character"] = { fg = colors.spring_green },
    ["@number"] = { fg = colors.sakura_pink },
    ["@boolean"] = { fg = colors.surimi_orange },
    ["@float"] = { fg = colors.sakura_pink },
    ["@function"] = { fg = colors.spring_blue },
    ["@function.builtin"] = { fg = colors.crystal_blue },
    ["@function.macro"] = { fg = colors.carp_yellow },
    ["@parameter"] = { fg = colors.carp_yellow },
    ["@method"] = { fg = colors.spring_blue },
    ["@field"] = { fg = colors.fuji_white },
    ["@property"] = { fg = colors.fuji_white },
    ["@constructor"] = { fg = colors.spring_violet2 },
    ["@conditional"] = { fg = colors.spring_violet2 },
    ["@repeat"] = { fg = colors.spring_violet2 },
    ["@label"] = { fg = colors.spring_violet2 },
    ["@operator"] = { fg = colors.boat_yellow2 },
    ["@keyword"] = { fg = colors.spring_violet2, italic = true },
    ["@keyword.function"] = { fg = colors.spring_violet2, italic = true },
    ["@keyword.return"] = { fg = colors.spring_violet2, italic = true },
    ["@exception"] = { fg = colors.peach_red },
    ["@variable"] = { fg = colors.fuji_white },
    ["@variable.builtin"] = { fg = colors.wave_red },
    ["@type"] = { fg = colors.wave_aqua2 },
    ["@type.builtin"] = { fg = colors.wave_aqua2 },
    ["@type.definition"] = { fg = colors.wave_aqua2 },
    ["@namespace"] = { fg = colors.surimi_orange },
    ["@include"] = { fg = colors.spring_violet2 },
    ["@preproc"] = { fg = colors.wave_red },
    ["@define"] = { fg = colors.wave_red },
    ["@macro"] = { fg = colors.carp_yellow },
    ["@punctuation.delimiter"] = { fg = colors.old_white },
    ["@punctuation.bracket"] = { fg = colors.old_white },
    ["@punctuation.special"] = { fg = colors.boat_yellow2 },
    ["@tag"] = { fg = colors.spring_blue },
    ["@tag.attribute"] = { fg = colors.wave_aqua2 },
    ["@tag.delimiter"] = { fg = colors.old_white },
    ["@text"] = { fg = colors.fuji_white },
    ["@text.strong"] = { bold = true },
    ["@text.emphasis"] = { italic = true },
    ["@text.underline"] = { underline = true },
    ["@text.title"] = { fg = colors.spring_blue, bold = true },
    ["@text.literal"] = { fg = colors.spring_green },
    ["@text.uri"] = { fg = colors.crystal_blue, underline = true },
    ["@text.todo"] = { link = "Todo" },

    -- LSP Semantic Tokens
    ["@lsp.type.comment"] = { link = "Comment" },
    ["@lsp.type.enum"] = { fg = colors.wave_aqua2 },
    ["@lsp.type.interface"] = { fg = colors.wave_aqua2 },
    ["@lsp.type.keyword"] = { fg = colors.spring_violet2 },
    ["@lsp.type.namespace"] = { fg = colors.surimi_orange },
    ["@lsp.type.parameter"] = { fg = colors.carp_yellow },
    ["@lsp.type.property"] = { fg = colors.fuji_white },
    ["@lsp.type.variable"] = { fg = colors.fuji_white },

    -- Telescope
    TelescopeNormal = { fg = colors.fuji_white, bg = colors.bg_dark },
    TelescopeBorder = { fg = colors.sumi_ink4, bg = colors.bg_dark },
    TelescopePromptNormal = { fg = colors.fuji_white, bg = colors.bg_light },
    TelescopePromptBorder = { fg = colors.bg_light, bg = colors.bg_light },
    TelescopePromptTitle = { fg = colors.bg, bg = colors.spring_blue },
    TelescopePreviewTitle = { fg = colors.bg, bg = colors.spring_green },
    TelescopeResultsTitle = { fg = colors.bg, bg = colors.wave_aqua1 },
    TelescopeSelection = { bg = colors.bg_highlight },
    TelescopeMatching = { fg = colors.carp_yellow, bold = true },

    -- NvimTree
    NvimTreeNormal = { fg = colors.fuji_white, bg = colors.bg_dark },
    NvimTreeRootFolder = { fg = colors.spring_blue, bold = true },
    NvimTreeFolderIcon = { fg = colors.spring_blue },
    NvimTreeOpenedFolderName = { fg = colors.spring_blue },
    NvimTreeGitDirty = { fg = colors.autumn_yellow },
    NvimTreeGitNew = { fg = colors.autumn_green },
    NvimTreeGitDeleted = { fg = colors.autumn_red },

    -- GitSigns
    GitSignsAdd = { fg = colors.autumn_green },
    GitSignsChange = { fg = colors.autumn_yellow },
    GitSignsDelete = { fg = colors.autumn_red },

    -- Indent Blankline
    IndentBlanklineChar = { fg = colors.bg_light },
    IndentBlanklineContextChar = { fg = colors.spring_violet1 },

    -- nvim-cmp
    CmpItemAbbr = { fg = colors.fuji_white },
    CmpItemAbbrMatch = { fg = colors.carp_yellow, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = colors.carp_yellow, bold = true },
    CmpItemKind = { fg = colors.spring_violet1 },
    CmpItemMenu = { fg = colors.sumi_ink4 },
  }

  utils.apply_highlights(highlights)
end

return M
