return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tvm_ffi_navigator = {
          cmd = {
            vim.fn.stdpath("data") .. "/mason/packages/tvm_ffi_navigator/venv/bin/python",
            "-m",
            "ffi_navigator.langserver",
          },
        },
      },
    },
  },

  -- 绕过 LazyVim/mason-lspconfig 的启动时序问题
  -- 在 BufReadPost 时扫描所有已注册的 LSP config，匹配 filetype + root_markers 后显式 enable
  {
    "neovim/nvim-lspconfig",
    init = function()
      local group = vim.api.nvim_create_augroup("UserLspAutostart", { clear = true })
      vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
        group = group,
        callback = function(args)
          local ft = vim.bo[args.buf].filetype
          if ft == "" then
            return
          end
          vim.schedule(function()
            if not vim.api.nvim_buf_is_valid(args.buf) then
              return
            end
            for name, _ in pairs(vim.lsp.config._configs) do
              if name ~= "*" then
                local filetypes = vim.lsp.config[name].filetypes
                if filetypes and vim.tbl_contains(filetypes, ft) then
                  local root_markers = vim.lsp.config[name].root_markers
                  if not root_markers or vim.fs.root(args.buf, root_markers) then
                    pcall(vim.lsp.enable, name)
                  end
                end
              end
            end
          end)
        end,
      })
    end,
  },
}