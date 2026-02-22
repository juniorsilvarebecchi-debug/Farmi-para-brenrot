-- game configuration
local config = {
	infinity_location = { x = 1000, y = 2000 },
	divine_location = { x = 3000, y = 4000 },
	money_collection_amount = 100,
	menu_options = {"Teleport to Infinity", "Teleport to Divine", "Collect Money"}
}

-- teleport function
local function teleport(location)
	print("Teleporting to " .. location.x .. ", " .. location.y)
	-- Implementation of teleportation logic would go here
end

-- money collection function
local function collect_money()
	print("Collecting money...")
	-- Implementation of money collection logic would go here
	local amount_collected = config.money_collection_amount
	print("Collected money amount: " .. amount_collected)
end

-- interactive menu function
local function show_menu()
	print("Select an option:")
	for index, option in ipairs(config.menu_options) do
		print(index .. ": " .. option)
	end

	local choice = io.read()
	if choice == "1" then
		teleport(config.infinity_location)
	elseif choice == "2" then
		teleport(config.divine_location)
	elseif choice == "3" then
		collect_money()
	else
		print("Invalid option, please try again.")
	end
end

-- main execution
show_menu()