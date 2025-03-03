vim.api.nvim_create_user_command("EnableCopilot", function()
  -- The copilot is a basic vim plugin, there is no lua packages involved,
  -- can't do similar validation

  -- Load the plugin
  vim.cmd [[packadd copilot.vim]]

end, {})
