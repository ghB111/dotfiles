local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)

local lspconfig = require('lspconfig')
lspconfig.clangd.setup{
  cmd = { "clangd", "-style=file:./third_party/depot_tools/clang-format" }
}

require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true }
})

require("dapui").setup()

-- TODO get from env
require("dap").adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = '/Users/rbrek/.vscode/extensions/ms-vscode.cpptools-1.19.9-darwin-arm64/debugAdapters/bin/OpenDebugAD7',
}

-- Setup language servers.

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<C-b>', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>de', function() require("dapui").toggle() end, opts)
    vim.keymap.set('n', '<space>b', function() require("dap").toggle_breakpoint() end, opts)
    vim.keymap.set('n', '<space>B', function() require("dap").list_breakpoints() end, opts)
    vim.keymap.set('n', '<space>R', function() require("dap").run_to_cursor() end, opts)
    vim.keymap.set('n', '<space>K', function() require("dap").up() end, opts)
    vim.keymap.set('n', '<space>J', function() require("dap").down() end, opts)
    vim.keymap.set('n', '<space>z', function() require("dap").focus_frame() end, opts)
    vim.keymap.set('n', '<space>c', function() require("dap").continue() end, opts)
    vim.keymap.set('n', '<space>n', function() require("dap").step_over() end, opts)
    vim.keymap.set('n', '<space>N', function() require("dap").step_into() end, opts)
    vim.keymap.set('n', '<space>re', function() require("dap").repl.open() end, opts)

    require("dap.ext.vscode").load_launchjs("/Users/rbrek/bin/data/launch.json", { cppdbg = {'c', 'cpp'} })
    -- vim.keymap.set('n', '<space>L', function() require('dap').configurations.cpp = 

    vim.keymap.set('v', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
-- local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
local servers = { 'clangd' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
    -- cmd = { "clangd", "-style=file:./third_party/depot_tools/clang-format" }
    cmd = { "clangd" , "--background-index" } -- , "--background-index-priority=normal" }
  }
end

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<C-j>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<C-k>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

local oil = require("oil")
oil.setup()
-- local opts = { buffer = ev.buf }
vim.keymap.set('n', '<space>Q', function() oil.open() end)


local lspconfig = require'lspconfig'

-- local on_attach = function(client)
--     require'completion'.on_attach(client)
-- end

lspconfig.rust_analyzer.setup({
    -- on_attach = on_attach,
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        vim.lsp.inlay_hint.enable(bufnr, true)
    end,
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    }
})
