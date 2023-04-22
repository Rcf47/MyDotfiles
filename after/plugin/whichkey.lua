local wk = require("which-key")

wk.register({
  ["<leader>t"] = { name = "Telescope" },
  ["<leader>g"] = { name = "Fugitive git" },
  ["<leader>h"] = { name = "Gitsigns" },
  ["s"] = { name = "Split window" },
  ["<leader><leader>"] = { name = "Highlight color" },
  ["<leader>l"] = { name = "Lazygit" },
  ["<leader>d"] = { name = "Diffview" },
  ["<leader>e"] = { name = "Numeric line" },
  ["<leader>j"] = { name = "Jest" },
  ["<leader>m"] = { name = "Harpoon" },
  ["<leader>n"] = { name = "NvimTree" },
})
