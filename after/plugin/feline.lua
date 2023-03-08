local present, feline = pcall(require, "feline")

if not present then
  return
end

local theme = {
  aqua = "#7AB0DF",
  bg = "#4A3F38",
  blue = "#5FB0FC",
  cyan = "#70C0BA",
  darkred = "#FB7373",
  fg = "#C7C7CA",
  gray = "#222D26",
  green = "#99B2A3",
  lime = "#54CED6",
  orange = "#FFD064",
  pink = "#D997C8",
  purple = "#C397D8",
  red = "#F87070",
  yellow = "#FFE59E"
}

local mode_theme = {
  ["NORMAL"] = theme.green,
  ["OP"] = theme.cyan,
  ["INSERT"] = theme.aqua,
  ["VISUAL"] = theme.yellow,
  ["LINES"] = theme.darkred,
  ["BLOCK"] = theme.orange,
  ["REPLACE"] = theme.purple,
  ["V-REPLACE"] = theme.pink,
  ["ENTER"] = theme.pink,
  ["MORE"] = theme.pink,
  ["SELECT"] = theme.darkred,
  ["SHELL"] = theme.cyan,
  ["TERM"] = theme.lime,
  ["NONE"] = theme.gray,
  ["COMMAND"] = theme.blue,
}

local component = {}

component.vim_mode = {
  provider = 'vi_mode',
  hl = function()
    return {
      name = require('feline.providers.vi_mode').get_mode_highlight_name(),
      fg = require('feline.providers.vi_mode').get_mode_color(),
      style = 'bold'
    }
  end,
  left_sep = ' ',
  right_sep = ' ',
  icon = ''
}

component.git_branch = {
  provider = "git_branch",
  hl = {
    fg = "fg",
    bg = "bg",
    style = "bold",
  },
  left_sep = "block",
  right_sep = "",
}

component.git_add = {
  provider = "git_diff_added",
  hl = {
    fg = "green",
    bg = "bg",
  },
  left_sep = "",
  right_sep = "",
}

component.git_delete = {
  provider = "git_diff_removed",
  hl = {
    fg = "red",
    bg = "bg",
  },
  left_sep = "",
  right_sep = "",
}

component.git_change = {
  provider = "git_diff_changed",
  hl = {
    fg = "purple",
    bg = "bg",
  },
  left_sep = "",
  right_sep = "",
}

component.separator = {
  provider = "",
  hl = {
    fg = "bg",
    bg = "bg",
  },
}

component.diagnostic_errors = {
  provider = "diagnostic_errors",
  hl = {
    fg = "red",
  },
}

component.diagnostic_warnings = {
  provider = "diagnostic_warnings",
  hl = {
    fg = "yellow",
  },
}

component.diagnostic_hints = {
  provider = "diagnostic_hints",
  hl = {
    fg = "aqua",
  },
}

component.diagnostic_info = {
  provider = "diagnostic_info",
}

component.file_type = {
  provider = {
    name = "file_type",
    opts = {
      filetype_icon = true,
    },
  },
  hl = {
    fg = "fg",
    bg = "gray",
  },
  left_sep = "block",
  right_sep = "block",
}

component.scroll_bar = {
  provider = 'line_percentage',
  hl = function()
    local position = math.floor(vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0) * 100)
    local fg

    if position <= 5 then
      fg = "aqua"
    elseif position >= 95 then
      fg = "red"
    else
      fg = "purple"
    end

    return {
      fg = fg,
      style = "bold",
      bg = "bg",
    }
  end,
  left_sep = "block",
  right_sep = "block",
}

component.file_info = {
  provider = {
    name = 'file_info',
    opts = {
      type = 'relative',
      file_modified_icon = '✍️'
    }
  }
}

local left = {
  component.vim_mode,
  component.git_branch,
  -- component.git_add,
  -- component.git_delete,
  -- component.git_change,
}
local middle = {
  component.file_info
}
local right = {
  component.file_type,
  component.separator,
  component.diagnostic_errors,
  component.diagnostic_warnings,
  component.diagnostic_info,
  component.diagnostic_hints,
  component.scroll_bar,
}

local components = {
  active = {
    left,
    middle,
    right,
  },
}

feline.setup({
  components = components,
  theme = theme,
  vi_mode_colors = mode_theme,
})

