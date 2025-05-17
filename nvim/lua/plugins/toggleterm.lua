-- plugins/toggleterm.lua
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      -- Open terminal with <Ctrl-\>
      open_mapping = [[<c-t>]],
      -- Terminal opens as horizontal split
      direction = "horizontal",
      -- Start in insert mode
      start_in_insert = true,
      -- Hide line numbers
      hide_numbers = true,
      -- Close terminal when shell exits
      close_on_exit = true,
      -- Use the shell from your system
      shell = vim.o.shell,
      -- Shading
      shade_terminals = true,
      shading_factor = 2,
    })

    -- Optional keymaps for custom terminals
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

    vim.keymap.set("n", "<leader>gg", function()
      lazygit:toggle()
    end, { desc = "Toggle LazyGit" })
  end,
}

