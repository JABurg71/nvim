-- Move these to the very top as they're needed immediately
vim.g.loaded_python3_provider = 0  -- Disable Python provider by default
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local function get_python_path()
    -- Use pyenv command to get the path
    local handle = io.popen('pyenv which python')
    local result = handle:read("*a")
    handle:close()
    return result:gsub("[\n\r]", "")
end

-- Defer Python path detection until after startup
vim.defer_fn(function()
    local function get_pyenv_python_path()
        -- Get PYENV_ROOT from environment variable or use default path
        local pyenv_root = os.getenv("PYENV_ROOT") or os.getenv("HOME") .. "/.pyenv"
        
        -- Get the active Python version using pyenv command
        local handle = io.popen('pyenv version-name')
        local version = handle:read("*a")
        handle:close()
        
        -- Clean up the version string (remove newlines)
        version = version:gsub("[\n\r]", "")
        
        -- Construct the full path to python
        local python_path = pyenv_root .. "/versions/" .. version .. "/bin/python"
        
        -- Check if the file exists
        local f = io.open(python_path, "r")
        if f then
            f:close()
            vim.g.python3_host_prog = python_path
            -- vim.notify("Found python at " .. python_path, vim.log.levels.INFO)
            return true
        end
        return false
    end

    -- Only enable Python provider if we find a valid Python installation
    if get_pyenv_python_path() then
        vim.g.loaded_python3_provider = nil  -- Re-enable Python provider
    else
        vim.notify("Could not find pyenv Python installation", vim.log.levels.WARN)
    end
end, 0)

-- Load core configurations
require("lazy_install")

-- Use protected calls for modules that might error
local function safe_require(module)
    local ok, err = pcall(require, module)
    if not ok then
        vim.notify("Error loading " .. module .. "\n" .. err, vim.log.levels.ERROR)
    end
end

-- Load these in order of importance
safe_require("lazy_plugins")
safe_require("sets")
safe_require("remaps")

