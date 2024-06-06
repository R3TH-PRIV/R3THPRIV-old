--[[
    R3TH PRIV THIEF LIFE SIMULATOR SOURCE

    It should be noted that this script is rather messy and not recommended for learning off because it is many months old and my first script hub ever.
    V2 is being developed, and now that I've had six months of experience with lua, I can create a much better script hub.
    .gg/pethicial

    Credits:
        pethicial
]]

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "R3TH PRIV | .gg/pethicial";
    Text = "I'm very sorry but this script will be down for a day or two.";
    Duration = 20;
})
wait(9999999999999)

--------------------------------------------------------------------------------------R3THPRIV----------------------------------------------------------------------------------------
repeat wait() until game:IsLoaded()

print("[ R3TH PRIV ]: R3TH PRIV THIEF LIFE SIMULATOR LOADING...")

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
local Teleports = Teleports0:addSection("Teleports")
local Main0 = R3TH:addPage("Main", 5012544944)
local Main = Main0:addSection("Main")
local Farm = Main0:addSection("Farm")
local Target = Main0:addSection("Target")
local Shop = R3TH:addPage("Shop", 5012537936)
local Guns = Shop:addSection("Guns")
local Armour = Shop:addSection("Armour")
local Pets = Shop:addSection("Pets")
local Tools = Shop:addSection("Tools")
local Settings0 = R3TH:addPage("Settings", 5012544372)
local Settings = Settings0:addSection("Settings")
local Credits = Settings0:addSection("Credits")

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer
local HttpService = game:GetService("HttpService")

local defualtwalkspeed = 15
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

table.insert(flinglist,"All")

for i,v in pairs(game.Players:GetPlayers())do
    if v ~= game.Players.LocalPlayer then
        table.insert(flinglist,v.Name)
    end
end

game.Players.PlayerAdded:Connect(function(player)
    local name = player.Name
    table.insert(flinglist,name)
end)

game.Players.PlayerRemoving:Connect(function(player)
    local name = player.Name
    for i,v in pairs(flinglist)do
        if v == name then  
            table.remove(flinglist,i)
        end
    end
end)

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
Teleports:addButton("Pet Shop", function()
    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-1367, 13, 65)
    wait()
end)

Teleports:addButton("Armour Shop", function()
    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-1359, 13, 161)
    wait()
end)

Teleports:addButton("Backpack Shop", function()
    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-1350, 13, -50)
    wait()
end)

Teleports:addButton("Bank", function()
    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-1372, 13, -138)
    wait()
end)

Teleports:addButton("Gun Room", function()
    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-1060, -9, -189)
    wait()
end)

Teleports:addButton("Boat Room", function()
    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-996, -12, -209)
    wait()
end)

Teleports:addButton("Vacation Island", function()
    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(331, 53, 12)
    wait()
end)

Teleports:addButton("Spawn", function()
    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-1260, 13, 17)
    wait()
end)

Teleports:addButton("Army Base", function()
    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-560, 2, 4137)
    wait()
end)

Teleports:addButton("Out Of Map", function()
    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-2604, 12, -636)
    wait()
end)

Teleports:addButton("Crystal Room", function()
    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-1193, -174, 55)
    wait()
end)

Teleports:addButton("Sewers", function()
    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-1249, -8, 100)
    wait()
end)

Teleports:addButton("Sell Shop", function()
    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-1358, 13, 9)
    wait()
end)

Teleports:addButton("V.I.P Room", function()
    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-1189, -9, -158)
    wait()
end)

Teleports:addButton("Donut Room", function()
    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-1115, -9, -192)
    wait()
end)

Teleports:addButton("Gold Room", function()
    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-1157, -9, -175)
    wait()
end)

Teleports:addButton("Secret Room", function()
    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-1199, -9, -21)
    wait()
end)

--------------------------------------------------------------------------------------MAIN----------------------------------------------------------------------------------------
Main:addButton("Open Safe", function()
    game:GetService("ReplicatedStorage").Events.Safe.RequestSafe:FireServer()
    wait()
end)

Main:addButton("Loot Dynamite", function()
    game:GetService("ReplicatedStorage").Events.Loot.RequestLoot:FireServer(math.random(489, 493))
    wait()
end)

Main:addButton("Sell All", function()
    game:GetService("ReplicatedStorage").Events.Shop.RequestSellAll:FireServer(-1)
    wait()
end)

Main:addButton("Unlock Level Access", function()
    game:GetService("ReplicatedStorage").Events.Access.RequestBuyAccess:FireServer(0)
    game:GetService("ReplicatedStorage").Events.Access.RequestBuyAccess:FireServer(1)
    game:GetService("ReplicatedStorage").Events.Access.RequestBuyAccess:FireServer(2)
    game:GetService("ReplicatedStorage").Events.Access.RequestBuyAccess:FireServer(3)
    game:GetService("ReplicatedStorage").Events.Access.RequestBuyAccess:FireServer(4)
    game:GetService("ReplicatedStorage").Events.Access.RequestBuyAccess:FireServer(5)
    game:GetService("ReplicatedStorage").Events.Access.RequestBuyAccess:FireServer(6)
    game:GetService("ReplicatedStorage").Events.Access.RequestBuyAccess:FireServer(7)
    wait()
end)

Main:addToggle("Kill All Police", false, function(killpolice)
    killpoliceloop = killpolice
    while killpoliceloop do
        function killpoliceloopfix()
        if game.workspace.Polices:FindFirstChild("Police") ~= nil then
            game:GetService("ReplicatedStorage").Events.Weapon.RequestHit:FireServer(workspace.Polices.Police)
        end
        if game.workspace.Polices:FindFirstChild("Police2") ~= nil then
            game:GetService("ReplicatedStorage").Events.Weapon.RequestHit:FireServer(workspace.Polices.Police2)
        end
        if game.workspace.Polices:FindFirstChild("Swat") ~= nil then
            game:GetService("ReplicatedStorage").Events.Weapon.RequestHit:FireServer(workspace.Polices.Swat)
        end
        wait()
    end
    wait()
    pcall(killpoliceloopfix)
    end
end)

Main:addTextbox("Loot Level", "0 - 500", function(lootlevel, focusLost)
    lootlevelnum = tonumber(lootlevel)
end)

Main:addButton("Request Loot", function()
    if lootlevelnum > -1 and lootlevelnum < 501 then
        game:GetService("ReplicatedStorage").Events.Loot.RequestLoot:FireServer(lootlevelnum)
    else
        sendnotification("Loot level needs to be between 0 - 500 for this to work")
    end
    wait()
end)

Farm:addDropdown("Select Method", {"Small Money Farm                               (NEEDS 100$)", "Big Money Farm                                (NEEDS 95000$)"}, function(farmmethod)
    if farmmethod == "Small Money Farm                               (NEEDS 100$)" then
        farmgunname = "VIPAK47"
    elseif farmmethod == "Big Money Farm                                (NEEDS 95000$)" then
        farmgunname = "RareM4A1"
    end
end)

Farm:addToggle("Start Money Farm", false, function(startmoneyfarm)
    startmoneyfarmloop = startmoneyfarm
    while startmoneyfarmloop do
        game:GetService("ReplicatedStorage").Events.GunShop.RequestBuy:FireServer(farmgunname)
        game:GetService("ReplicatedStorage").Events.Shop.RequestSellItem:FireServer(1)
        wait()
    end
end)

Farm:addToggle("XP Farm", false, function(xpfarm)
    xpfarmloop = xpfarm
    while xpfarmloop do
        game:GetService("ReplicatedStorage").Events.Loot.RequestLoot:FireServer(0)
        wait()
    end
end)

Target:addDropdown("Select Player", flinglist, function(playername)
    playertarget = playername
    wait()
end)

Target:addButton("Hit Player Once", function()
    if playertarget == "All" then
        for i,v in pairs(game.Players:GetChildren()) do
            if v.Name ~= game.Players.LocalPlayer.Name then
                game:GetService("ReplicatedStorage").Events.Weapon.RequestHit:FireServer(game.Players:FindFirstChild(v.Name).Character)
            end
        end
    else
        game:GetService("ReplicatedStorage").Events.Weapon.RequestHit:FireServer(game.Players:FindFirstChild(playertarget).Character)
    end
    task.wait()
end)

Target:addToggle("Kill Player", false, function(killplayer)
    killplayerloop = killplayer
    while killplayerloop do
        function killplayerloopfix()
        if playertarget == "All" then
            for i,v in pairs(game.Players:GetChildren()) do
                if v.Name ~= game.Players.LocalPlayer.Name then
                    game:GetService("ReplicatedStorage").Events.Weapon.RequestHit:FireServer(game.Players:FindFirstChild(v.Name).Character)
                    wait()
                end
            end
        else
            game:GetService("ReplicatedStorage").Events.Weapon.RequestHit:FireServer(game.Players:FindFirstChild(playertarget).Character)
        end
        task.wait()
    end
    wait()
    pcall(killplayerloopfix)
    end
end)

Target:addToggle("Club Tag Player", false, function(forcejoinclub)
    forcejoinclubloop = forcejoinclub
    while forcejoinclubloop do
        if playertarget == "All" then
            for i,v in pairs(game.Players:GetChildren()) do
                if v.Name ~= game.Players.LocalPlayer.Name then
                    local args = {
                        [1] = {
                            ["Status"] = "Request",
                            ["Name"] = v.Name,
                            ["ID"] = v.UserId
                        },
                        [2] = "Member"
                    }
                
                    game:GetService("ReplicatedStorage").Events.Guild.RequestChangeTitle:FireServer(unpack(args))
                end
            end
        else
            local args = {
                [1] = {
                    ["Status"] = "Request",
                    ["Name"] = game.Players[playertarget],
                    ["ID"] = game.Players[playertarget].UserId
                },
                [2] = "Member"
            }
        
            game:GetService("ReplicatedStorage").Events.Guild.RequestChangeTitle:FireServer(unpack(args))
            wait()
        end
        task.wait(0.1)
    end
end)

Target:addToggle("Force Join Club", false, function(forcejoinclub)
    forcejoinclubloop = forcejoinclub
    while forcejoinclubloop do
        if playertarget == "All" then
            for i,v in pairs(game.Players:GetChildren()) do
                if v.Name ~= game.Players.LocalPlayer.Name then
                    game:GetService("ReplicatedStorage").Events.Guild.SendInvite:FireServer(game:GetService("Players")[v.Name])
                    task.wait()
                    local args = {
                        [1] = {
                            ["Status"] = "Request",
                            ["Name"] = v.Name,
                            ["ID"] = v.UserId
                        },
                        [2] = "Member"
                    }
                
                    game:GetService("ReplicatedStorage").Events.Guild.RequestChangeTitle:FireServer(unpack(args))
                end
            end
        else
            game:GetService("ReplicatedStorage").Events.Guild.SendInvite:FireServer(game:GetService("Players")[playertarget])
            task.wait()
            local args = {
                [1] = {
                    ["Status"] = "Request",
                    ["Name"] = game.Players[playertarget],
                    ["ID"] = game.Players[playertarget].UserId
                },
                [2] = "Member"
            }
        
            game:GetService("ReplicatedStorage").Events.Guild.RequestChangeTitle:FireServer(unpack(args))
            wait()
        end
        task.wait(0.1)
    end
end)

Target:addToggle("Spam Invite Player", false, function(forcejoinclub)
    forcejoinclubloop = forcejoinclub
    while forcejoinclubloop do
        if playertarget == "All" then
            for i,v in pairs(game.Players:GetChildren()) do
                if v.Name ~= game.Players.LocalPlayer.Name then
                    game:GetService("ReplicatedStorage").Events.Guild.SendInvite:FireServer(game:GetService("Players")[v.Name])
                end
            end
        else
            game:GetService("ReplicatedStorage").Events.Guild.SendInvite:FireServer(game:GetService("Players")[playertarget])
            wait()
        end
        task.wait(0.1)
    end
end)

Target:addToggle("Kill Pet", false, function(killpet)
    killpetloop = killpet
    while killpetloop do
        if playertarget == "All" then
            for i,v in pairs(game.Players:GetChildren()) do
                if v.Name ~= game.Players.LocalPlayer.Name then
                    if game.workspace.Pets:FindFirstChild(v.Name .."_PET") ~= nil then
                        game:GetService("ReplicatedStorage").Events.Weapon.RequestHit:FireServer(workspace.Pets[v.Name .."_PET"])
                    end
                end
            end
        else
            if game.workspace.Pets:FindFirstChild(playertarget .."_PET") ~= nil then
                game:GetService("ReplicatedStorage").Events.Weapon.RequestHit:FireServer(workspace.Pets[playertarget .."_PET"])
            else
                Notification:Notify(
                    {Title = "R3TH PRIV", Description = "Player does not have a pet equipped"},
                    {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "default"}
                )
                killpetloop = false
            end
        end
        task.wait()
    end
end)

--------------------------------------------------------------------------------------SHOP----------------------------------------------------------------------------------------
Guns:addDropdown("Select Gun", {"Glock17", "1911", "TEC9", "Shotgun", "UZI", "AK47", "M4A1", "Golden1911", "GoldenShotgun", "GoldenUZI", "GoldenM4A1", "RareUZI", "RareM4A1"}, function(gunname)
    shopgunname = gunname
    wait()
end)

Guns:addButton("Buy Item", function()
    game:GetService("ReplicatedStorage").Events.GunShop.RequestBuy:FireServer(shopgunname)
end)

Guns:addToggle("Loop Buy Item", false, function(loopbuygun)
    loopbuygunloop = loopbuygun
    while loopbuygunloop do
        game:GetService("ReplicatedStorage").Events.GunShop.RequestBuy:FireServer(shopgunname)
        wait()
    end
end)

Armour:addDropdown("Select Amour", {"LightBulletProofVest1", "LightBulletProofVest2", "LightBulletProofVest3", "HeavyBulletProofVest1", "HeavyBulletProofVest2", "HeavyBulletProofVest3", "HeavyBodyArmour1", "HeavyBodyArmour2", "HeavyBodyArmour3"}, function(amourname)
    shopamourname = amourname
    wait()
end)

Armour:addButton("Buy Item", function()
    game:GetService("ReplicatedStorage").Events.ArmourShop.RequestBuy:FireServer(shopamourname)
end)

Armour:addToggle("Loop Buy Item", false, function(loopbuygun)
    loopbuygunloop = loopbuygun
    while loopbuygunloop do
        game:GetService("ReplicatedStorage").Events.ArmourShop.RequestBuy:FireServer(shopamourname)
        wait()
    end
end)

Pets:addButton("Husky", function()
    game:GetService("ReplicatedStorage").Events.PetShop.RequestBuy:FireServer("Husky")
    wait()
    game:GetService("ReplicatedStorage").Events.PetShop.RequestEquip:FireServer("Husky")
end)

Pets:addButton("Orange Cat", function()
    game:GetService("ReplicatedStorage").Events.PetShop.RequestBuy:FireServer("OrangeCat")
    wait()
    game:GetService("ReplicatedStorage").Events.PetShop.RequestEquip:FireServer("OrangeCat")
end)

Pets:addButton("Chihuahua", function()
    game:GetService("ReplicatedStorage").Events.PetShop.RequestBuy:FireServer("Chihuahua")
    wait()
    game:GetService("ReplicatedStorage").Events.PetShop.RequestEquip:FireServer("Chihuahua")
end)

Pets:addButton("Grey Cat", function()
    game:GetService("ReplicatedStorage").Events.PetShop.RequestBuy:FireServer("GreyCat")
    wait()
    game:GetService("ReplicatedStorage").Events.PetShop.RequestEquip:FireServer("GreyCat")
end)

Pets:addButton("Cattle Dog", function()
    game:GetService("ReplicatedStorage").Events.PetShop.RequestBuy:FireServer("Cattledog")
    wait()
    game:GetService("ReplicatedStorage").Events.PetShop.RequestEquip:FireServer("Cattledog")
end)

Pets:addButton("Jack Russel", function()
    game:GetService("ReplicatedStorage").Events.PetShop.RequestBuy:FireServer("Jackrussel")
    wait()
    game:GetService("ReplicatedStorage").Events.PetShop.RequestEquip:FireServer("Jackrussel")
end)

Pets:addButton("Siamese", function()
    game:GetService("ReplicatedStorage").Events.PetShop.RequestBuy:FireServer("Siamese")
    wait()
    game:GetService("ReplicatedStorage").Events.PetShop.RequestEquip:FireServer("Siamese")
end)

Pets:addButton("Bulldog", function()
    game:GetService("ReplicatedStorage").Events.PetShop.RequestBuy:FireServer("Bulldog")
    wait()
    game:GetService("ReplicatedStorage").Events.PetShop.RequestEquip:FireServer("Bulldog")
end)

Tools:addButton("Best Backpack", function()
    game:GetService("ReplicatedStorage").Events.BackpackShop.RequestBuy:FireServer("Backpack9")
end)

Tools:addButton("Best Safe Tool", function()
    game:GetService("ReplicatedStorage").Events.Toolshop.RequestBuy:FireServer("Stethoscope", "Safetools")
end)

Tools:addButton("Best Electrical Tool", function()
    game:GetService("ReplicatedStorage").Events.Toolshop.RequestBuy:FireServer("Hackingdevice", "Electricaltools")
end)

Tools:addButton("Best Picklock", function()
    game:GetService("ReplicatedStorage").Events.Toolshop.RequestBuy:FireServer("Automaticpicklock", "Picklocks")
end)

Tools:addButton("Best Normal Tool", function()
    game:GetService("ReplicatedStorage").Events.Toolshop.RequestBuy:FireServer("Plasmacutter", "Tools")
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
