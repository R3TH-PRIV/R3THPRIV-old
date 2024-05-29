--[[
    R3TH PRIV MURDER MYSTERY 2 SOURCE

    .gg/pethicial

    Credits:
        pethicial
]]

--------------------------------------------------------------------------------------R3THPRIV----------------------------------------------------------------------------------------
repeat wait() until game:IsLoaded()

print("[ R3TH PRIV ]: R3TH PRIV Murder Mystery 2 loading...")

--------------------------------------------------------------------------------------DEFINE----------------------------------------------------------------------------------------
local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/OtherScripts/VenyxUI.lua"))()
local R3TH = library.new("R3TH PRIV | .gg/pethicial", 5013109572)

local Universal = R3TH:addPage("Universal", 5012540623)
local Player = Universal:addSection("Player")
local ESP = Universal:addSection("ESP")
local Target = Universal:addSection("Target")
local Server = Universal:addSection("Server")

local Combat = R3TH:addPage("Combat", 5012544944)
local Murderer = Combat:addSection("Murderer")
local Sheriff = Combat:addSection("Sheriff")
local Innocent = Combat:addSection("Innocent")

local Main0 = R3TH:addPage("Main", 5012540623)
local Teleports = Main0:addSection("Teleports")
local Chams = Main0:addSection("Chams")
local Main = Main0:addSection("Main")
local Misc = Main0:addSection("Misc")

local Toggles = R3TH:addPage("Toggles", 5012544092)
local World = Toggles:addSection("World")
local Visual = Toggles:addSection("Visual")
local ChromaGuns = Toggles:addSection("Chroma Guns")
local Trading = Toggles:addSection("Trading")
local Traps = Toggles:addSection("Traps")

local SprayPaint = R3TH:addPage("Spray Paint", 5012542120)
local LoopTarget = SprayPaint:addSection("Loop Target")
local FE = SprayPaint:addSection("FE")
local Antijoin = SprayPaint:addSection("Anti Join")

local Keybinds = R3TH:addPage("Keybinds")
local UniversalKeybind = Keybinds:addSection("Universal")

local Settings0 = R3TH:addPage("Settings", 5012544372)
local Settings = Settings0:addSection("Settings")
local Credits = Settings0:addSection("Credits")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Backpack = LocalPlayer.Backpack
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local Lighting = game:GetService("Lighting")
local VirtualUser = game:GetService("VirtualUser")
local CoreGui = game:GetService("CoreGui")
local TeleportService = game:GetService("TeleportService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Remotes = ReplicatedStorage.Remotes
local Gameplay = Remotes.Gameplay
local ReplicateToy = Remotes.Extras.ReplicateToy
local knifetool = Backpack:FindFirstChild("Knife")
local DefaultChatSystemChatEvents = ReplicatedStorage.DefaultChatSystemChatEvents
local SayMessageRequest = DefaultChatSystemChatEvents.SayMessageRequest
local Trade = ReplicatedStorage.Trade


local DefaultWalkSpeed = Humanoid.WalkSpeed
local DefaultJumpPower = Humanoid.JumpPower
local WalkSpeedSlider = DefaultWalkSpeed
local JumpPowerSlider = DefaultJumpPower
FlySpeedSlider = 50
ChangeAntiAFK = true
KnifeAuraSlider = 20

local buttons = {W = false, S = false, A = false, D = false, Moving = false}

--------------------------------------------------------------------------------------FUNCTIONS----------------------------------------------------------------------------------------
function ToggleUI()
    local Toggle = false
    
    local R3THTOGGLEBUTTON = Instance.new("ScreenGui")
    local Button = Instance.new("TextButton")
    local UICorner = Instance.new("UICorner")
    local UICorner_2 = Instance.new("UICorner")

    R3THTOGGLEBUTTON.Name = "R3THTOGGLEBUTTON"
    R3THTOGGLEBUTTON.Parent = CoreGui
    
    Button.Name = "Button"
    Button.Parent = R3THTOGGLEBUTTON
    Button.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
    Button.BorderColor3 = Color3.fromRGB(52, 52, 52)
    Button.BorderSizePixel = 0
    Button.Position = UDim2.new(0.942588627, 0, 0.223685458, 0)
    Button.Size = UDim2.new(0.0358672254, 0, 0.0771396905, 0)
    Button.Font = Enum.Font.FredokaOne
    Button.Text = "T"
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextScaled = true
    Button.TextSize = 33.000
    Button.TextWrapped = true
    Button.Draggable = true
    
    UICorner.Parent = Button
    
    UICorner_2.Parent = Button
    
    Button.MouseButton1Click:connect(function()
        Toggle = not Toggle
    end)
    
    while ChangeUIToggleButton do
        if Toggle then
            Toggle = false
            R3TH:toggle()
        end
        wait()
    end
end

function sendnotification(message)
    if R3THDEVICE == "Mobile" then
        StarterGui:SetCore("SendNotification", {
            Title = "R3TH PRIV";
            Text = message;
            Duration = 7;
        })
    else
        Notification:Notify(
            {Title = "R3TH PRIV", Description = message},
            {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 7, Type = "default"}
        )
    end
end

function startFly()
    FlyInputBegan = UserInputService.InputBegan:connect(function (input, GPE) 
        if GPE then return end
        for i, e in pairs(buttons) do
            if i ~= "Moving" and input.KeyCode == Enum.KeyCode[i] then
                buttons[i] = true
                buttons.Moving = true
            end
        end
    end)
      
    FlyInputEnded = UserInputService.InputEnded:connect(function (input, GPE) 
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

    FlyHeartbeat = RunService.Heartbeat:connect(function (step)
        if flying and Character and Character.PrimaryPart then
            local p = Character.PrimaryPart.Position
            local cf = cam.CFrame
            local ax, ay, az = cf:toEulerAnglesXYZ()
            Character:SetPrimaryPartCFrame(CFrame.new(p.x, p.y, p.z) * CFrame.Angles(ax, ay, az))
            if buttons.Moving then
                local t = Vector3.new()
                if buttons.W then t = t + (setVec(cf.lookVector)) end
                if buttons.S then t = t - (setVec(cf.lookVector)) end
                if buttons.A then t = t - (setVec(cf.rightVector)) end
                if buttons.D then t = t + (setVec(cf.rightVector)) end
                Character:TranslateBy(t * step)
            end
        end
    end)

    if not Character or not Character.Head or flying then return end
    Humanoid.PlatformStand = true
    cam = workspace:WaitForChild('Camera')
    bv = Instance.new("BodyVelocity")
    bav = Instance.new("BodyAngularVelocity")
    bv.Velocity, bv.MaxForce, bv.P = Vector3.new(0, 0, 0), Vector3.new(10000, 10000, 10000), 1000
    bav.AngularVelocity, bav.MaxTorque, bav.P = Vector3.new(0, 0, 0), Vector3.new(10000, 10000, 10000), 1000
    bv.Parent = Character.Head
    bav.Parent = Character.Head
    flying = true
    FlyHumanoidDied = Humanoid.Died:connect(function() flying = false end)
end
  
function endFly()
    if not Character or not flying then return end
    Humanoid.PlatformStand = false
    bv:Destroy()
    bav:Destroy()
    flying = false
    FlyInputBegan:Disconnect()
    FlyInputEnded:Disconnect()
    FlyHeartbeat:Disconnect()
    FlyHumanoidDied:Disconnect()
end

function setVec(vec)
    return vec * (FlySpeedSlider / vec.Magnitude)
end

function SprayPaintOwnedCheck()
    if SprayPaintOwned ~= true then sendnotification("You dont have Spray Paint, You will need it to be able to use this.") return true end
end

function CreateHighlight() -- outdated af will be improved
    for i, v in pairs(Players:GetChildren()) do
        if v ~= LocalPlayer and v.Character and not v.Character:FindFirstChild("Highlight") then
            Instance.new("Highlight", v.Character)
        end
    end
end

function UpdateHighlights()
    for _, v in pairs(Players:GetChildren()) do
        if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Highlight") then
            Highlight = v.Character:FindFirstChild("Highlight")
            if v.Name == Sheriff and IsAlive(v) and sheriffchams == true then
                Highlight.FillColor = Color3.fromRGB(0, 0, 225)
            elseif v.Name == Murder and IsAlive(v) and murdchams == true then
                Highlight.FillColor = Color3.fromRGB(225, 0, 0)
            elseif v.Name == Hero and IsAlive(v) and not IsAlive(game.Players[Sheriff]) and sheriffchams == true then
                Highlight.FillColor = Color3.fromRGB(255, 250, 0)
            else
                Highlight.FillColor = Color3.fromRGB(0, 225, 0)
            end
		end
	end
end	

function IsAlive(Player)
    for i, v in pairs(roles) do
        if Player.Name == i then
            if not v.Killed and not v.Dead then
                return true
            else
                return false
            end
		end
	end
end

function refreshchams()
    for i,v in pairs (workspace:GetDescendants()) do
        if v.Name == "Highlight" then
            v:Destroy()
        end
    end
    roleupdaterfix()
end

function ClearInventory()
    for _, item in ipairs(Backpack:GetChildren()) do
        if not table.find(IgnoreBackpack, item.Name) then
            item:Remove()
        end
    end
    task.wait()
end

function EquipKnife()
    if knifetool then
        knifetool.Parent = Character
    end
end

function EquipSpray()
    ReplicateToy:InvokeServer("SprayPaint")
    task.wait()
    local sprayPaint = Backpack:FindFirstChild("SprayPaint")
    if sprayPaint then
        sprayPaint.Parent = Character
    end
end

function Stab()
    Character.Knife.Stab:FireServer("Down")
end

function SearchforGun()
    GunHolderName = nil
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local Gun = player.Backpack:FindFirstChild("Gun") or player.Character:FindFirstChild("Gun")
            if Gun then
                GunPath = Gun
            end
        end
    end
end

function TeleportPlayer(Position, Offset)
    HumanoidRootPart.CFrame = Position * Offset
end

function dropgun()
    N:SendKeyEvent(true,"Backspace",false,game)
end

if R3THEXECUTOR == "Supported" then
    local mt = getrawmetatable(game)
    local old = {}
    for i, v in pairs(mt) do old[i] = v end
    
    setreadonly(mt, false)

    mt.__namecall = newcclosure(function(...)
        local method = tostring(getnamecallmethod())
        local args = {...}

        if method == 'FireServer' and args[1].Name == 'SayMessageRequest' then 
            if ChangeAlwaysAliveChat then
                args[3] = "Alive"
            end
            return old.__namecall(unpack(args))
        end
        return old.__namecall(...)
    end)
    
    setreadonly(mt, true)
    
    ChangeGunSilentAim = false
    GunAccuracySlider = 25

    local GunHook
    GunHook = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        local args = { ... }
        
        if not checkcaller() and typeof(self) == "Instance" and self.Name == "ShootGun" and method == "InvokeServer" then
            if ChangeGunSilentAim and GunAccuracySlider and Murderer then
                local Root = Players[tostring(Murder)].Character.PrimaryPart
                local Veloc = Root.AssemblyLinearVelocity
                local Pos = Root.Position + (Veloc * Vector3.new(GunAccuracySlider / 200, 0, GunAccuracySlider/ 200))
                args[2] = Pos
            end 
        end
        
        return GunHook(self, unpack(args))
    end)
end

--------------------------------------------------------------------------------------LIST----------------------------------------------------------------------------------------
local IgnoreBackpack = {
    "Emotes", "Knife", "Gun", "Pizza", "ChocolateMilk",
    "IceCream", "Teddy", "FakeBomb", "Fireflies",
    "GGSign", "SprayPaint", "EggToy2023", "BeachBall2023"
}

local BlockList = {
    Stone = {
        Top = 3162897225,
        Bottom = 3162897225,
        Back = 3162897225,
        Front = 3162897225,
        Right = 3162897225,
        Left = 3162897225
    },
    Cobblestone = {
        Top = 12616185407;
        Bottom = 12616185407,
        Back = 12616185407;
        Front = 12616185407;
        Right = 12616185407,
        Left = 12616185407
    };
    OakPlanks = {
        Top = 9359126658;
        Bottom = 9359126658,
        Back = 9359126658;
        Front = 9359126658,
        Right = 9359126658;
        Left = 9359126658
    },
    Grass = {
        Top = 9267183944,
        Bottom = 9267089525;
        Back = 9267155990,
        Front = 9267155990,
        Right = 9267155990,
        Left = 9267155990
    },
    DiamondOre = {
        Top = 11425623081,
        Bottom = 11425623081,
        Back = 11425623081;
        Front = 11425623081,
        Right = 11425623081;
        Left = 11425623081
    },
    Diamond = {
        Top = 4786858334,
        Bottom = 4786858334,
        Back = 4786858334;
        Front = 4786858334;
        Right = 4786858334;
        Left = 4786858334
    },
    Lava = {
        Top = 9886286740,
        Bottom = 9886286740,
        Back = 9886286740;
        Front = 9886286740,
        Right = 9886286740,
        Left = 9886286740
    };
    Glowstone = {
        Top = 17496781833,
        Bottom = 17496781833;
        Back = 17496781833,
        Front = 17496781833;
        Right = 17496781833,
        Left = 17496781833
    },
    Obsidian = {
        Top = 17496795465;
        Bottom = 17496795465,
        Back = 17496795465;
        Front = 17496795465;
        Right = 17496795465,
        Left = 17496795465
    },
    Portal = {
        Top = 17496992747,
        Bottom = 17496992747;
        Back = 17496992747;
        Front = 17496992747,
        Right = 17496992747;
        Left = 17496992747
    }
}

--------------------------------------------------------------------------------------CONNECTION----------------------------------------------------------------------------------------
LocalPlayer.Idled:connect(function()
    if ChangeAntiAFK then
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
end)

local playerlist = {}

table.insert(playerlist,"All")

for i,v in pairs(Players:GetPlayers())do
    if v ~= LocalPlayer then
        table.insert(playerlist,v.Name)
    end
end

Players.PlayerAdded:Connect(function(Value)
    table.insert(playerlist,Value.Name)
    if antijoinloop then table.insert(antijoinlist,Value.Name) end
end)

Players.PlayerRemoving:Connect(function(Value)
    for i,v in pairs(playerlist)do
        if v == Value.Name then  
            table.remove(playerlist,i)
            if antijoinloop then table.remove(antijoinlist,i) end
        end
    end
end)

LocalPlayer.CharacterAdded:Connect(function(newCharacter)
    Character = newCharacter
    Humanoid = Character:WaitForChild("Humanoid")
    HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
end)

--------------------------------------------------------------------------------------KEYBINDS----------------------------------------------------------------------------------------
function WalkSpeedFunction()
    while ChangeWalkSpeed and task.wait() do
        if ChangeWalkSpeed then
            Humanoid.WalkSpeed = WalkSpeedSlider
        else
            Humanoid.WalkSpeed = 16
        end
    end
end

function JumpPowerFunction()
    while ChangeJumpPower and task.wait() do
        if ChangeJumpPower then
            Humanoid.JumpPower = JumpPowerSlider
        else
            Humanoid.JumpPower = 50
        end
    end
end

function FlyFunction()
    if ChangeFly then
        startFly()
    else
        endFly()
    end
end

function NoclipFunction()
    while ChangeNoclip do
        for a, b in pairs(Workspace:GetChildren()) do
            if b.Name == LocalPlayer.Name then
                for i, v in pairs(Workspace[LocalPlayer.Name]:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = not ChangeNoclip
                    end
                end 
            end 
        end
        wait()
    end
end

function XrayFunction()
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
            if ChangeXray then
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
end

function FlingFunction()
    while ChangeFling do
        function ChangeFlingFix()
    
            local Targets = {ChangeFlingTarget}
    
            local AllBool = false
    
            local GetPlayer = function(Name)
                Name = Name:lower()
                if Name == "all" or Name == "others" then
                    AllBool = true
                    return
                elseif Name == "random" then
                    local GetPlayers = Players:GetPlayers()
                    if table.find(GetPlayers,LocalPlayer) then table.remove(GetPlayers,table.find(GetPlayers,LocalPlayer)) end
                    return GetPlayers[math.random(#GetPlayers)]
                elseif Name ~= "random" and Name ~= "all" and Name ~= "others" then
                    for _,x in next, Players:GetPlayers() do
                        if x ~= LocalPlayer then
                            if x.Name:lower():match("^"..Name) then
                                return x;
                            elseif x.DisplayName:lower():match("^"..Name) then
                                return x;
                            end
                        end
                    end
                else
                    return
                end
            end

            local SkidFling = function(TargetPlayer)
                local RootPart = Humanoid and Humanoid.RootPart
    
                local TCharacter = TargetPlayer.Character
                local THumanoid
                local TRootPart
                local THead
                local Accessory
                local Handle
    
                if TCharacter:FindFirstChildOfClass("Humanoid") then
                    THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
                end
                if THumanoid and THumanoid.RootPart then
                    TRootPart = THumanoid.RootPart
                end
                if TCharacter:FindFirstChild("Head") then
                    THead = TCharacter.Head
                end
                if TCharacter:FindFirstChildOfClass("Accessory") then
                    Accessory = TCharacter:FindFirstChildOfClass("Accessory")
                end
                if Accessory and Accessory:FindFirstChild("Handle") then
                    Handle = Accessory.Handle
                end
    
                if Character and Humanoid and RootPart then
                    if RootPart.Velocity.Magnitude < 50 then
                        OldPos = RootPart.CFrame
                    end
                    if THumanoid and THumanoid.Sit and not AllBool then
                        return sendnotification("Error Occurred: Targeting is sitting")
                    end
                    if THead then
                        workspace.CurrentCamera.CameraSubject = THead
                    elseif not THead and Handle then
                        workspace.CurrentCamera.CameraSubject = Handle
                    elseif THumanoid and TRootPart then
                        workspace.CurrentCamera.CameraSubject = THumanoid
                    end
                    if not TCharacter:FindFirstChildWhichIsA("BasePart") then
                        return
                    end
    
                    local FPos = function(BasePart, Pos, Ang)
                        RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
                        Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
                        RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
                        RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
                    end
    
                    local SFBasePart = function(BasePart)
                        local TimeToWait = 2
                        local Time = tick()
                        local Angle = 0
    
                        repeat
                            if ChangeFling == false then break end
                            if RootPart and THumanoid then
                                if BasePart.Velocity.Magnitude < 50 then
                                    Angle = Angle + 100
    
                                    FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle),0 ,0))
                                    task.wait()
    
                                    FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                                    task.wait()
    
                                    FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                                    task.wait()
    
                                    FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                                    task.wait()
    
                                    FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                                    task.wait()
    
                                    FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                                    task.wait()
                                else
                                    FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                                    task.wait()
    
                                    FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
                                    task.wait()
    
                                    FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                                    task.wait()
                                    
                                    FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                                    task.wait()
    
                                    FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
                                    task.wait()
    
                                    FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                                    task.wait()
    
                                    FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                                    task.wait()
    
                                    FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                                    task.wait()
    
                                    FPos(BasePart, CFrame.new(0, -1.5 ,0), CFrame.Angles(math.rad(-90), 0, 0))
                                    task.wait()
    
                                    FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                                    task.wait()
                                end
                            else
                                break
                            end
                        until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
                    end
    
                    workspace.FallenPartsDestroyHeight = 0/0
    
                    local BV = Instance.new("BodyVelocity")
                    BV.Name = "EpixVel"
                    BV.Parent = RootPart
                    BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
                    BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)
    
                    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
    
                    if TRootPart and THead then
                        if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
                            SFBasePart(THead)
                        else
                            SFBasePart(TRootPart)
                        end
                    elseif TRootPart and not THead then
                        SFBasePart(TRootPart)
                    elseif not TRootPart and THead then
                        SFBasePart(THead)
                    elseif not TRootPart and not THead and Accessory and Handle then
                        SFBasePart(Handle)
                    else
                        return sendnotification("Error Occurred: Target is missing everything")
                    end
    
                    BV:Destroy()
                    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                    workspace.CurrentCamera.CameraSubject = Humanoid
    
                    repeat
                        RootPart.CFrame = OldPos * CFrame.new(0, .5, 0)
                        Character:SetPrimaryPartCFrame(OldPos * CFrame.new(0, .5, 0))
                        Humanoid:ChangeState("GettingUp")
                        table.foreach(Character:GetChildren(), function(_, x)
                            if x:IsA("BasePart") then
                                x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
                            end
                        end)
                        task.wait()
                    until (RootPart.Position - OldPos.p).Magnitude < 25
                    workspace.FallenPartsDestroyHeight = FPDH
                else
                    return sendnotification("Error Occurred: Random error")
                end
            end
    
            if Targets[1] then for _,x in next, Targets do GetPlayer(x) end else return end
    
            if AllBool then
                for _,x in next, Players:GetPlayers() do
                    SkidFling(x)
                end
            end
    
            for _,x in next, Targets do
                if GetPlayer(x) and GetPlayer(x) ~= LocalPlayer then
                    local TPlayer = GetPlayer(x)
                    if TPlayer then
                        SkidFling(TPlayer)
                    end
                elseif not GetPlayer(x) and not AllBool then
                    sendnotification("Error Occurred: Username Invalid")
                end
            end
            task.wait()
        end
        wait()
        pcall(ChangeFlingFix)
    end    
end

--------------------------------------------------------------------------------------UNIVERSAL----------------------------------------------------------------------------------------
if R3THDEVICE == "Mobile" then
    Player:addTextbox("Walkspeed", DefaultWalkSpeed, function(Value, focusLost)
        WalkSpeedSlider = Value
        if ChangeWalkSpeed then
            Humanoid.WalkSpeed = WalkSpeedSlider
        end
    end)
else
    Player:addSlider("Walkspeed", DefaultWalkSpeed, 0, 200, function(Value)
        WalkSpeedSlider = Value
        if ChangeWalkSpeed then
            Humanoid.WalkSpeed = WalkSpeedSlider
        end
    end)
end

if R3THDEVICE == "Mobile" then
    Player:addTextbox("Jumppower", DefaultJumpPower, function(Value, focusLost)
        JumpPowerSlider = Value
        if ChangeJumpPower then
            Humanoid.WalkSpeed = JumpPowerSlider
        end
    end)
else
    Player:addSlider("Jumppower", DefaultJumpPower, 0, 500, function(Value)
        JumpPowerSlider = Value
        if ChangeJumpPower then
            Humanoid.WalkSpeed = JumpPowerSlider
        end
    end)
end

Player:addToggle("Enable WalkSpeed", false, function(Value)
    ChangeWalkSpeed = Value
    WalkSpeedFunction()
end)

Player:addToggle("Enable JumpPower", false, function(Value)
    ChangeJumpPower = Value
    JumpPowerFunction()
end)

if R3THDEVICE == "Mobile" then
    Player:addTextbox("Fly Speed", 50, function(Value, focusLost)
        FlySpeedSlider = Value
    end)
else
    Player:addSlider("Fly Speed", 50, 0, 500, function(Value)
        FlySpeedSlider = Value
    end)
end

Player:addToggle("Enable Fly", false, function(Value)
    ChangeFly = Value
    FlyFunction()
end)

Player:addButton("Mobile Fly", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV-V2/main/OtherScripts/Mobile%20Fly.lua'))()
end)

Player:addToggle("Noclip", false, function(Value)
    ChangeNoclip = Value
    NoclipFunction()
end)

Player:addToggle("Xray", false, function(Value)
    ChangeXray = Value
    XrayFunction()
end)

Player:addButton("Open Console", function()
    StarterGui:SetCore("DevConsoleVisible", true)
end)

Player:addButton("Respawn", function()
    Humanoid.Health = 0
end)

Player:addToggle("Enable Reset", false, function(Value)
    StarterGui:SetCore("ResetButtonCallback", Value)
end)

if R3THDEVICE == "Mobile" then
    Player:addTextbox("FOV", 70, function(FOV, focusLost)
        Workspace.Camera.FieldOfView = FOV
    end)
else
    Player:addSlider("FOV", 70, 0, 120, function(FOV)
        Workspace.Camera.FieldOfView = FOV
    end)
end

ESP:addToggle("Enable ESP", false, function(Value)
    if EnableESPFirst ~= true then -- Improves performance if you're not using ESP.
        EnableESPFirst = true
        ESPP = loadstring(game:HttpGet('https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV-V2/main/OtherScripts/ESP.lua'))()
        ESPP.BoxType = "Corner Box Esp"
    end
    ESPP.Enabled = Value
end)

ESP:addToggle("Team Check", false, function(Value)
    ESPP.Teamcheck = Value
end)

ESP:addToggle("Wall Check", false, function(Value)
    ESPP.WallCheck = Value
end)

ESP:addToggle("Boxes", false, function(Value)
    ESPP.ShowBox = Value
end)

ESP:addToggle("Names", false, function(Value)
    ESPP.ShowName = Value
end)

ESP:addToggle("Tracers", false, function(Value)
    ESPP.ShowTracer = Value
end)

ESP:addToggle("Distance", false, function(Value)
    ESPP.ShowDistance = Value
end)

ESP:addToggle("Health", false, function(Value)
    ESPP.ShowHealth = Value
end)

Target:addDropdown("Select Player", playerlist, function(Value)
    ChangeFlingTarget = Value
end)

Target:addToggle("Fling", false, function(Value)
    ChangeFling = Value
    FlingFunction()
end)

Server:addToggle("RTX Shaders", false, function(Value)
    if Value then
        local Bloom = Instance.new("BloomEffect")
        Bloom.Name = "Bloom (RTX Shaders)"
        Bloom.Intensity = 0.1
        Bloom.Threshold = 0
        Bloom.Size = 100
        
        local Tropic = Instance.new("Sky")
        Tropic.Name = "Tropic (RTX Shaders)"
        Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
        Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
        Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
        Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
        Tropic.StarCount = 100
        Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
        Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
        Tropic.Parent = Bloom
        
        local Sky = Instance.new("Sky")
        Sky.Name = "Sky (RTX Shaders)"
        Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
        Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
        Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
        Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
        Sky.CelestialBodiesShown = false
        Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
        Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
        Sky.Parent = Bloom
        
        Bloom.Parent = Lighting
        
        local Bloom = Instance.new("BloomEffect")
        Bloom.Name = "Bloom (RTX Shaders)"
        Bloom.Enabled = false
        Bloom.Intensity = 0.35
        Bloom.Threshold = 0.2
        Bloom.Size = 56
        
        local Tropic = Instance.new("Sky")
        Tropic.Name = "Tropic (RTX Shaders)"
        Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
        Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
        Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
        Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
        Tropic.StarCount = 100
        Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
        Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
        Tropic.Parent = Bloom
        
        local Sky = Instance.new("Sky")
        Sky.Name = "Sky (RTX Shaders)"
        Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
        Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
        Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
        Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
        Sky.CelestialBodiesShown = false
        Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
        Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
        Sky.Parent = Bloom

        Bloom.Parent = Lighting

        local Blur = Instance.new("BlurEffect")
        Blur.Name = "Bloom (RTX Shaders)"
        Blur.Size = 2
        Blur.Parent = Lighting

        local Efecto = Instance.new("BlurEffect")
        Efecto.Name = "Bloom (RTX Shaders)"
        Efecto.Enabled = false
        Efecto.Size = 2
        Efecto.Parent = Lighting

        local Inaritaisha = Instance.new("ColorCorrectionEffect")
        Inaritaisha.Name = "Inari taisha (RTX Shaders)"
        Inaritaisha.Saturation = 0.05
        Inaritaisha.TintColor = Color3.fromRGB(255, 224, 219)
        Inaritaisha.Parent = Lighting

        local Normal = Instance.new("ColorCorrectionEffect")
        Normal.Name = "Normal (RTX Shaders)"
        Normal.Enabled = false
        Normal.Saturation = -0.2
        Normal.TintColor = Color3.fromRGB(255, 232, 215)
        Normal.Parent = Lighting

        local SunRays = Instance.new("SunRaysEffect")
        SunRays.Name = "SunRays (RTX Shaders)"
        SunRays.Intensity = 0.05
        SunRays.Parent = Lighting

        local Sunset = Instance.new("Sky")
        Sunset.Name = "Sunset (RTX Shaders)"
        Sunset.SkyboxUp = "rbxassetid://323493360"
        Sunset.SkyboxLf = "rbxassetid://323494252"
        Sunset.SkyboxBk = "rbxassetid://323494035"
        Sunset.SkyboxFt = "rbxassetid://323494130"
        Sunset.SkyboxDn = "rbxassetid://323494368"
        Sunset.SunAngularSize = 14
        Sunset.SkyboxRt = "rbxassetid://323494067"
        Sunset.Parent = Lighting

        local Takayama = Instance.new("ColorCorrectionEffect")
        Takayama.Name = "Takayama (RTX Shaders)"
        Takayama.Enabled = false
        Takayama.Saturation = -0.3
        Takayama.Contrast = 0.1
        Takayama.TintColor = Color3.fromRGB(235, 214, 204)
        Takayama.Parent = Lighting

        OldBrightness = Lighting.Brightness
        OldColorShiftBottom = Lighting.ColorShift_Bottom
        OldColorShiftTop = Lighting.ColorShift_Top
        OldOutdoorAmbient = Lighting.OutdoorAmbient
        OldClockTime = Lighting.ClockTime
        OldFogColor = Lighting.FogColor
        OldFogEnd = Lighting.FogEnd
        OldFogStart = Lighting.FogStart
        OldExposureCompensation = Lighting.ExposureCompensation
        OldShadowSoftness = Lighting.ShadowSoftness
        OldAmbient = Lighting.Ambient

        Lighting.Brightness = 2.14
        Lighting.ColorShift_Bottom = Color3.fromRGB(11, 0, 20)
        Lighting.ColorShift_Top = Color3.fromRGB(240, 127, 14)
        Lighting.OutdoorAmbient = Color3.fromRGB(34, 0, 49)
        Lighting.ClockTime = 6.7
        Lighting.FogColor = Color3.fromRGB(94, 76, 106)
        Lighting.FogEnd = 1000
        Lighting.FogStart = 0
        Lighting.ExposureCompensation = 0.24
        Lighting.ShadowSoftness = 0
        Lighting.Ambient = Color3.fromRGB(59, 33, 27)
    else
        for i, Child in pairs(Lighting:GetChildren()) do
            if Child.Name == "Sunset (RTX Shaders)" then
                Child:Destroy()
            elseif Child.Name == "Bloom (RTX Shaders)" then
                Child:Destroy()
            elseif Child.Name == "Inari taisha (RTX Shaders)" then
                Child:Destroy()
            elseif Child.Name == "Normal (RTX Shaders)" then
                Child:Destroy()
            elseif Child.Name == "SunRays (RTX Shaders)" then
                Child:Destroy()
            elseif Child.Name == "Takayama (RTX Shaders)" then
                Child:Destroy()
            end
        end
        
        Lighting.Brightness = OldBrightness
        Lighting.ColorShift_Bottom = OldColorShiftBottom
        Lighting.ColorShift_Top = OldColorShiftTop
        Lighting.OutdoorAmbient = OldOutdoorAmbient
        Lighting.ClockTime = OldClockTime
        Lighting.FogColor = OldFogColor
        Lighting.FogEnd = OldFogEnd
        Lighting.FogStart = OldFogStart
        Lighting.ExposureCompensation = OldExposureCompensation
        Lighting.ShadowSoftness = OldShadowSoftness
        Lighting.Ambient = OldAmbient
    end
end)

Server:addButton("Rejoin", function()
    TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
end)

Server:addButton("Serverhop", function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/OtherScripts/Serverhop.lua'),true))()
end)

--------------------------------------------------------------------------------------COMBAT----------------------------------------------------------------------------------------
Murderer:addToggle("Auto Kill All", false, function(Value)
    ChangeAutoKillAll = Value
    while ChangeAutoKillAll do
        EquipKnife()
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart then
                    Stab()
                    firetouchinterest(humanoidRootPart, knifetool.Handle, 1)
                    firetouchinterest(humanoidRootPart, knifetool.Handle, 0)
                end
            end
        end
        wait()
    end
end)

Murderer:addToggle("Knife Aura", false, function(Value)
    ChangeKnifeAura = Value
    while ChangeKnifeAura do
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and LocalPlayer:DistanceFromCharacter(player.Character.HumanoidRootPart.Position) < KnifeAuraSlider then
                EquipKnife()
                wait()
                local knife = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Knife")
                wait()
                local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart then
                    Stab()
                    firetouchinterest(humanoidRootPart, knife.Handle, 1)
                    firetouchinterest(humanoidRootPart, knife.Handle, 0)
                end
            end
        end
        wait()
    end
end)

if R3THDEVICE == "Mobile" then
    Murderer:addTextbox("Knife Range", 20, function(Value, focusLost)
        KnifeAuraSlider = Value
    end)
else
    Murderer:addSlider("Knife Range", 20, 5, 100, function(Value)
        KnifeAuraSlider = Value
    end)
end

Sheriff:addToggle("Gun Silent Aim", false, function(Value)
    ChangeGunSilentAim = Value
end)

if R3THDEVICE == "Mobile" then
    Sheriff:addTextbox("Aim Accuracy 0 - 100", 25, function(Value, focusLost)
       GunAccuracySlider = Value
    end)
else
    Sheriff:addSlider("Aim Accuracy", 25, 0, 100, function(Value)
        GunAccuracySlider = Value
    end)
end

Innocent:addDropdown("Play Dead", {"Lay On Back", "Sit Down"}, function(Value)
    if Value == "Lay On Back" then
        Humanoid.Sit = true
        task.wait(.1)
        Humanoid.RootPart.CFrame = Humanoid.RootPart.CFrame * CFrame.Angles(math.pi * .5, 0, 0)
        for _, v in ipairs(Humanoid:GetPlayingAnimationTracks()) do
            v:Stop()
        end
        wait()
    elseif Value == "Sit Down" then
        Humanoid.Sit = true
    end
end)

--------------------------------------------------------------------------------------MAIN----------------------------------------------------------------------------------------
Teleports:addButton("Teleport to Lobby", function()
    TeleportPlayer(CFrame.new(-109, 138, 9), CFrame.new(0,0,0))
end)

Teleports:addButton("Teleport to Voting Room ", function()
    TeleportPlayer(CFrame.new(-109, 140, 82), CFrame.new(0,0,0))
end)

Teleports:addButton("Teleport to Map", function()
    for i,v in pairs (workspace:GetDescendants()) do
        if v.Name == "Spawn" then
            TeleportPlayer(CFrame.new(v.Position), CFrame.new(0,2.5,0))
        elseif v.Name == "PlayerSpawn" then
            TeleportPlayer(CFrame.new(v.Position), CFrame.new(0,2.5,0))
        end
    end
end)

Teleports:addButton("Teleport Above Map", function()
    for i,v in pairs (workspace:GetDescendants()) do
        if v.Name == "Spawn" then
            TeleportPlayer(CFrame.new(v.Position), CFrame.new(0,100,0))
        elseif v.Name == "PlayerSpawn" then
            TeleportPlayer(CFrame.new(v.Position), CFrame.new(0,100,0))
        end
    end
end)

Teleports:addButton("Teleport To Murderer", function()
    TeleportPlayer(CFrame.new(Players:FindFirstChild(Murder).Character:WaitForChild("HumanoidRootPart").Position), CFrame.new(0,0,0))
end)

Teleports:addButton("Teleport To Sheriff", function()
    TeleportPlayer(CFrame.new(Players:FindFirstChild(Sheriff).Character:WaitForChild("HumanoidRootPart").Position), CFrame.new(0,0,0))

end)

Teleports:addDropdown("Teleport to Player", playerlist, function(Value)
    if Value ~= "All" then
        TeleportPlayer(CFrame.new(Players:FindFirstChild(Value).Character:WaitForChild("HumanoidRootPart").Position), CFrame.new(0,0,0))
    end
end)

Chams:addToggle("Player Chams", false, function(playerchams)
    playerchamsloop = playerchams
    while playerchamsloop do
        function playerchamsloopfix()
        CreateHighlight()
        UpdateHighlights()
        wait(1)
    end
    wait()
    pcall(playerchamsloopfix)
    end
    refreshchams()
end)

Chams:addToggle("Murderer Cham", false, function(Value)
    ChangeMurdererCham = Value
end)

Chams:addToggle("Sheriff Cham", false, function(Value)
    ChangeSheriffCham = Value
end)

Main:addButton("Expose Roles", function()
    SayMessageRequest:FireServer("Murderer Is: " .. Murder, "normalchat")
    SayMessageRequest:FireServer("Sheriff Is: " .. Sheriff, "normalchat")
end)

Main:addButton("Fake Gun", function()
    Gameplay.FakeGun:FireServer(true)
end)

Main:addToggle("Auto Break Gun", false, function(Value)
    ChangeAutoBreakGun = Value
    while ChangeAutoBreakGun do
        function BreakGunIgnore()
        SearchforGun()
        task.wait()
        if GunPath ~= nil then
            GunPath.KnifeServer.ShootGun:InvokeServer(1, 0, "AH")
        end
    end
    wait()
    pcall(BreakGunIgnore)
    end
end)

Misc:addButton("Audio Logger", function()
    loadstring(game:HttpGet('https://pastebin.com/raw/v7Usg709', true))()
end)

Misc:addDropdown("View Player", playerlist, function(Value)
    if Value ~= "All" then
        Workspace.Camera.CameraSubject = Players[Value].Character:WaitForChild("Humanoid")
    end
end)

Misc:addButton("Stop Viewing", function()
    Workspace.Camera.CameraSubject = Humanoid
end)

--------------------------------------------------------------------------------------TOGGLES----------------------------------------------------------------------------------------
World:addToggle("Loop Interactive", false, function(Value)
    loopinteractiveloop = Value
    while loopinteractiveloop do
        function loopinteractiveloopfix()
        if workspace:FindFirstChild("Bank2") then
            workspace.Bank2.Interactive.VaultSystem.InteractiveBox.Interact:FireServer()
        else
            if workspace:FindFirstChild("Factory") then
                workspace.Factory.LorryDoor.InteractiveBox.Interact:FireServer()
            else
                if workspace:FindFirstChild("MilBase") then
                    workspace.MilBase.Door.InteractiveBox.Interact:FireServer()
                else
                    if workspace:FindFirstChild("ResearchFacility") then
                        workspace.ResearchFacility.Interactive.ScanSystem.Scanner.InteractiveBox.Interact:FireServer()
                        workspace.ResearchFacility.Interactive.SirenSystem.InteractiveBox.Interact:FireServer()
                        workspace.ResearchFacility.Interactive.CloningSystem.InteractiveBox.Interact:FireServer()
                        workspace.ResearchFacility.Interactive.GarageSystem.InteractiveBox.Interact:FireServer()
                    end
                end
            end
        end
        wait()
    end
    wait()
    pcall(loopinteractiveloopfix)
    end
end)

World:addToggle("Always Alive Chat", false, function(Value)
    ChangeAlwaysAliveChat = Value
end)

Visual:addToggle("Infinite Ghost", false, function(Value)
    Gameplay.Stealth:FireServer(Value)
end)

Visual:addToggle("Sprint Trail", false, function(Value)
    Workspace[LocalPlayer.Name].SpeedTrail.Toggle:FireServer(Value)
end)

Visual:addToggle("Improve FPS", false, function(Value)
    ChangeImproveFPS = Value
    while ChangeImproveFPS do
        for i,v in pairs (Workspace:GetDescendants()) do
            if v.Name == "Pet" then
                v:Destroy()
            elseif v.Name == "KnifeDisplay" then
                v:Destroy()
            elseif v.Name == "GunDisplay" then
                v:Destroy()
            end
        end
        wait(10)
    end
end)

Visual:addToggle("Delete All Decals", false, function(Value)
    ChangeDeleteAllDecals = Value
end)

ChromaGuns:addToggle("Loop Drop Guns", false, function(Value)
    ChangeLoopDropGuns = Value
    while ChangeLoopDropGuns do
        if Humanoid then
            Gameplay.FakeGun:FireServer(true)
            dropgun()
            task.wait()
        end
    end
end)

ChromaGuns:addToggle("Pickup All Guns", false, function(Value)
    ChangePickupAllGuns = Value
    while ChangePickupAllGuns do
        for _,v in pairs(Workspace:GetDescendants()) do
            if v:IsA("TouchTransmitter") then
                firetouchinterest(HumanoidRootPart, v.Parent, 0)
                task.wait()
                firetouchinterest(HumanoidRootPart, v.Parent, 1)
            end
            wait()
        end
        wait()
    end
end)

ChromaGuns:addButton("Delete All Guns From Backpack", function()
    ClearInventory()
end)

ChromaGuns:addButton("Delete All Guns [CLIENT SIDE]", function()
    for i,v in pairs(Workspace:getDescendants()) do
        if v:IsA('Tool') then
            v:Destroy()
        end
    end
end)

Trading:addToggle("Hide Trade UI", false, function(Value)
    ChangeHideTradeUI = Value
    while ChangeHideTradeUI do
        local gui = LocalPlayer.PlayerGui:FindFirstChild("TradeGUI")
        if gui then
            gui.Enabled = false
            local frame = gui:FindFirstChild("Container")
            if frame then
                frame.Visible = false
            end
        end
        wait()
    end
end)

Trading:addToggle("Auto Accept Trade", false, function(Value)
    ChangeAutoAcceptTrade = Value
    while ChangeAutoAcceptTrade do
        ReplicatedStorage.Trade.AcceptTrade:FireServer()
    end
end)

Traps:addKeybind("Place Trap", KeyCode, function()
    ReplicatedStorage:WaitForChild("TrapSystem"):WaitForChild("PlaceTrap"):InvokeServer(CFrame.new(Character.Head.Position.X, Character.Head.Position.Y, Character.Head.Position.Z))
end, function()
	print("[ R3TH PRIV ] Place Trap keybind changed.")
end)

Traps:addToggle("Anti Trap", false, function(Value)
    ChangeAntiTrap = Value
    while ChangeAntiTrap do -- will be better when i remake it
        function ChangeAntiTrapFix()
        if Humanoid.WalkSpeed == 0.009999999776482582 then
            Humanoid.WalkSpeed = 16
        end
        wait()
    end
    wait()
    pcall(ChangeAntiTrapFix)
    end
end)

--------------------------------------------------------------------------------------SPRAYPAINT----------------------------------------------------------------------------------------
LoopTarget:addDropdown("Select Player", playerlist, function(Value)
    ChangeLoopTarget = Value
end)

function UseSpray(Target, SprayId, Side, Size, Part, Position, Offset, Repeat)
    if SprayPaintOwnedCheck() == true then return end
    if Target == "All" then
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                for i = 1, Repeat do
                    local targetCharacter = player.Character
                    if targetCharacter then
                        local part = targetCharacter:FindFirstChild(Part)
                        if part then
                            Character.SprayPaint.Remote:FireServer(SprayId, Enum.NormalId[Side], Size, part, Position * Offset)
                        end
                    end
                end
            end
            wait()
        end
    else
        for i = 1, Repeat do
            local targetPlayer = Players:FindFirstChild(Target)
            if targetPlayer then
                local targetCharacter = targetPlayer.Character
                if targetCharacter then
                    local part = targetCharacter:FindFirstChild(Part)
                    if part then
                        Character.SprayPaint.Remote:FireServer(SprayId, Enum.NormalId[Side], Size, part, Position * Offset)
                    end
                end
            end
            wait()
        end
    end
end

LoopTarget:addToggle("Loop Reset", false, function(Value)
    ChangeLoopResetPlayer = Value
    while ChangeLoopResetPlayer and task.wait() do
        function ChangeLoopResetPlayerFix() -- I will change this just not enough time right now
        UseSpray(ChangeLoopTarget, 0, "Top", 2048, "HumanoidRootPart", CFrame.new(8999999488, -8999999488, 8999999488), CFrame.Angles(0, 0, 0), 1)
    end
    wait()
    pcall(ChangeLoopResetPlayer)
   end
end)

LoopTarget:addToggle("Loop Void", false, function(Value)
    ChangeLoopVoidPlayer = Value
    while ChangeLoopVoidPlayer and task.wait() do
        function ChangeLoopVoidPlayerFix()
        UseSpray(ChangeLoopTarget, 0, "Top", 2048, "HumanoidRootPart", CFrame.new(8999999488, 8999999488, 8999999488), CFrame.Angles(-0, 0, -0), 1)
    end
    wait()
    pcall(ChangeLoopVoidPlayerFix)
    end
end)

LoopTarget:addToggle("Give Noclip", false, function(Value)
    ChangeLoopVoidPlayer = Value
    while ChangeLoopVoidPlayer and task.wait() do
        function ChangeLoopVoidPlayerFix()
        UseSpray(ChangeLoopTarget, 1, "Front", 2048, "HumanoidRootPart", CFrame.new(0, -25000, 0), CFrame.Angles(0, 0, 0), 1)
        UseSpray(ChangeLoopTarget, 1, "Front", 2048, "HumanoidRootPart", CFrame.new(0, 25000, 0), CFrame.Angles(0, 0, 0), 1)
        wait(12)
    end
    wait()
    pcall(ChangeLoopVoidPlayerFix)
    end
end)

LoopTarget:addToggle("Freeze", false, function(Value)
    ChangeLoopVoidPlayer = Value
    while ChangeLoopVoidPlayer and task.wait() do
        function ChangeLoopVoidPlayerFix()
        UseSpray(ChangeLoopTarget, 0, "Top", 2048, "LeftLowerArm", HumanoidRootPart.CFrame, CFrame.Angles(0, 0, 0), 30)
        wait(12)
    end
    wait()
    pcall(ChangeLoopVoidPlayerFix)
    end
end)

LoopTarget:addToggle("Glitch", false, function(Value)
    ChangeLoopVoidPlayer = Value
    while ChangeLoopVoidPlayer and task.wait() do
        function ChangeLoopVoidPlayerFix()
        UseSpray(ChangeLoopTarget, 0, "Right", 10, "HumanoidRootPart", HumanoidRootPart.CFrame, CFrame.Angles(0, 0, 0), 1)
        wait(12)
    end
    wait()
    pcall(ChangeLoopVoidPlayerFix)
    end
end)

LoopTarget:addToggle("Loop Trap Player", false, function(Value)
    ChangeLoopTrapPlayer = Value
    while ChangeLoopTrapPlayer do
        function ChangeLoopTrapPlayerFix()
        if ChangeLoopTarget == "All" then
            for i,v in pairs(Players:GetChildren()) do
                if v ~= LocalPlayer then
                    local Target = Players:FindFirstChild(v.Name)
                    ReplicatedStorage:WaitForChild("TrapSystem"):WaitForChild("PlaceTrap"):InvokeServer(CFrame.new(Target.Character.HumanoidRootPart.Position))
                end
                wait()
            end
        else
            Target = players:FindFirstChild(ChangeLoopTarget)
            ReplicatedStorage:WaitForChild("TrapSystem"):WaitForChild("PlaceTrap"):InvokeServer(CFrame.new(Target.Character.HumanoidRootPart.Position))
        end
    end
    wait()
    pcall(ChangeLoopTrapPlayerFix)
    end
end)

LoopTarget:addToggle("Rain Guns On Player", false, function(raingunsplayer) -- havent updated this messy shit yet
    raingunsplayerloop = raingunsplayer
    while raingunsplayerloop do
        function raingunsplayerloopfix()
        if targetUsername == "All" then
            for i,v in pairs(game.Players:GetChildren()) do
                function loopraingunsallloopfix()
                if v.Name ~= LocalPlayer.Name then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,8)
                    game:GetService("ReplicatedStorage").Remotes.Gameplay.FakeGun:FireServer(true)
                    dropgun()
                    wait()
                    clearbackpackguns()
                    wait()
                end
            end
            wait()
            pcall(loopraingunsallloopfix)
            end
        else
            targetPlayer = players:FindFirstChild(targetUsername)
            LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,8)
            game:GetService("ReplicatedStorage").Remotes.Gameplay.FakeGun:FireServer(true)
            dropgun()
            wait()
            clearbackpackguns()
            wait()
        end 
    end
    wait()
    pcall(raingunsplayerloopfix)
    end
end)

LoopTarget:addToggle("Auto Equip Spray Paint", false, function(Value)
    if SprayPaintOwnedCheck() == true then return end
    ChangeAutoEquipSprayPaint = Value
    while ChangeAutoEquipSprayPaint do
        function ChangeAutoEquipSprayPaintFix()
        ReplicateToy:InvokeServer("SprayPaint")
        for _,v in next, Backpack:GetChildren() do
            if v.Name == "SprayPaint" then
                local equip = Backpack.SprayPaint
                equip.Parent = Character
            end
        end
    end
    wait()
    pcall(ChangeAutoEquipSprayPaintFix)
    end
end)

FE:addDropdown("Select Player", playerlist, function(fetarget)
    fetargetname = fetarget
end)

function fepenisfunc()
    -- Top Penis
    game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(12976059241, Enum.NormalId.Top, 0.5, (fepenistarget.Character.HumanoidRootPart), fepenistarget.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1,-0.7))
    game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(12976059241, Enum.NormalId.Top, 0.5, (fepenistarget.Character.HumanoidRootPart), fepenistarget.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1,-1))
    game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(12976059241, Enum.NormalId.Top, 0.5, (fepenistarget.Character.HumanoidRootPart), fepenistarget.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1,-1.5))
    game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(12976059241, Enum.NormalId.Top, 0.5, (fepenistarget.Character.HumanoidRootPart), fepenistarget.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1,-2))
    game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(13850207336, Enum.NormalId.Top, 0.5, (fepenistarget.Character.HumanoidRootPart), fepenistarget.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1,-2.5))
    
    ----Bottom Penis
    game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(12976059241, Enum.NormalId.Bottom, 0.5, (fepenistarget.Character.HumanoidRootPart), fepenistarget.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1.3,-0.5))
    game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(12976059241, Enum.NormalId.Bottom, 0.5, (fepenistarget.Character.HumanoidRootPart), fepenistarget.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1.3,-1))
    game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(12976059241, Enum.NormalId.Bottom, 0.5, (fepenistarget.Character.HumanoidRootPart), fepenistarget.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1.3,-1.5))
    game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(12976059241, Enum.NormalId.Bottom, 0.5, (fepenistarget.Character.HumanoidRootPart), fepenistarget.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1.3,-2))
    game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(13850207336, Enum.NormalId.Bottom, 0.5, (fepenistarget.Character.HumanoidRootPart), fepenistarget.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1.3,-2.5))

    -- Left Penis
    game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(12976059241, Enum.NormalId.Left, 0.5, (fepenistarget.Character.HumanoidRootPart), fepenistarget.Character.HumanoidRootPart.CFrame * CFrame.new(-0.15,-1.15,-0.5))
    game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(12976059241, Enum.NormalId.Left, 0.5, (fepenistarget.Character.HumanoidRootPart), fepenistarget.Character.HumanoidRootPart.CFrame * CFrame.new(-0.15,-1.15,-1))
    game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(12976059241, Enum.NormalId.Left, 0.5, (fepenistarget.Character.HumanoidRootPart), fepenistarget.Character.HumanoidRootPart.CFrame * CFrame.new(-0.15,-1.15,-1.5))
    game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(12976059241, Enum.NormalId.Left, 0.5, (fepenistarget.Character.HumanoidRootPart), fepenistarget.Character.HumanoidRootPart.CFrame * CFrame.new(-0.15,-1.15,-2))
    game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(13850207336, Enum.NormalId.Left, 0.5, (fepenistarget.Character.HumanoidRootPart), fepenistarget.Character.HumanoidRootPart.CFrame * CFrame.new(-0.15,-1.15,-2.5))

    -- Right Penis
    game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(12976059241, Enum.NormalId.Right, 0.5, (fepenistarget.Character.HumanoidRootPart), fepenistarget.Character.HumanoidRootPart.CFrame * CFrame.new(0.15,-1.15,-0.5))
    game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(12976059241, Enum.NormalId.Right, 0.5, (fepenistarget.Character.HumanoidRootPart), fepenistarget.Character.HumanoidRootPart.CFrame * CFrame.new(0.15,-1.15,-1))
    game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(12976059241, Enum.NormalId.Right, 0.5, (fepenistarget.Character.HumanoidRootPart), fepenistarget.Character.HumanoidRootPart.CFrame * CFrame.new(0.15,-1.15,-1.5))
    game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(12976059241, Enum.NormalId.Right, 0.5, (fepenistarget.Character.HumanoidRootPart), fepenistarget.Character.HumanoidRootPart.CFrame * CFrame.new(0.15,-1.15,-2))
    game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(13850207336, Enum.NormalId.Right, 0.5, (fepenistarget.Character.HumanoidRootPart), fepenistarget.Character.HumanoidRootPart.CFrame * CFrame.new(0.15,-1.15,-2.5))
    
    -- Front Penis
    game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(13850207336, Enum.NormalId.Front, 0.5, (fepenistarget.Character.HumanoidRootPart), fepenistarget.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1.15,-2.65))

    -- Left Sack
    game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(12976059241, Enum.NormalId.Top, 0.5, (fepenistarget.Character.HumanoidRootPart), fepenistarget.Character.HumanoidRootPart.CFrame * CFrame.new(0.5,-1,-0.7))
    game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(12976059241, Enum.NormalId.Front, 0.5, (fepenistarget.Character.HumanoidRootPart), fepenistarget.Character.HumanoidRootPart.CFrame * CFrame.new(0.5,-1.15,-0.85))
    game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(12976059241, Enum.NormalId.Bottom, 0.5, (fepenistarget.Character.HumanoidRootPart), fepenistarget.Character.HumanoidRootPart.CFrame * CFrame.new(0.5,-1.3,-0.7))
    game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(12976059241, Enum.NormalId.Right, 0.5, (fepenistarget.Character.HumanoidRootPart), fepenistarget.Character.HumanoidRootPart.CFrame * CFrame.new(0.65,-1.15,-0.7))
    
    -- Right side
    game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(12976059241, Enum.NormalId.Top, 0.5, (fepenistarget.Character.HumanoidRootPart), fepenistarget.Character.HumanoidRootPart.CFrame * CFrame.new(-0.5,-1,-0.7))
    game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(12976059241, Enum.NormalId.Front, 0.5, (fepenistarget.Character.HumanoidRootPart), fepenistarget.Character.HumanoidRootPart.CFrame * CFrame.new(-0.5,-1.15,-0.85))
    game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(12976059241, Enum.NormalId.Bottom, 0.5, (fepenistarget.Character.HumanoidRootPart), fepenistarget.Character.HumanoidRootPart.CFrame * CFrame.new(-0.5,-1.3,-0.7))
    game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(12976059241, Enum.NormalId.Left, 0.5, (fepenistarget.Character.HumanoidRootPart), fepenistarget.Character.HumanoidRootPart.CFrame * CFrame.new(-0.65,-1.15,-0.7))
end

FE:addToggle("FE Penis", false, function(fepenis)
    if fepenis == true then
        fepenistarget = Players:FindFirstChild(LocalPlayer.Name)
        fepenisloop = true
        while fepenisloop do
            function fepenisloopfix()
            task.wait(0.4)
            if fetargetname == "All" then
                for i,v in pairs(game.Players:GetPlayers()) do
                    fepenistarget = Players:FindFirstChild(v.Name)
                    fepenisfunc()
                    task.wait()
                end
            else
                fepenistarget = Players:FindFirstChild(fetargetname)
                fepenisfunc()
            end
            task.wait(15)
        end
        wait()
        pcall(fepenisloopfix)
        end
    end
    if fepenis == false then
        fepenisloop = false
        wait()
    end
end)

FE:addToggle("FE Cum Aura", false, function(fecum)
    fecumloop = fecum
    while fecumloop do
        function fecumloopfix()
        for i,v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer:DistanceFromCharacter(v.Character.HumanoidRootPart.Position) < 5 then
                cumtarget = Players:FindFirstChild(v.Name)
                game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(1302869037, Enum.NormalId.Front, 3, (cumtarget.Character.RightHand), cumtarget.Character.RightHand.CFrame)
                game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(1302869037, Enum.NormalId.Top, 3, (cumtarget.Character.LeftLowerArm), cumtarget.Character.LeftLowerArm.CFrame)
                game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(1302869037, Enum.NormalId.Top, 3, (cumtarget.Character.RightLowerArm), cumtarget.Character.RightLowerArm.CFrame)
                game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(1302869037, Enum.NormalId.Back, 3, (cumtarget.Character.LeftUpperArm), cumtarget.Character.LeftUpperArm.CFrame)
                game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(1302869037, Enum.NormalId.Right, 3, (cumtarget.Character.LowerTorso), cumtarget.Character.LowerTorso.CFrame)
                game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(1302869037, Enum.NormalId.Left, 3, (cumtarget.Character.LeftLowerLeg), cumtarget.Character.LeftLowerLeg.CFrame)
                game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(1302869037, Enum.NormalId.Top, 3, (cumtarget.Character.LeftUpperLeg), cumtarget.Character.LeftUpperLeg.CFrame)
                game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(1302869037, Enum.NormalId.Back, 3, (cumtarget.Character.LeftFoot), cumtarget.Character.LeftFoot.CFrame)
                game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(1302869037, Enum.NormalId.Front, 3, (cumtarget.Character.RightFoot), cumtarget.Character.RightFoot.CFrame)
                game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(1302869037, Enum.NormalId.Left, 3, (cumtarget.Character.RightLowerLeg), cumtarget.Character.RightLowerLeg.CFrame)
                game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(1302869037, Enum.NormalId.Right, 3, (cumtarget.Character.RightUpperLeg), cumtarget.Character.RightUpperLeg.CFrame)
                game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(1302869037, Enum.NormalId.Left, 3, (cumtarget.Character.UpperTorso), cumtarget.Character.UpperTorso.CFrame)
                game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(1302869037, Enum.NormalId.Right, 3, (cumtarget.Character.Head), cumtarget.Character.Head.CFrame)
                game:GetService("Players").LocalPlayer.Character.SprayPaint.Remote:FireServer(1302869037, Enum.NormalId.Front, 3, (cumtarget.Character.Head), cumtarget.Character.Head.CFrame)
                wait()
            end
            wait()
        end
        wait()
    end
    wait()
    pcall(fecumloopfix)
    end
end)

Antijoin:addToggle("Anti Join", false, function(Value)
    if SprayPaintOwnedCheck() == true then return end
    ChangeAntiJoin = Value
    while ChangeAntiJoin do
        function ChangeAntiJoinFix()
        for i,v in pairs(antijoinlist) do
            local Target = Players:FindFirstChild(v.Name)
            UseSpray(Target, 0, "Top", 2048, "HumanoidRootPart", CFrame.new(8999999488, -8999999488, 8999999488), CFrame.Angles(0, 0, 0), 1)
            wait()
        end
    end
    wait()
    pcall(ChangeAntiJoinFix)
    end
end)

Antijoin:addDropdown("Select Player", antijoinlist, function(Value)
    ChangeAntijoinTarget = Value
end)

Antijoin:addButton("Let Player Join", function()
    if ChangeAntijoinTarget == "All" then
        for i = 1,12 do
            for i,v in pairs(antijoinlist) do
                table.remove(antijoinlist,i)
            end
        end
    else
        for i,v in pairs(antijoinlist)do
            if v == ChangeAntijoinTarget then  
                table.remove(antijoinlist,i)
            end
        end
    end
end)

Antijoin:addButton("Clear List", function()
    for i = 1,12 do
        for i,v in pairs(antijoinlist) do
            table.remove(antijoinlist,i)
        end
    end
end)

--------------------------------------------------------------------------------------KEYBINDS----------------------------------------------------------------------------------------
UniversalKeybind:addKeybind("Enable WalkSpeed", KeyCode, function()
    if ChangeWalkSpeed then
        ChangeWalkSpeed = false
    else
        ChangeWalkSpeed = true
        WalkSpeedFunction()
    end
end, function()
	print("[ R3TH PRIV ] Enable WalkSpeed keybind changed.")
end)

UniversalKeybind:addKeybind("Enable JumpPower", KeyCode, function()
    if ChangeJumpPower then
        ChangeJumpPower = false
    else
        ChangeJumpPower = true
        JumpPowerFunction()
    end
end, function()
	print("[ R3TH PRIV ] Enable JumpPower keybind changed.")
end)

UniversalKeybind:addKeybind("Noclip", KeyCode, function()
    if ChangeNoclip then
        ChangeNoclip = false
    else
        ChangeNoclip = true
        NoclipFunction()
    end
end, function()
	print("[ R3TH PRIV ] Enable JumpPower keybind changed.")
end)

UniversalKeybind:addKeybind("Enable Fly", KeyCode, function()
    if ChangeFly then
        ChangeFly = false
        FlyFunction()
    else
        ChangeFly = true
        FlyFunction()
    end
end, function()
	print("[ R3TH PRIV ] Enable Fly keybind changed.")
end)

UniversalKeybind:addKeybind("Xray", KeyCode, function()
    if ChangeXray then
        ChangeXray = false
        XrayFunction()
    else
        ChangeXray = true
        XrayFunction()
    end
end, function()
	print("[ R3TH PRIV ] Xray keybind changed.")
end)

UniversalKeybind:addKeybind("Respawn", KeyCode, function()
    Humanoid.Health = 0
end, function()
	print("[ R3TH PRIV ] Respawn keybind changed.")
end)

UniversalKeybind:addKeybind("Fling", KeyCode, function()
    if ChangeFling then
        ChangeFling = false
        FlingFunction()
    else
        ChangeFling = true
        FlingFunction()
    end
end, function()
	print("[ R3TH PRIV ] Fling keybind changed.")
end)

--------------------------------------------------------------------------------------SETTINGS----------------------------------------------------------------------------------------
Settings:addToggle("Anti Afk", true, function(Value)
    ChangeAntiAFK = Value
end)

Settings:addKeybind("UI Toggle", Enum.KeyCode.LeftControl, function()
	R3TH:toggle()
end, function()
	print("[ R3TH PRIV ] UI Toggle keybind changed.")
end)

Settings:addToggle("UI Toggle Button", false, function(Value)
    ChangeUIToggleButton = Value
    if ChangeUIToggleButton then
        ToggleUI()
    else
        for i,v in pairs (CoreGui:GetChildren()) do
            if v.Name == "R3THTOGGLEBUTTON" then
                v:Destroy()
            end
        end
    end
end)

Credits:addButton("Pethicial", function()
end)

for _,v in next, Backpack.Toys:GetChildren() do
    if v.Name == "SprayPaint" then
        SprayPaintOwned = true
    elseif SprayPaintOwned ~= true then
        for _,v in next, Backpack:GetChildren() do
            if v.Name == "SprayPaint" then
                SprayPaintOwned = true
            elseif SprayPaintOwned ~= true then
                if Character:FindFirstChild("SprayPaint") then
                    SprayPaintOwned = true
                end
            end
        end
        wait()
    end
end

--------------------------------------------------------------------------------------FINISHED----------------------------------------------------------------------------------------
R3TH:SelectPage(R3TH.pages[1], true)

print("[ R3TH PRIV ]: Successfully loaded the script!")
sendnotification("Successfully loaded the script!")

roleupdater = true
while roleupdater do
    function roleupdaterfix()
    roles = ReplicatedStorage:FindFirstChild("GetPlayerData", true):InvokeServer()
    for i, v in pairs(roles) do
        if v.Role == "Murderer" then
            Murder = i
        elseif v.Role == 'Sheriff'then
            Sheriff = i
        elseif v.Role == 'Hero'then
            Hero = i
        end
    end
    wait(1)
end
wait()
pcall(roleupdaterfix)
end
