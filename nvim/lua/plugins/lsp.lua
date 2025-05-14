-- plugins/lsp.lua

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "nvim-telescope/telescope.nvim", 
  },
  opts = function()
    ---@class PluginLspOpts
    local ret = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = "󰠠 ",
            [vim.diagnostic.severity.INFO] = " ",
          },
        },
      },
      inlay_hints = {
        enabled = true,
        exclude = { "vue" },
      },
      codelens = {
        enabled = false,
      },
      capabilities = {
        workspace = {
          fileOperations = {
            didRename = true,
            willRename = true,
          },
        },
      },
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
      servers = {
        lua_ls = {},
        gopls = {
          settings = {
            gopls = {
              buildFlags = { "-tags=integration" },
            },
          },
        },
      },
      setup = {},
    }
    return ret
  end,
  config = function(_, opts)
    -- Setup autoformat
    local format_group = vim.api.nvim_create_augroup("GoLSPFormat", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = format_group,
      pattern = "*.go",
      callback = function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
      end,
    })

    -- Attach LSP keymaps with Telescope integration
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("go-lsp-attach", { clear = true }),
      callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.name == "gopls" then
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP (Go): " .. desc })
          end

          local telescope_builtin = require("telescope.builtin")
          map("gd", telescope_builtin.lsp_definitions, "Go To Definition")
          map("gr", telescope_builtin.lsp_references, "Go To References")
          map("gt", telescope_builtin.lsp_type_definitions, "Go To Type Definition")
          map("gi", telescope_builtin.lsp_implementations, "Go To Implementation")
          map("K", vim.lsp.buf.hover, "Show Documentation")
          map("<leader>la", vim.lsp.buf.code_action, "Code Action")
          map("<leader>lf", vim.lsp.buf.format, "Format Code")
          map("<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
          map("<leader>ws", telescope_builtin.lsp_workspace_symbols, "Workspace Symbols")
          map("<leader>ds", telescope_builtin.lsp_document_symbols, "Document Symbols")
        end
      end,
    })

    -- Standard nvim-lspconfig setup
    local lspconfig = require("lspconfig")
    for server, config in pairs(opts.servers) do
      lspconfig[server].setup(vim.tbl_deep_extend("force", {
        capabilities = vim.lsp.protocol.make_client_capabilities(),
      }, config))
    end
  end,
}
