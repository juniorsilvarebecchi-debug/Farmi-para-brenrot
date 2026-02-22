-- Farm Brenroti GUI Interface

local gui = Instance.new('ScreenGui')
gui.Parent = game.CoreGui

local statusLabel = Instance.new('TextLabel')
statusLabel.Parent = gui
statusLabel.Text = 'Status: Ready'
statusLabel.Size = UDim2.new(0, 200, 0, 50)
statusLabel.Position = UDim2.new(0.5, -100, 0, 0)

local moneyLabel = Instance.new('TextLabel')
moneyLabel.Parent = gui
moneyLabel.Text = 'Money Collected: $0'
moneyLabel.Size = UDim2.new(0, 200, 0, 50)
moneyLabel.Position = UDim2.new(0.5, -100, 0, 60)

local locationButton = Instance.new('TextButton')
locationButton.Parent = gui
locationButton.Text = 'Select Location'
locationButton.Size = UDim2.new(0, 200, 0, 50)
locationButton.Position = UDim2.new(0.5, -100, 0, 120)

local controlButton = Instance.new('TextButton')
controlButton.Parent = gui
controlButton.Text = 'Start Collection'
controlButton.Size = UDim2.new(0, 200, 0, 50)
controlButton.Position = UDim2.new(0.5, -100, 0, 180)

controlButton.MouseButton1Click:Connect(function()
    statusLabel.Text = 'Status: Collecting'
    -- Add collection logic here
end)

-- Update money collected dynamically
function updateMoney(amount)
    local currentMoney = tonumber(moneyLabel.Text:match('%$(%d+)'))
    moneyLabel.Text = 'Money Collected: $' .. (currentMoney + amount)
end
