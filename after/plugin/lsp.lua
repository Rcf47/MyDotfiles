local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'eslint',
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Space>'] = cmp.mapping.complete(),
})

lsp.set_preferences({
  sign_icons = {}
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})


local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local enable_format_on_save = function(_, bufnr)
  vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup_format,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({ bufnr = bufnr })
    end,
  })
end

lsp.on_attach(function(client, bufnr)
  local optsFunc = function(description) return { desc = description, buffer = bufnr, remap = false } end
  enable_format_on_save(client, bufnr)
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, optsFunc('Go definition'))
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, optsFunc('Hover code'))
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, optsFunc('Workspace Symbol'))
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, optsFunc('Diagnostic'))
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, optsFunc('Go to next'))
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, optsFunc('Go to prev'))
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, optsFunc('Code action'))
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, optsFunc('References'))
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, optsFunc('Rename'))
  vim.keymap.set("i", "<C-i>", function() vim.lsp.buf.signature_help() end, optsFunc('Signature help'))
  vim.keymap.set("n", "<F3kk>", function() vim.lsp.buf.format() end, optsFunc('Format'))
end)

vim.diagnostic.config({
  virtual_text = true,
  globals = { "vim" }
})
lsp.setup()
