return {
  {
    "junegunn/fzf",
    build = "./install --all",
  },
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" },
    config = function()
      -- Optional keymap (you can change <leader>f to anything you like)
      vim.api.nvim_set_keymap("n", "<leader>f", ":Files<CR>", { noremap = true, silent = true })
    end,
  },
}