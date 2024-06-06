--[[
    R3TH PRIV HARBOR HAVOC SOURCE

    It should be noted that this script is rather messy and not recommended for learning off because it is many months old and my first script hub ever.
    V2 is being developed, and now that I've had six months of experience with lua, I can create a much better script hub.
    .gg/pethicial

    Credits:
        pethicial
]]

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "R3TH PRIV | .gg/pethicial";
    Text = "I'm very sorry but this script will be down for a day or two.";
    Duration = 60;
})
wait(9999999999999)

--------------------------------------------------------------------------------------R3THPRIV----------------------------------------------------------------------------------------
repeat wait() until game:IsLoaded()

print("[ R3TH PRIV ]: R3TH PRIV HARBOR HAVOC LOADING...")

--------------------------------------------------------------------------------------THEME----------------------------------------------------------------------------------------
privateProperties = {
	Color = Color3.fromRGB(138,43,226); 
	Font = Enum.Font.SourceSansBold;
	TextSize = 18;
}

--------------------------------------------------------------------------------------DEFINE----------------------------------------------------------------------------------------
local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/OtherScripts/VenyxUI.lua"))()
local R3TH = library.new("R3TH PRIV                                                                                .gg/pethicial", 5013109572)

local Universal = R3TH:addPage("Universal", 5012540623)
local Player = Universal:addSection("Player")
local ESP = Universal:addSection("ESP")
local Fling = Universal:addSection("Fling")
local Game = Universal:addSection("Game")
local Teleports0 = R3TH:addPage("Teleports", 5012543481)
local Flags = Teleports0:addSection("Flags")
local Teleports = Teleports0:addSection("Teleports")
local Main0 = R3TH:addPage("Main", 5012544944)
local Main = Main0:addSection("Main")
local Combat = Main0:addSection("Combat")
local LagServer = Main0:addSection("Lag Server")
local Farm = Main0:addSection("Auto Farm")
local Settings0 = R3TH:addPage("Settings", 5012544372)
local Settings = Settings0:addSection("Settings")
local Credits = Settings0:addSection("Credits")

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer
local HttpService = game:GetService("HttpService")
local vim = game:GetService("VirtualInputManager")

local defualtwalkspeed = 16
local defualtjumppower = 50
local defualtgravity = 196.1999969482422
newwalkspeed = defualtwalkspeed
newjumppower = defualtjumppower
antiafk = true

local newflyspeed = 50
local c
local h
local bv
local bav
local cam
local flying
local p = game.Players.LocalPlayer
local buttons = {W = false, S = false, A = false, D = false, Moving = false}

--------------------------------------------------------------------------------------FUNCTIONS----------------------------------------------------------------------------------------
function toggleui()
    wait()
    local Toggle = false
    
    local R3THTOGGLEBUTTON = Instance.new("ScreenGui")
    local Button = Instance.new("TextButton")
    local UICorner = Instance.new("UICorner")
    local UICorner_2 = Instance.new("UICorner")

    R3THTOGGLEBUTTON.Name = "R3THTOGGLEBUTTON"
    R3THTOGGLEBUTTON.Parent = game.CoreGui
    
    Button.Name = "Button"
    Button.Parent = R3THTOGGLEBUTTON
    Button.BackgroundColor3 = Color3.fromRGB(77, 77, 77) -- CHANGES BUTTON COLOR
    Button.BorderColor3 = Color3.fromRGB(52, 52, 52)
    Button.BorderSizePixel = 0
    Button.Position = UDim2.new(0.942588627, 0, 0.223685458, 0)
    Button.Size = UDim2.new(0.0358672254, 0, 0.0771396905, 0)
    Button.Font = Enum.Font.FredokaOne
    Button.Text = "T"
    Button.TextColor3 = Color3.fromRGB(255, 255, 255) -- CHANGES TEXT COLOR
    Button.TextScaled = true
    Button.TextSize = 33.000
    Button.TextWrapped = true
    Button.Draggable = true
    
    UICorner.Parent = Button
    
    UICorner_2.Parent = Button
    
    Button.MouseButton1Click:connect(function()
        Toggle = not Toggle
    end)
    
    while r3thtoggleui do
        function toggleuifix()
        if Toggle then
            Toggle = false
            R3TH:toggle()
            wait()
        end
    end
    wait()
    pcall(toggleuifix)
    end
end

function sendnotification(notfiicationmessage)
    if R3THDEVICE == "Mobile" then
        StarterGui:SetCore("SendNotification", {
            Title = "R3TH PRIV";
            Text = notfiicationmessage;
            Duration = 5;
        })
    else
        Notification:Notify(
            {Title = "R3TH PRIV", Description = notfiicationmessage},
            {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "default"}
        )
    end
end

function loadesp()
    if loadespenabled ~= true then
        loadespenabled = true
        R3THESP = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/OtherScripts/ESP.lua"))()
        R3THESP.Box = false
        R3THESP.BoxOutline = false
        R3THESP.HealthBar = false
        R3THESP.Names = false
        R3THESP.NamesOutline = false
    end
end

function startFly()
    if not p.Character or not p.Character.Head or flying then return end
    c = p.Character
    h = c.Humanoid
    h.PlatformStand = true
    cam = workspace:WaitForChild('Camera')
    bv = Instance.new("BodyVelocity")
    bav = Instance.new("BodyAngularVelocity")
    bv.Velocity, bv.MaxForce, bv.P = Vector3.new(0, 0, 0), Vector3.new(10000, 10000, 10000), 1000
    bav.AngularVelocity, bav.MaxTorque, bav.P = Vector3.new(0, 0, 0), Vector3.new(10000, 10000, 10000), 1000
    bv.Parent = c.Head
    bav.Parent = c.Head
    flying = true
    h.Died:connect(function() flying = false end)
end
  
function endFly()
    if not p.Character or not flying then return end
    h.PlatformStand = false
    bv:Destroy()
    bav:Destroy()
    flying = false
end

function setVec(vec)
    return vec * (newflyspeed / vec.Magnitude)
end

function teamcheck()
    if game.Players.LocalPlayer.Team.Name == "Red" then
        enemyteamcolor = "Blue"
    elseif game.Players.LocalPlayer.Team.Name == "Blue" then
        enemyteamcolor = "Red"
    end
end

function jointeamfunc()
    joiningteam = true
    game:GetService("ReplicatedStorage").Remotes.JoinTeam:FireServer("Blue")
    task.wait()
    game:GetService("ReplicatedStorage").Remotes.SpawnPlayer:FireServer(workspace.teamStructures.Blue.building.harbor)
    task.wait()
    game:GetService("ReplicatedStorage").Remotes.JoinTeam:FireServer("Red")
    task.wait()
    game:GetService("ReplicatedStorage").Remotes.SpawnPlayer:FireServer(workspace.teamStructures.Red.building.harbor)
end

function gamemode()
    number = 0
    for i,v in pairs (workspace.teamStructures:GetDescendants()) do
        if v.Name == "island" then
            number = number + 1
        end
    end
end

--------------------------------------------------------------------------------------EXTRA----------------------------------------------------------------------------------------
local VirtualUser = game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
    if antiafk == true then
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
end)
wait()

local flinglist = {}
local playerlist = {}

table.insert(flinglist,"All")

for i,v in pairs(game.Players:GetPlayers())do
    if v ~= game.Players.LocalPlayer then
        table.insert(flinglist,v.Name)
        table.insert(playerlist,v.Name)
    end
end

game.Players.PlayerAdded:Connect(function(player)
    local name = player.Name
    table.insert(flinglist,name)
    table.insert(playerlist,name)
end)

game.Players.PlayerRemoving:Connect(function(player)
    local name = player.Name
    for i,v in pairs(flinglist)do
        if v == name then  
            table.remove(flinglist,i)
        end
    end
end)

game.Players.PlayerRemoving:Connect(function(player)
    local name = player.Name
    for i,v in pairs(playerlist)do
        if v == name then  
            table.remove(playerlist,i)
        end
    end
end)

local Part = Instance.new("Part")
Part.Name = "SpawnPart1"
Part.Anchored = true
Part.Size = Vector3.new(1, 1, 1)
Part.CFrame = CFrame.new(0, -1000, 0)
Part.Parent = workspace

--------------------------------------------------------------------------------------UNIVERSAL----------------------------------------------------------------------------------------
if R3THDEVICE == "Mobile" then
    Player:addTextbox("Walkspeed", defualtwalkspeed, function(walkspeed, focusLost)
        newwalkspeed = tonumber(walkspeed)
    end)
else
    Player:addSlider("Walkspeed", defualtwalkspeed, 0, 200, function(walkspeed)
        newwalkspeed = tonumber(walkspeed)
    end)
end

if R3THDEVICE == "Mobile" then
    Player:addTextbox("Jumppower", defualtjumppower, function(jumppower, focusLost)
        newjumppower = tonumber(jumppower)
    end)
else
    Player:addSlider("Jumppower", defualtjumppower, 0, 500, function(jumppower)
        newjumppower = tonumber(jumppower)
    end)
end

Player:addToggle("Enable WalkSpeed", false, function(enablewalkspeed)
    loopwalkspeed = enablewalkspeed
    while loopwalkspeed do
        LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = (newwalkspeed)
        wait()
    end
    wait()
    LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = (defualtwalkspeed)
    wait()
end)

Player:addToggle("Enable JumpPower", false, function(enablejumppower)
    loopjumppower = enablejumppower
    while loopjumppower do
        LocalPlayer.Character:WaitForChild("Humanoid").JumpPower = (newjumppower)
        wait()
    end
    wait()
    LocalPlayer.Character:WaitForChild("Humanoid").JumpPower = (defualtjumppower)
    wait()
end)

if R3THDEVICE == "Mobile" then
    Player:addTextbox("Fly Speed", 50, function(flyspeed, focusLost)
        newflyspeed = tonumber(flyspeed)
    end)
else
    Player:addSlider("Fly Speed", 50, 0, 500, function(flyspeed)
        newflyspeed = tonumber(flyspeed)
    end)
end

Player:addToggle("Enable Fly", false, function(enablefly)
    if flyfirst ~= true then
        flyfirst = true
        game:GetService("UserInputService").InputBegan:connect(function (input, GPE) 
            if GPE then return end
            for i, e in pairs(buttons) do
                if i ~= "Moving" and input.KeyCode == Enum.KeyCode[i] then
                    buttons[i] = true
                    buttons.Moving = true
                end
            end
        end)
          
        game:GetService("UserInputService").InputEnded:connect(function (input, GPE) 
            if GPE then return end
            local a = false
            for i, e in pairs(buttons) do
                if i ~= "Moving" then
                    if input.KeyCode == Enum.KeyCode[i] then
                        buttons[i] = false
                    end
                    if buttons[i] then a = true end
                end
            end
            buttons.Moving = a
        end)

        game:GetService("RunService").Heartbeat:connect(function (step) -- The actual fly function, called every frame
            if flying and c and c.PrimaryPart then
                local p = c.PrimaryPart.Position
                local cf = cam.CFrame
                local ax, ay, az = cf:toEulerAnglesXYZ()
                c:SetPrimaryPartCFrame(CFrame.new(p.x, p.y, p.z) * CFrame.Angles(ax, ay, az))
                if buttons.Moving then
                    local t = Vector3.new()
                    if buttons.W then t = t + (setVec(cf.lookVector)) end
                    if buttons.S then t = t - (setVec(cf.lookVector)) end
                    if buttons.A then t = t - (setVec(cf.rightVector)) end
                    if buttons.D then t = t + (setVec(cf.rightVector)) end
                    c:TranslateBy(t * step)
                end
            end
        end)
    end
    if enablefly == true then
        startFly()
    elseif enablefly == false then
        endFly()
    end
end)

Player:addToggle("Noclip", false, function(noclip)
    loopnoclip = noclip
    while loopnoclip do
        function loopnoclipfix()
        for a, b in pairs(Workspace:GetChildren()) do
            if b.Name == LocalPlayer.Name then
                for i, v in pairs(Workspace[LocalPlayer.Name]:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end 
            end 
        end
        wait()
    end
    wait()
    pcall(loopnoclipfix)
    end
end)

Player:addToggle("Swim", false, function(enableswim)
    loopswim = enableswim
    while loopswim do
        workspace.Gravity = 0
        LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead,false)
        LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
        LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
        LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
        LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
        LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
        LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
        LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
        LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
        LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
        LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
        LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,false)
        LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
        LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
        LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
        LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
        LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
        wait()
    end
    wait()
    workspace.Gravity = defualtgravity
    LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead,true)
    LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
    LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
    LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
    LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
    LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
    LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
    LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
    LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
    LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
    LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
    LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,true)
    LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
    LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
    LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
    LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
    LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
    wait()
end)

Player:addToggle("Xray", false, function(xray)
    local t=false

    local function scan(z,t)
        for _,i in pairs(z:GetChildren()) do
            if i:IsA("BasePart") and not i.Parent:FindFirstChild("Humanoid") and not i.Parent.Parent:FindFirstChild("Humanoid") then
                i.LocalTransparencyModifier=t
            end
            scan(i,t)
        end
    end
    function x(v)
        if v then
            if xray == true then
                scan(workspace,0.9)
            else
                scan(workspace,0)
            end
        else
            scan(workspace,0)
        end
    end
    t=not t
    x(t)
end)

Player:addButton("Respawn", function()
    LocalPlayer.Character:WaitForChild("Humanoid").Health = 0
    wait()
end)

Player:addButton("Open Console", function()
    game.StarterGui:SetCore("DevConsoleVisible", true)
    wait()
end)

Player:addToggle("Enable Reset", false, function(enablereset)
    game:GetService("StarterGui"):SetCore("ResetButtonCallback", enablereset)
end)

if R3THDEVICE == "Mobile" then
    Player:addTextbox("FOV", 70, function(FOV, focusLost)
        game:GetService'Workspace'.Camera.FieldOfView = FOV
    end)
else
    Player:addSlider("FOV", 70, 0, 120, function(FOV)
        game:GetService'Workspace'.Camera.FieldOfView = FOV
    end)
end

ESP:addToggle("Names", false, function(names)
    loadesp()
    R3THESP.Names = names
end)

ESP:addToggle("Boxes", false, function(boxes)
    loadesp()
    R3THESP.Box = boxes
end)

ESP:addToggle("Health", false, function(health)
    loadesp()
    R3THESP.HealthBar = health
end)

ESP:addToggle("Outlines", false, function(names)
    loadesp()
    R3THESP.BoxOutline = names
    R3THESP.NamesOutline = names
end)

Fling:addDropdown("Select Player", flinglist, function(flingplayerselect)
    FLINGTARGET = flingplayerselect
    wait()
end)

Fling:addToggle("Fling", false, function(flingplayer)
    if flingplayer == true then
        loadstring(game:HttpGet('https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/OtherScripts/Fling.lua'))()
        wait()
    end
    if flingplayer == false then
        getgenv().flingloop = false
        wait()
    end
end)

Game:addToggle("RTX Shaders", false, function(rtxshaders)
    if rtxshaders == true then
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/OtherScripts/RTX%20Shaders.lua'),true))()
        wait()
    end
    if rtxshaders == false then
        for i,v in pairs(game.Lighting:GetChildren()) do
            if v.Name == "[ R3TH PRIV ]: Sunset" then
                v:Destroy()
            elseif v.Name == "[ R3TH PRIV ]: Bloom" then
                v:Destroy()
            elseif v.Name == "[ R3TH PRIV ]: Inari taisha" then
                v:Destroy()
            elseif v.Name == "[ R3TH PRIV ]: Normal" then
                v:Destroy()
            elseif v.Name == "[ R3TH PRIV ]: SunRays" then
                v:Destroy()
            elseif v.Name == "[ R3TH PRIV ]: Takayama" then
                v:Destroy()
            end
        end
        wait()
    end
end)

Game:addToggle("Lag Chat", false, function(lagchat)
    lagchatloop = lagchat
    while lagchatloop do
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("　", "All")
        wait(3)
    end
end)

Game:addToggle("Chat Spy", false, function(chatspy)
    if chatspy == true then
        if chatspyon ~= true then
            chatspyon = true
            loadstring(game:HttpGet(('https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/OtherScripts/ChatSpy.lua'),true))()
            wait()
        else
            privateProperties.Text = "[SPY ENABLED]"
            StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
            chatspyenabled = true
            wait()
        end
        wait()
    end
    if chatspy == false then
        chatspyenabled = false
        privateProperties.Text = "[SPY DISABLED]"
        StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
        wait()
    end
end)

Game:addButton("Rejoin", function()
    game:GetService'TeleportService':TeleportToPlaceInstance(game.PlaceId,game.JobId,game:GetService'Players'.LocalPlayer)
    wait()
end)

Game:addButton("Serverhop", function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/OtherScripts/Serverhop.lua'),true))()
    wait()
end)

--------------------------------------------------------------------------------------TELEPORTS----------------------------------------------------------------------------------------
Flags:addButton("Unclaimed Flag", function()
    gamemode()
    task.wait()
    if number == 1 then
        for i,v in pairs (workspace.teamStructures.Neutral.building:GetDescendants()) do
            if v.Name == "island" then
                if v:FindFirstChild("flagPole") ~= nil then
                    LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(v.flagPole.touch.Position) * CFrame.new(0,2.5,0)
                else
                    LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(v.center.Position) * CFrame.new(0,2.5,0)
                end
            end
        end
    elseif number == 3 then
        for i,v in pairs (workspace.teamStructures.Neutral.building:GetDescendants()) do
            if v.Name == "island" then
                LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(v.flagPole.touch.Position) * CFrame.new(0,2.5,0)
            end
        end
    end
    wait()
end)

Flags:addButton("Your Flag", function()
    gamemode()
    task.wait()
    if number == 1 then
        for i,v in pairs (workspace.teamStructures[LocalPlayer.Team.Name].building:GetDescendants()) do
            if v.Name == "island" then
                if v:FindFirstChild("flagPole") ~= nil then
                    LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(v.flagPole.touch.Position) * CFrame.new(0,2.5,0)
                else
                    LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(v.center.Position) * CFrame.new(0,2.5,0)
                end
            end
        end
    elseif number == 3 then
        for i,v in pairs (workspace.teamStructures[LocalPlayer.Team.Name].building:GetDescendants()) do
            if v.Name == "island" then
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(v.flagPole.touch.Position) * CFrame.new(0,2.5,0)
            end
        end
    end
    wait()
end)

Flags:addButton("Enemy Flag", function()
    teamcheck()
    gamemode()
    task.wait()
    if number == 1 then
        for i,v in pairs (workspace.teamStructures[enemyteamcolor].building:GetDescendants()) do
            if v.Name == "island" then
                if v:FindFirstChild("flagPole") ~= nil then
                    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(v.flagPole.touch.Position) * CFrame.new(0,2.5,0)
                else
                    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(v.center.Position) * CFrame.new(0,2.5,0)
                end
            end
        end
    elseif number == 3 then
        for i,v in pairs (workspace.teamStructures[enemyteamcolor].building:GetDescendants()) do
            if v.Name == "island" then
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(v.flagPole.touch.Position) * CFrame.new(0,2.5,0)
            end
        end
    end
    wait()
end)

Teleports:addButton("Your Harbor", function()
    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(workspace.teamStructures[LocalPlayer.team.Name].building.harbor.playerSpawn.Spawn.Position) * CFrame.new(0,2.5,0)
    wait()
end)

Teleports:addButton("Enemy Harbor", function()
    teamcheck()
    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(workspace.teamStructures[enemyteamcolor].building.harbor.playerSpawn.Spawn.Position) * CFrame.new(0,2.5,0)
    wait()
end)

Teleports:addButton("Your Aircraft Carrier", function()
    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(workspace.teamStructures[LocalPlayer.team.Name].boat["Aircraft Carrier"].playerSpawn.SpawnLocation.Position) * CFrame.new(0,2.5,0)
    wait()
end)

Teleports:addButton("Enemy Aircraft Carrier", function()
    teamcheck()
    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(workspace.teamStructures[enemyteamcolor].boat["Aircraft Carrier"].playerSpawn.SpawnLocation.Position) * CFrame.new(0,2.5,0)
    wait()
end)

Teleports:addButton("Your Battleship", function()
    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(workspace.teamStructures[LocalPlayer.team.Name].boat.Battleship.playerSpawn.SpawnLocation.Position) * CFrame.new(0,2.5,0)
    wait()
end)

Teleports:addButton("Enemy Battleship", function()
    teamcheck()
    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(workspace.teamStructures[enemyteamcolor].boat.Battleship.playerSpawn.SpawnLocation.Position) * CFrame.new(0,2.5,0)
    wait()
end)

--------------------------------------------------------------------------------------MAIN----------------------------------------------------------------------------------------
Main:addToggle("Walk on Water", false, function(walkonwater)
    for i,v in pairs (workspace.water.game:GetChildren()) do
        if v.Name == "water" then
            v.CanCollide = walkonwater
        end
    end
end)

Combat:addDropdown("Select Player", playerlist, function(selectedplayer)
    selectedplayername = selectedplayer
end)

Combat:addToggle("Auto Kill Player", false, function(autokillplayer)
    autokillplayerloop = autokillplayer
    for i,v in pairs (workspace.water.game:GetChildren()) do
        if v.Name == "water" then
            v.CanCollide = autokillplayerloop
        end
    end
    if autokillplayerloop == false then
        game.Players.LocalPlayer.Character.Head:Destroy()
    end
    while autokillplayerloop do
        function autokillplayerloopfix()
        joiningteam = false
        killingplayer = false
        if game:GetService("Players").LocalPlayer.PlayerGui.gui.startMenu.Visible == true then
            jointeamfunc()
        elseif game:GetService("Players").LocalPlayer.PlayerGui.gui.teamChoice.Visible == true then
            jointeamfunc()
        elseif game:GetService("Players").LocalPlayer.PlayerGui.gui.spawnChoice.Visible == true then
            jointeamfunc()
        end
        task.wait()
        if (game.Players[selectedplayername].Character.HumanoidRootPart.Position - workspace.spawns.template.Position).magnitude > 30 then
            if (game.Players[selectedplayername].Character.HumanoidRootPart.Position - workspace.SpawnPart1.Position).magnitude > 30 then
                for i = 1, 70 do task.wait()
                    if joiningteam ~= true then
                        killingplayer = true
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players[selectedplayername].Character:WaitForChild("HumanoidRootPart").Position) * CFrame.new(0,0,2)
                        for _,obj in next, game.Players.LocalPlayer.Backpack:GetChildren() do
                            if obj.Name == "Knife" then
                                local equip = game.Players.LocalPlayer.Backpack.Knife
                                equip.Parent = game.Players.LocalPlayer.Character
                            end
                        end
                        if stopclicking ~= true then
                            vim:SendMouseButtonEvent(4, 1, 0, true, game, 1);
                        end
                    end
                end
                task.wait()
            end
        end
        wait()
    end
    wait()
    pcall(autokillplayerloopfix)
    end
end)

newkillrange = 30
Combat:addToggle("Kill Aura", false, function(killaura)
    killauraloop = killaura
    while killauraloop do
        if newkillrange > -1 and newkillrange < 101 then
            teamcheck()
            for i,v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer:DistanceFromCharacter(v.Character.HumanoidRootPart.Position) < newkillrange then
                    if v.Team.Name == enemyteamcolor then
                        for i = 1, 70 do task.wait()
                            if joiningteam ~= true then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Character:WaitForChild("HumanoidRootPart").Position) * CFrame.new(0,0,2)
                                for _,obj in next, game.Players.LocalPlayer.Backpack:GetChildren() do
                                    if obj.Name == "Knife" then
                                        local equip = game.Players.LocalPlayer.Backpack.Knife
                                        equip.Parent = game.Players.LocalPlayer.Character
                                    end
                                end
                                if stopclicking ~= true then
                                    vim:SendMouseButtonEvent(4, 1, 0, true, game, 1);
                                end
                            end
                        end
                        task.wait()
                    end
                end
            end
            wait()
        else
            killauraloop = false
            Notification:Notify(
                {Title = "R3TH PRIV", Description = "Kill Range needs to be between 0 - 100"},
                {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "default"}
            )
        end
        wait()
    end
end)

if R3THDEVICE == "Mobile" then
    Combat:addSlider("Kill Range", 30, 0, 100, function(killrange)
        newkillrange = tonumber(killrange)
    end)
elseif _G.R3THMOBILE == true then
    Combat:addTextbox("Kill Range", 30, function(killrange, focusLost)
        newkillrange = tonumber(killrange)
    end)
end


LagServer:addDropdown("Select Method", {"Lag Method 1 (slow but stable)", "Lag Method 2 (fast but laggy)"}, function(lagmethod)
    if lagmethod == "Lag Method 1 (slow but stable)" then
        lagmethodname = "1"
    elseif lagmethod == "Lag Method 2 (fast but laggy)" then
        lagmethodname = "2"
    end
end)

LagServer:addToggle("Start Lag Method", false, function(startlagmethod)
    startlagmethodloop = startlagmethod
    if lagmethodname == nil and startlagmethodloop == true then
        sendnotification("Select a lag method first")
    elseif firststartlagmethod ~= true and startlagmethodloop == true then
        firststartlagmethod = true
        sendnotification("All knifes will be deleted to reduce your lag")
    end
    if startlagmethodloop == false and lagmethodname ~= nil then
        game.Players.LocalPlayer.Character.Head:Destroy()
        if firststartlagmethod2 ~= true then
            firststartlagmethod2 = true
            sendnotification("If your ping is high just give it a bit and it will turn off and go back to normal")
        end
    end
    while startlagmethodloop do
        function startlagmethodloopfix()
        if lagmethodname == "1" then
            game:GetService("ReplicatedStorage").Remotes.JoinTeam:FireServer("Blue")
            task.wait()
            game:GetService("ReplicatedStorage").Remotes.SpawnPlayer:FireServer(workspace.teamStructures.Blue.building.harbor)
            task.wait()
            game:GetService("ReplicatedStorage").Remotes.JoinTeam:FireServer("Red")
            task.wait()
            game:GetService("ReplicatedStorage").Remotes.SpawnPlayer:FireServer(workspace.teamStructures.Red.building.harbor)
            task.wait()
            for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if startlagmethodloop == true then
                    v.Parent = game.Players.LocalPlayer.Character
                    v.Parent = workspace
                    wait()
                end
            end
            for i,v in pairs (workspace:GetDescendants()) do
                if v.Name == "Knife" then
                    v:Destroy()
                end
            end
            task.wait()
            for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                v:Destroy()
                wait()
            end
            task.wait()
        elseif lagmethodname == "2" then
            for i = 1,120 do
                if startlagmethodloop == true then
                    game:GetService("ReplicatedStorage").Remotes.JoinTeam:FireServer("Blue")
                    task.wait()
                    game:GetService("ReplicatedStorage").Remotes.SpawnPlayer:FireServer(workspace.teamStructures.Blue.building.harbor)
                    task.wait()
                    game:GetService("ReplicatedStorage").Remotes.JoinTeam:FireServer("Red")
                    task.wait()
                    game:GetService("ReplicatedStorage").Remotes.SpawnPlayer:FireServer(workspace.teamStructures.Red.building.harbor)
                    task.wait()
                end
            end
            for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if startlagmethodloop == true then
                    v.Parent = game.Players.LocalPlayer.Character
                    v.Parent = workspace
                    for i,v in pairs (workspace:GetDescendants()) do
                        if v.Name == "Knife" then
                            v:Destroy()
                        end
                    end
                    wait()
                end
            end
            task.wait()
            game.Players.LocalPlayer.Character.Head:Destroy()
            task.wait(2)
        end
        wait()
    end
    wait()
    pcall(startlagmethodloopfix)
    end
end)

Farm:addToggle("Auto Farm", false, function(autofarmtoggle)
    autofarmloop = autofarmtoggle
    if firstautofarm ~= true then
        firstautofarm = true
        sendnotification("Use at your own risk, recommended to use on a alt")
    end
    for i,v in pairs (workspace.water.game:GetChildren()) do
        if v.Name == "water" then
            v.CanCollide = autofarmloop
        end
    end
    if autofarmloop == false then
        game.Players.LocalPlayer.Character.Head:Destroy()
    end
    while autofarmloop do
    function autofarmloopfix()
        clamingisland = false
        joiningteam = false

        if game:GetService("Players").LocalPlayer.PlayerGui.gui.startMenu.Visible == true then
            jointeamfunc()
        elseif game:GetService("Players").LocalPlayer.PlayerGui.gui.teamChoice.Visible == true then
            jointeamfunc()
        elseif game:GetService("Players").LocalPlayer.PlayerGui.gui.spawnChoice.Visible == true then
            jointeamfunc()
        end

        gamemode()
        task.wait()
        if number == 1 then
            for i,v in pairs (workspace.teamStructures.Neutral.building:GetDescendants()) do
                if v.Name == "island" then
                    if v:FindFirstChild("flagPole") ~= nil then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.flagPole.touch.Position) * CFrame.new(0,2.5,0)
                        num = 50
                        islandname = v.flagPole.touch.Position
                        clamingisland = true
                    else
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.center.Position) * CFrame.new(0,2.5,0)
                        num = 200
                        islandname = v.center.Position
                        clamingisland = true
                    end
                end
            end
        elseif number == 3 then
            for i,v in pairs (workspace.teamStructures.Neutral.building:GetDescendants()) do
                if v.Name == "island" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.flagPole.touch.Position) * CFrame.new(0,2.5,0)
                    num = 50
                    islandname = v.flagPole.touch.Position
                    clamingisland = true
                end
            end
        end

        if clamingisland == true then
            for i,v in pairs(game.Players:GetChildren()) do task.wait()
                if (v.Character.HumanoidRootPart.Position - islandname).magnitude < num and v.Name ~= game.Players.LocalPlayer.Name then
                    teamcheck()
                    task.wait()
                    if v.Team.Name == enemyteamcolor then
                        for i = 1, 70 do task.wait()
                            if joiningteam ~= true then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Character:WaitForChild("HumanoidRootPart").Position) * CFrame.new(0,0,2)
                                for _,obj in next, game.Players.LocalPlayer.Backpack:GetChildren() do
                                    if obj.Name == "Knife" then
                                        local equip = game.Players.LocalPlayer.Backpack.Knife
                                        equip.Parent = game.Players.LocalPlayer.Character
                                    end
                                end
                                if stopclicking ~= true then
                                    vim:SendMouseButtonEvent(4, 1, 0, true, game, 1);
                                end
                            end
                        end
                        task.wait()
                    end
                end
            end
        end
        
        if clamingisland ~= true and joiningteam ~= true then
            for i,v in pairs(game.Players:GetChildren()) do task.wait()
                teamcheck()
                if v.Name ~= game.Players.LocalPlayer.Name and v.Team.Name == enemyteamcolor then
                    if (v.Character.HumanoidRootPart.Position - workspace.spawns.template.Position).magnitude > 30 then
                        if (v.Character.HumanoidRootPart.Position - workspace.SpawnPart1.Position).magnitude > 30 then
                            for i = 1, 70 do task.wait()
                                if joiningteam ~= true then
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Character:WaitForChild("HumanoidRootPart").Position) * CFrame.new(0,0,2)
                                    for _,obj in next, game.Players.LocalPlayer.Backpack:GetChildren() do
                                        if obj.Name == "Knife" then
                                            local equip = game.Players.LocalPlayer.Backpack.Knife
                                            equip.Parent = game.Players.LocalPlayer.Character
                                        end
                                    end
                                    if stopclicking ~= true then
                                        vim:SendMouseButtonEvent(4, 1, 0, true, game, 1);
                                    end
                                end
                            end
                            task.wait()
                        end
                    end
                end
                task.wait()
            end
        end
        wait()
    end
    wait()
    pcall(autofarmloopfix)
    end
end)

--------------------------------------------------------------------------------------SETTINGS----------------------------------------------------------------------------------------
Settings:addToggle("Anti Afk", true, function(antiafktoggle)
    antiafk = antiafktoggle
end)

Settings:addKeybind("UI Toggle", Enum.KeyCode.LeftControl, function()
	R3TH:toggle()
end, function()
	print("Changed Keybind")
end)

Settings:addToggle("UI Toggle Button", false, function(uitogglebutton)
    if uitogglebutton == true then
        r3thtoggleui = true
        wait()
        toggleui()
        wait()
    end
    if uitogglebutton == false then
        r3thtoggleui = false
        wait()
        for i,v in pairs (game.CoreGui:GetDescendants()) do
            if v.Name == "R3THTOGGLEBUTTON" then
                v:Destroy()
            end
        end
        wait()
    end
end)

Credits:addButton("pethicial", function()
    print("pethicial")
end)

--------------------------------------------------------------------------------------LOAD----------------------------------------------------------------------------------------
print("[ R3TH PRIV ]: Successfully loaded the script!")
R3TH:SelectPage(R3TH.pages[1], true)
sendnotification("Successfully loaded the script!")

local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
    Title = "R3TH PRIV";
    Text = "R3TH PRIV V2 coming out soon join for updates! https://discord.gg/pethicial";
    Duration = 10;
}) 

print("[ R3TH PRIV ]: R3TH PRIV V2 coming out soon join for updates! https://discord.gg/pethicial")
