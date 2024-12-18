return {
  "nvim-telescope/telescope.nvim",
  keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
  },
  -- change some options

  opts = {
    defaults = {
      theme = "dropdown",
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0,
      mappings = {
        i = {
          ["<C-n>"] = require("telescope.actions").cycle_history_next,
          ["<C-p>"] = require("telescope.actions").cycle_history_prev,

          ["<C-j>"] = require("telescope.actions").move_selection_next,
          ["<C-k>"] = require("telescope.actions").move_selection_previous,

          ["<C-b>"] = require("telescope.actions").results_scrolling_up,
          ["<C-f>"] = require("telescope.actions").results_scrolling_down,

          ["<C-c>"] = require("telescope.actions").close,

          ["<Down>"] = require("telescope.actions").move_selection_next,
          ["<Up>"] = require("telescope.actions").move_selection_previous,

          ["<CR>"] = require("telescope.actions").select_default,
          ["<C-s>"] = require("telescope.actions").select_horizontal,
          ["<C-v>"] = require("telescope.actions").select_vertical,
          ["<C-t>"] = require("telescope.actions").select_tab,

          ["<c-d>"] = require("telescope.actions").delete_buffer,

          -- ["<C-u>"] = require("telescope.actions").preview_scrolling_up,
          -- ["<C-d>"] = require("telescope.actions").preview_scrolling_down,

          -- ["<Tab>"] = require("telescope.actions").toggle_selection + require("telescope.actions").move_selection_worse,
          ["<Tab>"] = require("telescope.actions").close,
          ["<S-Tab>"] = require("telescope.actions").close,
          -- ["<S-Tab>"] = require("telescope.actions").toggle_selection + require("telescope.actions").move_selection_better,
          ["<C-q>"] = require("telescope.actions").send_to_qflist + require("telescope.actions").open_qflist,
          ["<M-q>"] = require("telescope.actions").send_selected_to_qflist + require("telescope.actions").open_qflist,
          ["<C-l>"] = require("telescope.actions").complete_tag,
          ["<C-h>"] = require("telescope.actions").which_key, -- keys from pressing <C-h>
          ["<esc>"] = require("telescope.actions").close,
        },
        -- for normal mode
        n = {
          ["<esc>"] = require("telescope.actions").close,
          ["<CR>"] = require("telescope.actions").select_default,
          ["<C-x>"] = require("telescope.actions").select_horizontal,
          ["<C-v>"] = require("telescope.actions").select_vertical,
          ["<C-t>"] = require("telescope.actions").select_tab,
          ["<C-b>"] = require("telescope.actions").results_scrolling_up,
          ["<C-f>"] = require("telescope.actions").results_scrolling_down,

          ["<Tab>"] = require("telescope.actions").close,
          ["<S-Tab>"] = require("telescope.actions").close,
          -- ["<Tab>"] = require("telescope.actions").toggle_selection + require("telescope.actions").move_selection_worse,
          -- ["<S-Tab>"] = require("telescope.actions").toggle_selection + require("telescope.actions").move_selection_better,
          ["<C-q>"] = require("telescope.actions").send_to_qflist + require("telescope.actions").open_qflist,
          ["<M-q>"] = require("telescope.actions").send_selected_to_qflist + require("telescope.actions").open_qflist,

          ["j"] = require("telescope.actions").move_selection_next,
          ["k"] = require("telescope.actions").move_selection_previous,
          ["H"] = require("telescope.actions").move_to_top,
          ["M"] = require("telescope.actions").move_to_middle,
          ["L"] = require("telescope.actions").move_to_bottom,
          ["q"] = require("telescope.actions").close,
          ["dd"] = require("telescope.actions").delete_buffer,
          ["s"] = require("telescope.actions").select_horizontal,
          ["v"] = require("telescope.actions").select_vertical,
          ["t"] = require("telescope.actions").select_tab,

          ["<Down>"] = require("telescope.actions").move_selection_next,
          ["<Up>"] = require("telescope.actions").move_selection_previous,
          ["gg"] = require("telescope.actions").move_to_top,
          ["G"] = require("telescope.actions").move_to_bottom,

          ["<C-u>"] = require("telescope.actions").preview_scrolling_up,
          ["<C-d>"] = require("telescope.actions").preview_scrolling_down,

          ["<PageUp>"] = require("telescope.actions").results_scrolling_up,
          ["<PageDown>"] = require("telescope.actions").results_scrolling_down,

          ["?"] = require("telescope.actions").which_key,
        },
      },
    },
  },
}
