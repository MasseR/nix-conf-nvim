vim.api.nvim_create_user_command("EnableWindsurf", function()
  if package.loaded["windsurf"] then
    print("Windsurf is already loaded")
    return
  end

  -- Load the plugin
  vim.cmd [[packadd windsurf.nvim]]

  -- Validate loading
  local status_ok, _ = pcall(require, "codeium")
  if not status_ok then
    print("Error loading windsurf")
    return
  end


  require("codeium").setup({
    tools = {
      -- From the nix-env.lua
      language_server = paths.codeium
    }
  })
end, {})

vim.api.nvim_create_user_command("EnableCopilot", function()
  -- The copilot is a basic vim plugin, there is no lua packages involved,
  -- can't do similar validation

  -- Load the plugin
  vim.cmd [[packadd copilot.vim]]

end, {})
