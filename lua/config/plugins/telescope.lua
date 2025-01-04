return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
      }
    },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set("n", "<C-P>", builtin.find_files)
      vim.keymap.set("n", "<leader>p", builtin.find_files)
      vim.keymap.set("n", "<leader>en", function()
        builtin.find_files { cwd = vim.fn.stdpath("config") }
      end)
      vim.keymap.set("n", "<C-p>", builtin.git_files, {})
      vim.keymap.set("n", "<leader>f", function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") });
      end)
    end
  }
}
