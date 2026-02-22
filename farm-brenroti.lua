-- Lua script for sending commands to Infinity and Divine locations

local function teleportTo(location)
    -- Code for teleporting to the specified location
    print("Teleporting to " .. location)
end

local function collectMoney(options)
    -- Code for collecting money based on configurable options
    print("Collecting money with options:", options)
end

local function showMenu()
    -- Code for displaying the menu to the user
    print("Menu: 1. Teleport to Infinity  2. Teleport to Divine  3. Collect Money")
end

-- Main execution block
showMenu()

-- Example of how to call the functions
teleportTo("Infinity")
collectMoney({autoCollect = true, amount = 1000})
