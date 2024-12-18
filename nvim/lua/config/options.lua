-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local vimopt = vim.opt
vimopt.shiftwidth = 4
vimopt.tabstop = 4
vimopt.softtabstop = 4
vimopt.expandtab = true
vimopt.wrap = true
vimopt.clipboard = ""
vimopt.laststatus = 3


local dap = require("dap")
dap.adapters.python = {
  type = "executable",
  command = "~/.virtualenvs/workload/bin/python", -- 替
  args = { "-m", "debugpy.adapter" },
}

dap.set_log_level("DEBUG")

dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    pythonPath = function()
      return "~/.virtualenvs/workload/bin/python" -- 替换为你的 Python 解释器路径
    end,
  },
}

