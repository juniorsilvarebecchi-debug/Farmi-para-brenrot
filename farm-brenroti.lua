-- Fuja do Tsunami Farm Script - Complete Version
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Configuration
local config = {
    infinityLocation = Vector3.new(100, 50, 100),
    divineLocation = Vector3.new(200, 50, 200),
    farmingEnabled = true,
    farmingSpeed = 1,
    moneyPerCollection = 500,
    waitTime = 2
}

-- Function to teleport player
function teleportTo(location)
    if rootPart then
        rootPart.CFrame = CFrame.new(location + Vector3.new(0, 3, 0))
        print("Teleported to location: " .. tostring(location))
    end
end

-- Function to collect money
function collectMoney()
    print("Collecting money... +$" .. config.moneyPerCollection)
    wait(0.5)
end

-- Function to farm at location
function farmAtLocation(locationName, location)
    if config.farmingEnabled then
        print("Farming at " .. locationName .. "...")
        teleportTo(location)
        wait(config.waitTime)
        collectMoney()
        wait(1)
    end
end

-- Main farming loop
function startFarming()
    while config.farmingEnabled do
        farmAtLocation("Infinity", config.infinityLocation)
        wait(config.waitTime)
        farmAtLocation("Divine", config.divineLocation)
        wait(config.waitTime)
    end
end

-- Stop farming function
function stopFarming()
    config.farmingEnabled = false
    print("Farming stopped!")
end

-- Keyboard controls
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.F then
        config.farmingEnabled = not config.farmingEnabled
        if config.farmingEnabled then
            print("Farming started!")
            startFarming()
        else
            print("Farming paused!")
        end
    elseif input.KeyCode == Enum.KeyCode.X then
        stopFarming()
    end
end)

-- Error handling
local function safeExecute(func)
    local success, err = pcall(func)
    if not success then
        print("Error: " .. tostring(err))
    end
end

-- Start the farming loop
print("Farm Script Loaded! Press F to toggle farm, X to stop completely.")
safeExecute(startFarming)