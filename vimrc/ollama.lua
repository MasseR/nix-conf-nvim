require("ollama").setup({
  -- opts = {
    prompts = {
      Sample_Prompt = {
        prompt = "This is a sample prompt that receives $input and $sel(ection), among others.",
        input_label = "> ",
        model = "mistral",
        action = "display",
      },
      Generate_Title = {
        prompt = [[
        Please generate a concise, informative title for the following text. The title should:
        - Be short, preferably under 10 words
        - Capture the main idea or key information from the text
        - Be suitable for a simple Zettelkasten-style permanent note
        - Avoid clickbait or sensationalism
        - Use clear and straightforward language

        Example Titles:
        - Anthropic cookbook for Wikipedia
        - Acid-state is an embedded database for Haskell
        - Agent communicating with a backend
        - Aroma and taste are strongly linked
        - Clarify your tasks
        - Consumer and producer are coupled

        $sel
        ]],
        model = "llama3",
        action = "display",
      }
    }
  -- }
})

vim.keymap.set('n', '<leader>oo', require('ollama').prompt)
vim.keymap.set('v', '<leader>oo', require('ollama').prompt)
