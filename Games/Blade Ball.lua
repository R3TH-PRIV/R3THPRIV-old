--[[
    R3TH PRIV BLADE BALL SOURCE

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

local antikick = coroutine.create(function()
    game:GetService("ReplicatedStorage").Security.RemoteEvent:Destroy()
    game:GetService("ReplicatedStorage").Security[""]:Destroy()
    game:GetService("ReplicatedStorage").Security:Destroy()
    game:GetService("Players").LocalPlayer.PlayerScripts.Client.DeviceChecker:Destroy()
    task.wait()
    
    game:GetService('StarterGui'):SetCore('SendNotification', {
        Title = "R3TH PRIV",
        Text = "ANTI KICK ENABLED",
        Duration = 5,
    })
end)

coroutine.resume(antikick)

--------------------------------------------------------------------------------------R3THPRIV----------------------------------------------------------------------------------------
repeat wait() until game:IsLoaded()

print("[ R3TH PRIV ]: R3TH PRIV BLADE BALL LOADING...")

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
local Main0 = R3TH:addPage("Main", 5012544944)
local Auto = Main0:addSection("Auto")
local Main = Main0:addSection("Main")
local Misc = Main0:addSection("Misc")
local Crates = Main0:addSection("Crates")
local Settings0 = R3TH:addPage("Settings", 5012544372)
local Settings = Settings0:addSection("Settings")
local Credits = Settings0:addSection("Credits")

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Character = LocalPlayer.Character

local runService = game:GetService("RunService")
local workspace = game:GetService("Workspace")
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local abilitiesFolder = character:WaitForChild("Abilities")
local UserInputService = game:GetService("UserInputService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local heartbeatConnection
local upgrades = localPlayer.Upgrades
local UseRage = false
local sliderValue = 20

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local Playerparry = Players.LocalPlayer or Players.PlayerAdded:Wait()
local Remotes = ReplicatedStorage:WaitForChild("Remotes", 9e9)
local Balls = workspace:WaitForChild("Balls", 9e9)

local function onCharacterAdded(newCharacter)
    character = newCharacter
    abilitiesFolder = character:WaitForChild("Abilities")
end

local defualtwalkspeed = 36
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

localPlayer.CharacterAdded:Connect(onCharacterAdded)

local TruValue = Instance.new("StringValue")
if workspace:FindFirstChild("AbilityThingyk1212") then
    workspace:FindFirstChild("AbilityThingyk1212"):Remove()
    task.wait(0.1)
    TruValue.Parent = game:GetService("Workspace")
        TruValue.Name = "AbilityThingyk1212"
        TruValue.Value = "Dash" --Change to Use other ability
    else
        TruValue.Parent = game:GetService("Workspace")
        TruValue.Name = "AbilityThingyk1212"
        TruValue.Value = "Dash" --Change to Use other ability
end

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

function sendnotification(notificationmessage)
    if R3THDEVICE == "Mobile" then
        StarterGui:SetCore("SendNotification", {
            Title = "R3TH PRIV";
            Text = notificationmessage;
            Duration = 5;
        })
    else
        Notification:Notify(
            {Title = "R3TH PRIV", Description = notificationmessage},
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

function getExplosion()
    local _, explosion = ReplicatedStorage.Remotes.Store.RequestOpenExplosionBox:InvokeServer()
    return explosion
end

function getSword()
    local _, sword = ReplicatedStorage.Remotes.Store.RequestOpenSwordBox:InvokeServer()
    return sword
end

function equipabilityfunc()
    local args = {
        [1] = abilityName
    }
    
    game:GetService("ReplicatedStorage").Remotes.Store.RequestEquipAbility:InvokeServer(unpack(args))
    
    game:GetService("ReplicatedStorage").Remotes.Store.GetOwnedAbilities:InvokeServer()
    
    game:GetService("ReplicatedStorage").Remotes.kebaind:FireServer()
                
    local function AbilityValue2()
    local TruValue = Instance.new("StringValue")
    workspace:FindFirstChild("AbilityThingyk1212"):Remove()
            TruValue.Parent = game:GetService("Workspace")
            TruValue.Name = "AbilityThingyk1212"
            TruValue.Value = abilityName
    end
    
    for i,v in pairs(abilitiesFolder:GetChildren()) do
    
    
    for i,b in pairs(abilitiesFolder:GetChildren()) do
        local Ability = b
        
        if v.Enabled == true then
            local EquippedAbility = v
            local ChosenAbility = {}
            spawn(function()
            ChosenAbility = AbilityValue2()
        end)
    
        task.wait(0.05)
            local AbilityValue = workspace.AbilityThingyk1212
            if b.Name == AbilityValue.Value then
    
                v.Enabled = false
                b.Enabled = true
        end
    end
    end
    end
end

local function VerifyBall(Ball) -- Returns nil if the ball isn't a valid projectile; true if it's the right ball.
    if typeof(Ball) == "Instance" and Ball:IsA("BasePart") and Ball:IsDescendantOf(Balls) and Ball:GetAttribute("realBall") == true then
        return true
    end
end

local function IsTarget() -- Returns true if we are the current target.
    return (Playerparry.Character and Playerparry.Character:FindFirstChild("Highlight"))
end

local function Parry() -- Parries.
    Remotes:WaitForChild("ParryButtonPress"):Fire()
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

game.Players.LocalPlayer.CharacterAdded:Connect(function(Player)
    if r3thtoggleui == true then
        toggleui()
    end
    if equipabilitytoggle == true then
        equipabilityfunc()
    end
end)

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

Balls.ChildAdded:Connect(function(Ball)
    if autoparryloop == true then
        if not VerifyBall(Ball) then
            return
        end
        
        print(`Ball Spawned: {Ball}`)
        
        local OldPosition = Ball.Position
        local OldTick = tick()
        
        Ball:GetPropertyChangedSignal("Position"):Connect(function()
            if IsTarget() then
                local Distance = (Ball.Position - workspace.CurrentCamera.Focus.Position).Magnitude
                local Velocity = (OldPosition - Ball.Position).Magnitude
                
                print(`Distance: {Distance}\nVelocity: {Velocity}\nTime: {Distance / Velocity}`)
            
                if (Distance / Velocity) <= 10 then
                    Parry()
                end
            end
            
            if (tick() - OldTick >= 1/60) then
                OldTick = tick()
                OldPosition = Ball.Position
            end
        end)
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
    if enableswim == true then
        enableswim = false
        workspace.Gravity = 0
        LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
    else
        enableswim = true
        workspace.Gravity = defualtgravity
        LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
    end
    LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead,enableswim)
    LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,enableswim)
    LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,enableswim)
    LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,enableswim)
    LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,enableswim)
    LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,enableswim)
    LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,enableswim)
    LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,enableswim)
    LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,enableswim)
    LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,enableswim)
    LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,enableswim)
    LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,enableswim)
    LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,enableswim)
    LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,enableswim)
    LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,enableswim)
    LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,enableswim)
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

Game:addToggle("Mobile Keyboard", false, function(rtxshaders)
    if rtxshaders == true then
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt'),true))()
        wait()
    else
        for i,v in pairs(game.CoreGui:GetChildren()) do
            if v.Name == "Keyboard gui WarriorRoberr Version" then
                v:Destroy()
            end
        end
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

--------------------------------------------------------------------------------------MAIN----------------------------------------------------------------------------------------
Auto:addToggle("Auto Parry", false, function(autoparry)
    autoparryloop = autoparry
end)

Auto:addToggle("TP Parry", false, function(tpparry)
    tpparryloop = tpparry
    while tpparryloop do
        for _,ball in next, workspace.Balls:GetChildren() do
            if ball then
                if game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Highlight") then
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = ball.CFrame * CFrame.new(0, 0, (ball.Velocity).Magnitude * -0.5)
                        game:GetService("ReplicatedStorage").Remotes.ParryButtonPress:Fire()
                    end
                end
            end
        end
        wait()
    end
end)

Auto:addToggle("Look at Ball", false, function(lookatball)
    if lookatball == true then
        lookatballloop = game:GetService("RunService").Heartbeat:Connect(function()
            for _,ball in next, workspace.Balls:GetChildren() do
                if ball then
                    if game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, ball.Position)
                    end
                end
            end
            wait()
        end)
    elseif lookatball == false then
        lookatballloop:Disconnect()
    end
end)

spamparry = false
Auto:addKeybind("Spam Parry (Toggle)", Enum.KeyCode.C, function()
    if spamparry == false then
        local parryButtonPress = game:GetService("ReplicatedStorage").Remotes.ParryButtonPress
        spamparry = true
        spamparryloop = game:GetService("RunService").Heartbeat:Connect(function()
            parryButtonPress:Fire()
            wait()
        end)
    else
        spamparry = false
        spamparryloop:Disconnect()
    end
end, function()
	print("Changed Keybind")
end)

Auto:addToggle("Tp To Spawn", false, function(tptospawn)
    tptospawnloop = tptospawn
    while tptospawnloop do
        function tptospawnloopfix()
        character.HumanoidRootPart.CFrame = CFrame.new(-229, 123, 203)
    end
    wait()
    pcall(tptospawnloopfix)
    end
end)

Auto:addToggle("Fake Platform", false, function(fakeplatform)
    fakeplatformloop = fakeplatform
    while fakeplatformloop do
        function fakeplatformloopfix()
        character.Humanoid.HipHeight = 50
    end
    wait()
    pcall(fakeplatformloopfix)
    end
    character.Humanoid.HipHeight = 0
end)

Auto:addToggle("Auto Farm (needs telekinesis)", false, function(autofarm)
    autofarmloop = autofarm
    while autofarmloop do
        function autofarmloopfix()
        character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(12321,123213,123213)
        localPlayer.CharacterAdded:Connect(onCharacterAdded)
        local args = {
            [1] = CFrame.new(-177.78134155273438, 22.17252540588379, -6.560810089111328) * CFrame.Angles(-0.5510220527648926, 0.4792300760746002, 0.2761117219924927),
            [2] = {
                ["1390589899"] = Vector3.new(-3606.42333984375, 309.64959716796875, 15.07781982421875),
                ["95606930"] = Vector3.new(1109.630615234375, 97.52566528320312, 164.15850830078125),
                ["2428748976"] = Vector3.new(-393.8770751953125, 114.9974365234375, 104.13533020019531),
                ["138302338"] = Vector3.new(782.9514770507812, 90.34832763671875, 216.39634704589844),
                ["game.Players.LocalPlayer.UserId"] = Vector3.new(721.59521484375, 437.5107421875, 13.196876525878906),
                ["460529380"] = Vector3.new(3050.986572265625, -402.539306640625, -10.369964599609375),
                ["3389515036"] = Vector3.new(-24216.498046875, 2629.838134765625, 1.3838348388671875),
                ["253804325"] = Vector3.new(-277.2596435546875, -125.47763061523438, 44.2408447265625),
                ["2466009586"] = Vector3.new(1826.3505859375, 865.5350341796875, -84.64073944091797),
                ["534937301"] = Vector3.new(539.1710205078125, 96.26556396484375, 171.3994140625),
                ["1697434972"] = Vector3.new(1627.478759765625, 611.9812622070312, -123.97309112548828),
                ["4394721359"] = Vector3.new(1459.405029296875, 138.78118896484375, 68.75445556640625)
            },
            [3] = {
                [1] = 800,
                [2] = 378
            }
        }
        
        game:GetService("ReplicatedStorage").Remotes.Telekinesis:FireServer(unpack(args))
        task.wait(0.2)
        character.HumanoidRootPart.CFrame = CFrame.new(-10002.240021, 123.299988, 200.441544)
        task.wait(0.5)
        character.Humanoid.Health = 0
        task.wait(3.5)
        localPlayer.CharacterAdded:Connect(onCharacterAdded)
        character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(12321,123213,123213)
        wait()
    end
    wait()
    pcall(autofarmloopfix)
    end
end)

Main:addToggle("Disable Dead Restriction", false, function(disabledeadrest)
    disabledeadrestloop = disabledeadrest
    while disabledeadrestloop do
        character.Parent = workspace.Alive
        wait()
    end
end)

Main:addDropdown("Equip Ability", {"Dash", "Super Jump", "Platform", "Invisibility", "Thunder Dash", "Shadow Step", "Wind Cloak", "Freeze", "Forcefield", "Swap", "Raging Deflection", "Reaper", "Telekinesis", "Pull", "Phase Bypass", "Rapture", "Waypoint", "Infinity"}, function(abilityselected)
    abilityName = abilityselected
    equipabilityfunc()
end)

Main:addToggle("Auto Equip Ability", false, function(equipability)
    equipabilitytoggle = equipability
    equipabilityfunc()
end)

Misc:addButton("Emote", function()
    game:GetService("ReplicatedStorage").Remotes.CustomEmote:FireServer(true, "Empyrean")
end)

Misc:addButton("Break Ball (You need telekinesis)", function()
    game:GetService("ReplicatedStorage").Remotes.Telekinesis:FireServer()
end)

Misc:addButton("Use Telekinesis (Lobby) (You need telekinesis)", function()
    local args = {
        [1] = CFrame.new(-177.78134155273438, 22.17252540588379, -6.560810089111328) * CFrame.Angles(-0.5510220527648926, 0.4792300760746002, 0.2761117219924927),
        [2] = {
            ["1390589899"] = Vector3.new(-3606.42333984375, 309.64959716796875, 15.07781982421875),
            ["95606930"] = Vector3.new(1109.630615234375, 97.52566528320312, 164.15850830078125),
            ["2428748976"] = Vector3.new(-393.8770751953125, 114.9974365234375, 104.13533020019531),
            ["138302338"] = Vector3.new(782.9514770507812, 90.34832763671875, 216.39634704589844),
            ["game.Players.LocalPlayer.UserId"] = Vector3.new(721.59521484375, 437.5107421875, 13.196876525878906),
            ["460529380"] = Vector3.new(3050.986572265625, -402.539306640625, -10.369964599609375),
            ["3389515036"] = Vector3.new(-24216.498046875, 2629.838134765625, 1.3838348388671875),
            ["253804325"] = Vector3.new(-277.2596435546875, -125.47763061523438, 44.2408447265625),
            ["2466009586"] = Vector3.new(1826.3505859375, 865.5350341796875, -84.64073944091797),
            ["534937301"] = Vector3.new(539.1710205078125, 96.26556396484375, 171.3994140625),
            ["1697434972"] = Vector3.new(1627.478759765625, 611.9812622070312, -123.97309112548828),
            ["4394721359"] = Vector3.new(1459.405029296875, 138.78118896484375, 68.75445556640625)
        },
        [3] = {
            [1] = 800,
            [2] = 378
        }
    }
    
    game:GetService("ReplicatedStorage").Remotes.Telekinesis:FireServer(unpack(args))
end)

if R3THDEVICE == "Mobile" then
    Crates:addTextbox("Unbox Delay", 0, function(delay, focusLost)
        unboxdelay = tonumber(delay)
    end)
else
    Crates:addSlider("Unbox Delay", 5, 0, 10, function(delay)
        unboxdelay = tonumber(delay)
    end)
end

unboxdelay = 5
Crates:addToggle("Auto Unbox Explosion", false, function(unboxexplosion)
    unboxexplosionloop = unboxexplosion
    while unboxexplosionloop do
        if webhookactive == true then
            request({
                Url = webhookurl,
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json"
                },
                Body = game.HttpService:JSONEncode({
                    content = "You Unboxed " ..getExplosion()
               })
            })
        else
            sendnotification("You Unboxed " ..getExplosion())
        end
        task.wait(unboxdelay)
    end
end)

Crates:addToggle("Auto Unbox Sword", false, function(unboxsword)
    unboxswordloop = unboxsword
    while unboxswordloop do
        if webhookactive == true then
            request({
                Url = webhookurl,
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json"
                },
                Body = game.HttpService:JSONEncode({
                    content = "You Unboxed " ..getSword()
               })
            })
        else
            sendnotification("You Unboxed " ..getSword())
        end
        task.wait(unboxdelay)
    end
end)

Crates:addTextbox("Webhook Url", "Your Webhook", function(webhook, focusLost)
    webhookurl = webhook
end)

Crates:addToggle("Webhook", false, function(webhooktoggle)
    webhookactive = webhooktoggle
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
