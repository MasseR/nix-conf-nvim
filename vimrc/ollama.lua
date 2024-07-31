require("ollama").setup({
  -- opts = {
    prompts = {
      Sample_Prompt = {
        prompt = "This is a sample prompt that receives $input and $sel(ection), among others.",
        input_label = "> ",
        model = "mistral",
        action = "display",
      }
    }
  -- }
})

vim.keymap.set('n', '<leader>oo', require('ollama').prompt)
vim.keymap.set('v', '<leader>oo', require('ollama').prompt)
