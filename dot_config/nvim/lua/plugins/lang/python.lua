return {
  {
    "linux-cultist/venv-selector.nvim",
    lazy = false,
    ft = "python",

    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
    },

    keys = {
      { "<leader>lps", "<cmd>VenvSelect<cr>" },
    },

    opts = {
      options = {
        on_venv_activate_callback = function()
          local function run_shell_command()
            local venvs = require "venv-selector"

            local plenary = require "plenary"
            -- local path = plenary.path:joinpath(venvs.venv(), "/bin/activate.fish")
            local command = "source " .. venvs.venv() .. "/bin/activate"
            vim.api.nvim_feedkeys(command .. "\n", "n", false)
          end

          vim.api.nvim_create_augroup("TerminalCommands", { clear = true })

          -- Temporary stuff, look into using the nvim rpc api
          vim.api.nvim_create_autocmd("TermOpen", {
            group = "TerminalCommands",
            pattern = "*",
            callback = run_shell_command,
          })
        end,
      },
    },
  },
}
