return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Neotest 的依赖
      "nvim-treesitter/nvim-treesitter", -- 测试文件语法解析
      "nvim-neotest/neotest-python", -- Python 测试适配器
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({
            dap = { justMyCode = false },
            args = { "--maxfail=1", "--tb=short" }, -- 默认 pytest 参数
          }),
        },
      })
    end,
  },
}
