local key = tostring(os.getenv("OPENAI_API_KEY"))
require("chatgpt").setup({
    api_key_cmd = key
})

vim.keymap.set({"n", "v"}, "<leader>cc", "<cmd>ChatGPT<CR>", { noremap = true, silent = true, desc = "ChatGPT"})
vim.keymap.set({"n", "v"}, "<leader>ci", "<cmd>ChatGPTEditWithInstruction<CR>", { noremap = true, silent = true, desc = "ChatGPTEditWithInstruction" })
vim.keymap.set({"n", "v"}, "<leader>cg", "<cmd>ChatGPTRun grammar_correction<CR>", { noremap = true, silent = true, desc = "ChatGPTRun grammar_correction" })
vim.keymap.set({"n", "v"}, "<leader>ct", "<cmd>ChatGPTRun translate<CR>", { noremap = true, silent = true, desc = "ChatGPTRun Translate" })
vim.keymap.set({"n", "v"}, "<leader>ck", "<cmd>ChatGPTRun keywords<CR>", { noremap = true, silent = true, desc = "ChatGPTRun Keywords" })
vim.keymap.set({"n", "v"}, "<leader>cd", "<cmd>ChatGPTRun docstring<CR>", { noremap = true, silent = true, desc = "ChatGPTRun Docstring" })
vim.keymap.set({"n", "v"}, "<leader>ca", "<cmd>ChatGPTRun add_tests<CR>", { noremap = true, silent = true, desc = "ChatGPTRun Add Tests" })
vim.keymap.set({"n", "v"}, "<leader>co", "<cmd>ChatGPTRun optimize_code<CR>", { noremap = true, silent = true, desc = "ChatGPTRun Optimize Code" })
vim.keymap.set({"n", "v"}, "<leader>cs", "<cmd>ChatGPTRun summarize<CR>", { noremap = true, silent = true, desc = "ChatGPTRun Summarize" })
vim.keymap.set({"n", "v"}, "<leader>cf", "<cmd>ChatGPTRun fix_bugs<CR>", { noremap = true, silent = true, desc = "ChatGPTRun Fix Bugs" })
vim.keymap.set({"n", "v"}, "<leader>ce", "<cmd>ChatGPTRun explain_code<CR>", { noremap = true, silent = true, desc = "ChatGPTRun Explain Code" })
vim.keymap.set({"n", "v"}, "<leader>cR", "<cmd>ChatGPTRun roxygen_edit<CR>", { noremap = true, silent = true, desc = "ChatGPTRun Roxygen Edit" })
vim.keymap.set({"n", "v"}, "<leader>cR", "<cmd>ChatGPTRun code_readability_analysis<CR>", { noremap = true, silent = true, desc = "ChatGPTRun Code Readability" })
