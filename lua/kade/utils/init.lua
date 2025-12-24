-- Utility functions for kade-nvim colorscheme
local M = {}

-- Convert hex color to RGB
function M.hex_to_rgb(hex)
  hex = hex:gsub("#", "")
  return {
    r = tonumber(hex:sub(1, 2), 16),
    g = tonumber(hex:sub(3, 4), 16),
    b = tonumber(hex:sub(5, 6), 16),
  }
end

-- Convert RGB to hex
function M.rgb_to_hex(rgb)
  return string.format("#%02x%02x%02x", rgb.r, rgb.g, rgb.b)
end

-- Convert RGB to HSL
function M.rgb_to_hsl(rgb)
  local r, g, b = rgb.r / 255, rgb.g / 255, rgb.b / 255
  local max, min = math.max(r, g, b), math.min(r, g, b)
  local h, s, l = 0, 0, (max + min) / 2

  if max ~= min then
    local d = max - min
    s = l > 0.5 and d / (2 - max - min) or d / (max + min)

    if max == r then
      h = (g - b) / d + (g < b and 6 or 0)
    elseif max == g then
      h = (b - r) / d + 2
    else
      h = (r - g) / d + 4
    end

    h = h / 6
  end

  return { h = h * 360, s = s * 100, l = l * 100 }
end

-- Convert HSL to RGB
function M.hsl_to_rgb(hsl)
  local h, s, l = hsl.h / 360, hsl.s / 100, hsl.l / 100

  local function hue_to_rgb(p, q, t)
    if t < 0 then t = t + 1 end
    if t > 1 then t = t - 1 end
    if t < 1 / 6 then return p + (q - p) * 6 * t end
    if t < 1 / 2 then return q end
    if t < 2 / 3 then return p + (q - p) * (2 / 3 - t) * 6 end
    return p
  end

  local r, g, b

  if s == 0 then
    r, g, b = l, l, l
  else
    local q = l < 0.5 and l * (1 + s) or l + s - l * s
    local p = 2 * l - q
    r = hue_to_rgb(p, q, h + 1 / 3)
    g = hue_to_rgb(p, q, h)
    b = hue_to_rgb(p, q, h - 1 / 3)
  end

  return {
    r = math.floor(r * 255 + 0.5),
    g = math.floor(g * 255 + 0.5),
    b = math.floor(b * 255 + 0.5),
  }
end

-- Lighten a color by a percentage
function M.lighten(hex, amount)
  local rgb = M.hex_to_rgb(hex)
  local hsl = M.rgb_to_hsl(rgb)
  hsl.l = math.min(100, hsl.l + amount)
  return M.rgb_to_hex(M.hsl_to_rgb(hsl))
end

-- Darken a color by a percentage
function M.darken(hex, amount)
  local rgb = M.hex_to_rgb(hex)
  local hsl = M.rgb_to_hsl(rgb)
  hsl.l = math.max(0, hsl.l - amount)
  return M.rgb_to_hex(M.hsl_to_rgb(hsl))
end

-- Increase saturation
function M.saturate(hex, amount)
  local rgb = M.hex_to_rgb(hex)
  local hsl = M.rgb_to_hsl(rgb)
  hsl.s = math.min(100, hsl.s + amount)
  return M.rgb_to_hex(M.hsl_to_rgb(hsl))
end

-- Blend two colors
function M.blend(hex1, hex2, factor)
  factor = factor or 0.5
  local rgb1 = M.hex_to_rgb(hex1)
  local rgb2 = M.hex_to_rgb(hex2)

  return M.rgb_to_hex({
    r = math.floor(rgb1.r * (1 - factor) + rgb2.r * factor + 0.5),
    g = math.floor(rgb1.g * (1 - factor) + rgb2.g * factor + 0.5),
    b = math.floor(rgb1.b * (1 - factor) + rgb2.b * factor + 0.5),
  })
end

-- Calculate contrast ratio between two colors (WCAG)
function M.contrast_ratio(hex1, hex2)
  local function relative_luminance(hex)
    local rgb = M.hex_to_rgb(hex)
    local function channel(c)
      c = c / 255
      return c <= 0.03928 and c / 12.92 or ((c + 0.055) / 1.055) ^ 2.4
    end
    return 0.2126 * channel(rgb.r) + 0.7152 * channel(rgb.g) + 0.0722 * channel(rgb.b)
  end

  local l1 = relative_luminance(hex1)
  local l2 = relative_luminance(hex2)

  local lighter = math.max(l1, l2)
  local darker = math.min(l1, l2)

  return (lighter + 0.05) / (darker + 0.05)
end

-- Apply highlight group
function M.highlight(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Apply multiple highlight groups
function M.apply_highlights(highlights)
  for group, opts in pairs(highlights) do
    M.highlight(group, opts)
  end
end

return M
