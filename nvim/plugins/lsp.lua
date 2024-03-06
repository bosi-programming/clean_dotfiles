local wk = require("which-key")
local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(event)
    local buffer = event.buf

    wk.register({
      name = ' LSP',
      d = { function() vim.lsp.buf.definition() end, 'Go to definition' },
    }, { prefix = "g", buffer = buffer})

    wk.register({
      name = ' LSP',
      lh = { function() vim.lsp.buf.hover() end, 'Show hover' },
      ld = { function() vim.diagnostic.open_float() end, 'Open diagnostics window' },
      a = { function() vim.lsp.buf.code_action() end, 'Show code actions' },
      lr = { function() vim.lsp.buf.references() end, 'Show references' },
      r = { function() vim.lsp.buf.rename() end, 'Rename' },
      f = { function() vim.lsp.buf.format { async = true } end, 'Format' },
    }, { prefix = "<leader>", buffer = buffer})

    wk.register({
      name = ' LSP',
      ["<right>"] = { function() vim.diagnostic.goto_next() end, 'which_key_ignore' },
      ["<left>"] = { function() vim.diagnostic.goto_prev() end, 'which_key_ignore' },
    }, { buffer = buffer})
  end
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.vue", "*.svelte" },
  callback = function()
    vim.lsp.buf.format()
  end
})

local default_setup = function(server)
  lspconfig[server].setup({
    capabilities = lsp_capabilities,
  })
end

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = { default_setup },
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['yy'] = cmp.mapping.confirm({ select = true }),
    ['<C-space>'] = cmp.mapping.complete(),
    ['<CR>'] = nil,
    ['<Tab>'] = nil,
    ['<S-Tab>'] = nil,
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})

lspconfig.eslint.setup({
  capabilities = lsp_capabilities,
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = true
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
  end,
  settings = {
    codeAction = {
      disableRuleComment = {
        enable = true,
        location = "separateLine"
      },
      showDocumentation = {
        enable = true
      }
    },
    codeActionOnSave = {
      enable = true,
      mode = "all"
    },
    format = true,
    nodePath = "",
    onIgnoredFiles = "off",
    packageManager = "npm",
    quiet = false,
    rulesCustomizations = {},
    run = "onType",
    useESLintClass = false,
    validate = "on",
    workingDirectory = {
      mode = "location"
    }
  }
})

local tailwindcss_capabilities = require("cmp_nvim_lsp").default_capabilities()

tailwindcss_capabilities.textDocument.completion.completionItem.snippetSupport = true
tailwindcss_capabilities.textDocument.colorProvider = { dynamicRegistration = false }
tailwindcss_capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

lspconfig.tailwindcss.setup({
  capabilities = tailwindcss_capabilities,
  filetypes = { "html", "mdx", "javascript", "javascriptreact", "typescriptreact", "vue", "svelte" },
  settings = {
    tailwindCSS = {
      lint = {
        cssConflict = "warning",
        invalidApply = "error",
        invalidConfigPath = "error",
        invalidScreen = "error",
        invalidTailwindDirective = "error",
        invalidVariant = "error",
        recommendedVariantOrder = "warning",
      },
      experimental = {
        classRegex = {
          "tw`([^`]*)",
          'tw="([^"]*)',
          'tw={"([^"}]*)',
          "tw\\.\\w+`([^`]*)",
          "tw\\(.*?\\)`([^`]*)",
          { "clsx\\(([^)]*)\\)",       "(?:'|\"|`)([^']*)(?:'|\"|`)" },
          { "classnames\\(([^)]*)\\)", "'([^']*)'" },
          { "cva\\(([^)]*)\\)",        "[\"'`]([^\"'`]*).*?[\"'`]" },
          { "cn\\(([^)]*)\\)",         "(?:'|\"|`)([^']*)(?:'|\"|`)" },
        },
      },
      validate = true,
    },
  },
})

vim.diagnostic.config({
  virtual_text = true
})
