--[[
    R3TH PRIV LOADER SOURCE

    .gg/pethicial

    Credits:
        pethicial
]]

--------------------------------------------------------------------------------------R3THPRIV----------------------------------------------------------------------------------------
repeat wait() until game:IsLoaded()

if Key == nil then
    getgenv().Key = "R3TH PRIV"
end

local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

function sendnotification(message, type)
    if type == false or type == nil then
        print("[ " .. Key .. " ]: " .. message)
    end
    if type == true or type == nil then
        Notification:Notify(
            {Title = Key, Description = message},
            {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 7, Type = "default"}
        )
    end
end

if getgenv().r3thexecuted then sendnotification("Script already executed, if you're having any problems join discord.gg/pethicial for support.", nil) return end
getgenv().r3thexecuted = true

sendnotification("Loader executed.", false)

--------------------------------------------------------------------------------------DEFINE----------------------------------------------------------------------------------------
local UIS = game:GetService("UserInputService")
local Touchscreen = UIS.TouchEnabled
local Players = game:GetService("Players")

--------------------------------------------------------------------------------------LISTS----------------------------------------------------------------------------------------
local games = {
    [142823291] = 'Murder%20Mystery%202',
    [335132309] = 'Murder%20Mystery%202',
    [636649648] = 'Murder%20Mystery%202',
    [7863262550] = 'FOBLOX',
    [5244411056] = 'Bloxy%20Bingo',
    [8908228901] = 'SharkBite%202',
    [6847090259] = 'Bulked%20Up',
    [12151453277] = 'Abyss%20World',
    [2693739238] = 'THIEF%20LIFE%20Simulator',
    [16281300371] = 'Blade%20Ball',
    [13772394625] = 'Blade%20Ball',
    [14732610803] = 'Blade%20Ball',
    [4889315193] = 'Total%20Roblox%20Drama',
    [4939362930] = 'Total%20Roblox%20Drama',
    [4939362610] = 'Total%20Roblox%20Drama',
    [7172152072] = 'Total%20Roblox%20Drama',
    [15365802831] = 'Total%20Roblox%20Drama',
    [1962086868] = 'Tower%20of%20Hell',
    [3582763398] = 'Tower%20of%20Hell',
    [5253186791] = 'Tower%20of%20Hell',
}

local UserIds = {
    4395539224,
    4395558570,
    4383123554,
    4388471465,
    4385548043,
    4388464464,
    4388460549,
    4395547247,
    4395542413,
    4386584832,
    4385549429,
    4386587913,
    4395553797,
    4388455062,
    4388456980,
    4386593321,
    4383124873,
    4386596394,
    4386581560,
    5025025056,
    4385546463,
    4381780232,
    4381789436,
    4381783100,
    4381785992,
    4401330552,
    4401332514,
    4406464584,
    4406459346,
    4401356153,
    4401336096,
    4406479654,
    4406461330,
    4401344195,
    4406468786,
    4406466727,
    4406475738,
    4406454273,
    4401346447,
    4406477330,
    4401341231,
    4381791929,
    4383120960,
    4383116307,
    4383117488,
    5025041589,
    5025465374,
    5025046418,
    4401337786,
    4401325092,
    5025037655,
    5025459922,
    4383114532,
    4383122330,
    5025099676,
    5025367069,
    5025401829,
    5025406785,
    4422118934,
    5025252742,
    5025385732,
    5025221418,
    5025452495,
    5025185886,
    5025231054,
    5025163459,
    5025348534,
    5025329932,
    5025105289,
    5025171331,
    5025395881,
    5025196142,
    5025245476,
    5025213323,
    5025272402,
    5025028636,
    5025096436,
    5025322541,
    5025202029,
    5025209358,
    403528605,
    5025224034,
    5025102483,
    5025292258,
    5025389882,
    5025415474,
    5025085767,
    5025092149,
    5025449393,
    5025411594,
    5025241342,
    5025178293,
    5025089141,
    5025316909,
    5025340430,
    5025261429,
    5025357248,
    5025440102,
    5025374820,
    5025281125,
    5025287866,
    4406473673,
    4401327886,
}

--------------------------------------------------------------------------------------FUNCTIONS----------------------------------------------------------------------------------------
local function getGlobal(path)
	local value = getfenv(0)

	while value ~= nil and path ~= "" do
		local name, nextValue = string.match(path, "^([^.]+)%.?(.*)$")
		value = value[name]
		path = nextValue
	end

	return value
end

local function SetSupport(name, support)
    local target = (support == "Supported") and "Supported" or "Unsupported"
    
    if name == "hookfunction" then
        getgenv().R3TH_hookfunction = target
    elseif name == "getnamecallmethod" then
        getgenv().R3TH_getnamecallmethod = target
    elseif name == "Drawing.new" then
        getgenv().R3TH_Drawingnew = target
    end
end

local function test(name, aliases, callback)
	task.spawn(function()
		if not callback then
            SetSupport(name, "Supported")
			sendnotification("⏺️ " .. name, false)
		elseif not getGlobal(name) then
            SetSupport(name, "Unsupported")
			sendnotification("⛔ " .. name, false)
		else
			local success, message = pcall(callback)
	
			if success then
                SetSupport(name, "Supported")
				sendnotification("✅ " .. name .. (message and " • " .. message or ""), false)
			else
                SetSupport(name, "Unsupported")
				sendnotification("⛔ " .. name .. " failed: " .. message, false)
			end
		end
	
		local undefinedAliases = {}
	
		for _, alias in ipairs(aliases) do
			if getGlobal(alias) == false then
				table.insert(undefinedAliases, alias)
			end
		end
	
		if #undefinedAliases > 0 then
            SetSupport(name, "Unsupported")
			sendnotification("⚠️ " .. table.concat(undefinedAliases, ", "), false)
		end

	end)
end

function isInUserIdList(UserId)
    for i, v in ipairs(UserIds) do
        if UserId == v then
            return true
        end
    end
    return false
end

function AddParticles(player)
    local character = player.Character or player.CharacterAdded:Wait()
    task.wait(5)
    for i,v in pairs (character:GetChildren()) do
        if v:IsA("Part") then
            local particle = Instance.new("ParticleEmitter")
            particle.Texture = "http://www.roblox.com/asset/?id=11839269455"
            particle.Parent = v
            particle.Rate = 50
            particle.Size = NumberSequence.new(0.5)
        end
    end
end

function AddNameTag(player)
    local character = player.Character or player.CharacterAdded:Wait()
    
    local texts = {"R", "R3", "R3T", "R3TH", "R3TH ", "R3TH O", "R3TH Ow", "R3TH Own", "R3TH Owne", "R3TH Owner", "R3TH Owner 👑"}
    local textsremove = {"R3TH Owner 👑", "R3TH Owner", "R3TH Owne", "R3TH Own", "R3TH Ow", "R3TH O", "R3TH ", "R3TH", "R3T", "R3", "R", ""}
    local currentIndex = 1

    local billboard = Instance.new("BillboardGui")
    billboard.Size = UDim2.new(0, 100, 0, 25)
    billboard.Adornee = character:WaitForChild("Head")
    billboard.Parent = character.Head
    billboard.StudsOffset = Vector3.new(0, 1.5, 0)
    billboard.MaxDistance = 50

    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, 0, 1, 0)
    nameLabel.Position = UDim2.new(0, 0, 0, 0)
    nameLabel.TextScaled = true
    nameLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Font = Enum.Font.GothamSemibold
    nameLabel.TextXAlignment = Enum.TextXAlignment.Center
    nameLabel.TextYAlignment = Enum.TextYAlignment.Center
    nameLabel.TextStrokeTransparency = 0
    nameLabel.Text = texts[currentIndex]
    
    nameLabel.Parent = billboard

    local updateText = coroutine.wrap(function()
        while true do
            for i = 1, #texts do
                nameLabel.Text = texts[currentIndex]
                currentIndex = (currentIndex % #texts) + 1
                task.wait(0.2)
            end
            task.wait(5)
            for i = 1, #textsremove do
                nameLabel.Text = textsremove[currentIndex]
                currentIndex = (currentIndex % #textsremove) + 1
                task.wait(0.1)
            end
            task.wait(1)
        end
    end)

    updateText()
end

local function AddListener(player)
    if player ~= Players.LocalPlayer then
        AddParticles(player)
        AddNameTag(player)
        player.CharacterAdded:Connect(function(character)
            AddParticles(player)
            AddNameTag(player)
        end)
    end
end

local function Check(player)
    if isInUserIdList(player.UserId) then
        AddListener(player)
    end
end

--------------------------------------------------------------------------------------CONNECTIONS----------------------------------------------------------------------------------------
for i,v in pairs(Players:GetPlayers()) do
    Check(v)
end

Players.PlayerAdded:Connect(function(player)
    Check(player)
end)

--------------------------------------------------------------------------------------SUPPORT CHECK----------------------------------------------------------------------------------------
if games[game.PlaceId] ~= "Total%20Roblox%20Drama" then
    test("hookfunction", {"replaceclosure"}, function()
        local function test()
            return true
        end
        local ref = hookfunction(test, function()
            return false
        end)
        assert(test() == false, "Function should return false")
        assert(ref() == true, "Original function should return true")
        assert(test ~= ref, "Original function should not be same as the reference")
    end)
    
    test("getnamecallmethod", {}, function()
        local method
        local ref
        ref = hookmetamethod(game, "__namecall", function(...)
            if not method then
                method = getnamecallmethod()
            end
            return ref(...)
        end)
        game:GetService("Lighting")
        assert(method == "GetService", "Did not get the correct method (GetService)")
    end)
end

test("Drawing.new", {}, function()
	local drawing = Drawing.new("Square")
	drawing.Visible = false
	local canDestroy = pcall(function()
		drawing:Destroy()
	end)
	assert(canDestroy, "Drawing:Destroy() should not throw an error")
end)

--------------------------------------------------------------------------------------LOADER----------------------------------------------------------------------------------------
getgenv().R3TH_Device = Touchscreen and "Mobile" or "PC"
sendnotification(R3TH_Device .. " detected.", false)

sendnotification("Script loading, this may take a while depending on your device.", nil)

if games[game.PlaceId] then
    sendnotification("Game Supported!", false)
    loadstring(game:HttpGet('https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV-old/main/Games/' .. games[game.PlaceId] .. '.lua'))()
else
    sendnotification("Game not Supported.", false)
    loadstring(game:HttpGet('https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV-old/main/Games/Universal.lua'))()
end
