vim.api.nvim_create_user_command("PrintLuaPaths", function()
  for path in string.gmatch(package.path, "[^;]+") do
    print(path)
  end
end, {})

vim.api.nvim_create_user_command("PrintRuntimePaths", function()
  for _, k in ipairs(vim.api.nvim_list_runtime_paths()) do
    print(k)
  end
end, {})

