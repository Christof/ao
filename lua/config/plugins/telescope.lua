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
      local is_inside_work_tree = {}

      local project_files = function()
        local opts = {} -- define here if you want to define something

        local cwd = vim.fn.getcwd()
        if is_inside_work_tree[cwd] == nil then
          vim.fn.system("git rev-parse --is-inside-work-tree")
          is_inside_work_tree[cwd] = vim.v.shell_error == 0
        end

        if is_inside_work_tree[cwd] then
          builtin.git_files(opts)
        else
          builtin.find_files(opts)
        end
      end

      vim.keymap.set("n", "<C-P>", project_files)
      vim.keymap.set("n", "<leader>p", builtin.find_files)
      vim.keymap.set("n", "<leader>en", function()
        builtin.find_files { cwd = vim.fn.stdpath("config") }
      end)
      vim.keymap.set("n", "<leader>f", function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") });
      end)
    end
  }
}
