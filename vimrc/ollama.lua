-- NOTE: The ollama plugin is basically unusable at this point. I'm leaving the
-- configuration in place, in case it does end up getting better at some point
-- But I'm taking out the plugin from the configuration
local response_format = "Respond EXACTLY in this format:\n```$ftype\n<your code>\n```"
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
      },
      Suggest_Tags = {
        prompt = [[
        Create 5 relevant single word tags for the bellow content. Use # before each of the tags.  Answer only the tags, do not add introductory words of explanations. For example: #aviation #nature #school-shootings

        $sel
        ]],
        model = "mistral",
        action = "display"
      },
      Simplify_Language = {
        prompt = "Rewrite the text given to only use active voice and plain language. Aim for comprehension level 3.\n\n"
        .. response_format
        .. "\n\n```$ftype\n$sel\n```",
        model = "llama3",
        action = "display"
      }
    }
  -- }
})

vim.keymap.set('n', '<leader>oo', require('ollama').prompt)
vim.keymap.set('v', '<leader>oo', require('ollama').prompt)
