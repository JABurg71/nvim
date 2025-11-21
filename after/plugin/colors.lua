-- Create the function in a local scope
local function setup_colors()
    local function set_transparent_bg()
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end

    -- Use vim.schedule to defer the heavy operations
    vim.schedule(function()
        -- Load rose-pine
        require("lazy").load({ plugins = { "rose-pine" } })
        
        -- Setup rose-pine with a pcall to handle potential errors
        local setup_ok, rose_pine = pcall(require, "rose-pine")
        if setup_ok then
            rose_pine.setup({
                transparent_background = true,
            })
            
            -- Set the colorscheme
            local status_ok = pcall(vim.cmd.colorscheme, "rose-pine")
            if status_ok then
                -- Set transparent background after a brief delay
                vim.defer_fn(set_transparent_bg, 10)
            end
        end
    end)
end

-- Create the autocmd
vim.api.nvim_create_autocmd("UIEnter", {
    callback = setup_colors,
    once = true,
    desc = "Setup colorscheme after UI loads"
})

