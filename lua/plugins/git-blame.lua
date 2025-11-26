return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true, -- 开启当前行 blame
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 200, -- 延迟显示(ms)，避免频繁刷新
        ignore_whitespace = false,
        virt_text_priority = 100,
      },
      -- current_line_blame_formatter = "<author>, <author_time:%R> • <summary>",
      -- 自定义格式化（更详细版本）：
      current_line_blame_formatter = "  <author> • <author_time:%R> (<author_time:%Y-%m-%d>) • <summary>",
    },
    keys = {
      -- 添加快捷键切换 blame 显示
      { "<leader>gt", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle Line Blame" },
    },
  },
}
