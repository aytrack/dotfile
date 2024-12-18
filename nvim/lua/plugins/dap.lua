return {
  {
    "mfussenegger/nvim-dap", -- 主插件
    dependencies = {
      "mfussenegger/nvim-dap-python", -- Python 支持
      "rcarriga/nvim-dap-ui", -- DAP UI，提供界面支持（可选）
    },
    config = function()
      -- 加载 DAP UI（如果安装了 rcarriga/nvim-dap-ui）
      local dap = require("dap")
      local dap_python = require("dap-python")

      -- 获取当前的虚拟环境路径
      local function get_virtualenv_python()
        local venv = os.getenv("VIRTUAL_ENV") -- 当前激活的虚拟环境
        if venv then
          return venv .. "/bin/python" -- 返回虚拟环境的 Python 路径
        end

        -- 如果没有激活虚拟环境，尝试查找 WORKON_HOME 下的默认虚拟环境
        local workon_home = os.getenv("WORKON_HOME") or "~/Envs" -- 默认路径为 ~/Envs
        local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t") -- 当前目录名作为虚拟环境名
        local potential_venv = workon_home .. "/" .. project_name .. "/bin/python"

        if vim.fn.executable(potential_venv) == 1 then
          return potential_venv
        end

        -- 如果找不到虚拟环境，回退到系统 Python
        return "python"
      end

      -- 配置 dap-python
      local python_path = get_virtualenv_python()
      dap_python.setup(python_path)

      -- 配置调试适配器
      dap.adapters.python = {
        type = "executable",
        command = python_path,
        args = { "-m", "debugpy.adapter" },
      }

      -- 配置 Python 调试
      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Launch file",
          program = "${file}", -- 当前文件
          pythonPath = get_virtualenv_python, -- 动态获取 Python 路径
        },
      }
      require("dapui").setup()

      -- 绑定 DAP 的快捷键
      -- vim.keymap.set("n", "<leader>db", ":DapToggleBreakpoint<CR>", { desc = "Toggle breakpoint" })
      -- vim.keymap.set("n", "<leader>dc", ":DapContinue<CR>", { desc = "Start/Continue Debugging" })
      -- vim.keymap.set("n", "<leader>do", ":DapStepOver<CR>", { desc = "Step Over" })
      -- vim.keymap.set("n", "<leader>di", ":DapStepInto<CR>", { desc = "Step Into" })
      -- vim.keymap.set("n", "<leader>dr", ":DapReplToggle<CR>", { desc = "Toggle REPL" })
      -- vim.keymap.set("n", "<leader>du", function() require("dapui").toggle() end, { desc = "Toggle DAP UI" })
    end,
  },
}
