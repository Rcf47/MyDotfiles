local wk = require("which-key")

wk.register({
      ["<leader>t"] = { name = "+Telescope" },
      ["<leader>tb"] = { "<cmd>Telescope buffers<cr>", "Telescope buffers " },
      ["<leader>td"] = { "<cmd>Telescope diagnostics<cr>", "Telescope diagnostics" },
      ["<leader>tk"] = { "<cmd>Telescope keymaps<cr>", "Telescope keymaps" },
      ["<leader>g"] = { name = "+Fugitive git" },
      ["<leader>h"] = { name = "+Gitsigns" },
      ["s"] = { name = "+Split window" },
})
