--[[
    R3TH PRIV MURDER MYSTERY 2 SOURCE

    .gg/pethicial

    Credits:
        pethicial
]]

--------------------------------------------------------------------------------------R3THPRIV----------------------------------------------------------------------------------------
repeat wait() until game:IsLoaded()

print("[ R3TH PRIV ]: R3TH PRIV Murder Mystery 2 loading...")

local TimeStart = tick()

if R3THEXECUTOR == nil then -- if you want to directly execute the script
    R3THEXECUTOR = "Unsupported" -- Supported / Unsupported
    R3THDEVICE = "PC" -- Mobile / PC
end

--------------------------------------------------------------------------------------DEFINE----------------------------------------------------------------------------------------
local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/Venyx%20UI%20Lib/Source.lua"))()
local R3TH = library.new("R3TH PRIV | " .. R3THEXECUTOR .. " | .gg/pethicial")

local Themes = {
    Background = Color3.fromRGB(24, 24, 24),
    Glow = Color3.fromRGB(0, 0, 0),
    Accent = Color3.fromRGB(10, 10, 10),
    LightContrast = Color3.fromRGB(20, 20, 20),
    DarkContrast = Color3.fromRGB(14, 14, 14),  
    TextColor = Color3.fromRGB(255, 255, 255)
}

local Universal = R3TH:addPage("Universal", 10734923549)
local Player = Universal:addSection("Player")
local ESP = Universal:addSection("ESP")
local Aimbot = Universal:addSection("Aimbot")
local Target = Universal:addSection("Target")
local Anti = Universal:addSection("Anti")
local Server = Universal:addSection("Server")

local Combat = R3TH:addPage("Combat", 10734975692)
local Murderer = Combat:addSection("Murderer")
local Sheriff = Combat:addSection("Sheriff")
local Innocent = Combat:addSection("Innocent")

local Main0 = R3TH:addPage("Main", 10709782154)
local Teleports = Main0:addSection("Teleports")
local Chams = Main0:addSection("Chams")
local Main = Main0:addSection("Main")
local Misc = Main0:addSection("Misc")

local Toggles = R3TH:addPage("Toggles", 10734984834)
local World = Toggles:addSection("World")
local Visual = Toggles:addSection("Visual")
local ChromaGuns = Toggles:addSection("Chroma Guns")
local Trading = Toggles:addSection("Trading")
local Traps = Toggles:addSection("Traps")

local SprayPaint = R3TH:addPage("Spray Paint", 10709776050)
local LoopTarget = SprayPaint:addSection("Loop Target")
local FE = SprayPaint:addSection("FE")
local Antijoin = SprayPaint:addSection("Anti Join")

local Target0 = R3TH:addPage("Target", 10734977012)
local Sniper = Target0:addSection("Sniper")
local Webhook = Target0:addSection("Webhook")

local Settings0 = R3TH:addPage("Settings", 10734950309) -- moved to the top for mobile users
local Settings = Settings0:addSection("Settings")
local Theme = Settings0:addSection("Theme")
local Credits = Settings0:addSection("Credits")

local Scripts = R3TH:addPage("Scripts", 10723356507)
local R3THPRIVV1 = Scripts:addSection("R3TH PRIV V1")

local FAQ0 = R3TH:addPage("FAQ", 10723435515)
local FAQ = FAQ0:addSection("FAQ")

local Keybinds = R3TH:addPage("Keybinds", 10723416765)
local UniversalKeybind = Keybinds:addSection("Universal")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Backpack = LocalPlayer:WaitForChild("Backpack")
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
local ContextActionService = game:GetService("ContextActionService")
local HttpService = game:GetService("HttpService")
local Mouse = LocalPlayer:GetMouse()
local Remotes = ReplicatedStorage.Remotes
local Gameplay = Remotes.Gameplay
local ReplicateToy = Remotes.Extras.ReplicateToy
local knifetool = Backpack:FindFirstChild("Knife")
local TrapSystem = ReplicatedStorage:WaitForChild("TrapSystem")
local PlaceTrap = TrapSystem:WaitForChild("PlaceTrap")
local DefaultChatSystemChatEvents = ReplicatedStorage.DefaultChatSystemChatEvents
local SayMessageRequest = DefaultChatSystemChatEvents.SayMessageRequest
local Trade = ReplicatedStorage.Trade

local DefaultWalkSpeed = Humanoid.WalkSpeed
local DefaultJumpPower = Humanoid.JumpPower
local WalkSpeedSlider = DefaultWalkSpeed
local JumpPowerSlider = DefaultJumpPower
local AimbotEnabled = false
local AimbotActive = false
local VisibilityCheck = false
local TeamCheck = false
local ShowFOV = false
local AimingAt = nil
local Smoothness = 12.5
local MovementPrediction = false
local MovementPredictionStrength = 1
local FOV_Color = Color3.fromRGB(0, 255, 127)
local FOV_Size = 25
FlySpeedSlider = 50
ChangeAntiAFK = true
KnifeAuraSlider = 20

local FOVCircle = Drawing.new("Circle")
FOVCircle.Position = Vector2.new(0, 0)
FOVCircle.Radius = FOV_Size
FOVCircle.Thickness = 1
FOVCircle.Filled = false
FOVCircle.Transparency = 1
FOVCircle.Visible = false
FOVCircle.Color = FOV_Color

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

function sendnotification(message, type)
    if type == false or type == nil then
        print("[ R3TH PRIV ]: " .. message)
    end
    if type == true or type == nil then
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

local function AimToPosition(Position)
	local AimX = ((Position.X - Mouse.X) + 0) / Smoothness 
    local AimY = ((Position.Y - Mouse.Y - 36) + 0) / Smoothness
    return AimX, AimY
end

local function InitAimbot()
    if game:GetService("Workspace"):FindFirstChildOfClass("Camera") then
        Camera = game:GetService("Workspace"):FindFirstChildOfClass("Camera")
    end
    local ScreenSize = Camera.ViewportSize
    if FOVCircle then
        FOVCircle.Radius = FOV_Size
        FOVCircle.Visible = ShowFOV
		FOVCircle.Color = FOV_Color
		FOVCircle.Transparency = 1
		FOVCircle.Filled = false
        FOVCircle.Position = Vector2.new(Mouse.X, Mouse.Y + 36)
    end
    if AimbotEnabled == false then return end
    if AimbotActive == true then
        local Closest = {nil, nil, nil, nil, nil}
        for i, v in pairs(Players:GetChildren()) do
            pcall(function()
                if v.Character and v ~= Client then
                    local HumanoidHealth = nil
                    if v.Character:FindFirstChildOfClass("Humanoid") ~= nil then
                        HumanoidHealth = v.Character:FindFirstChildOfClass("Humanoid").Health
                    end
                    if HumanoidHealth == nil or HumanoidHealth > 0 then
                        local PlayerRoot = v.Character:FindFirstChild("HumanoidRootPart") or v.Character:FindFirstChild("Torso")
                        local PlayerHead = v.Character:FindFirstChild("Head") or PlayerRoot
                        local PlayerScreen, InFOV = Camera:WorldToViewportPoint(PlayerRoot.Position)
                        local DistanceFromCenter = 0
                        DistanceFromCenter = (Vector2.new(PlayerScreen.X, PlayerScreen.Y) - Vector2.new(Mouse.X, Mouse.Y)).magnitude
                        if (InFOV == true and DistanceFromCenter < FOV_Size) or AimingAt == v then
                            if AimingAt == v then
                                DistanceFromCenter = 0
                            end
                            if (TeamCheck == true and v.Team ~= Client.Team) or TeamCheck == false then
                                local Obscuring = false
                                if VisibilityCheck == true then
                                	local Parts = Camera:GetPartsObscuringTarget({Client.Character.Head.Position, PlayerHead.Position}, {Camera, Client.Character})
                                	for i2, v2 in pairs(Parts) do
                                    if v2:IsDescendantOf(v.Character) == false and v2.Transparency == 0 then
                                            Obscuring = true
                                        end
                                    end
                                end
                                if Obscuring == false and ((Closest[1] ~= nil and DistanceFromCenter < Closest[1]) or Closest[1] == nil) then
                                    if Closest[1] == nil or (DistanceFromCenter < Closest[1]) then
                                        local Prediction = Vector3.new(0, 0, 0)
                                        if MovementPrediction == true then
                                            Prediction = PlayerRoot.Velocity * (MovementPredictionStrength / 10) * (Client.Character.Head.Position - PlayerHead.Position).magnitude / 100
                                        end
                                        Closest[1] = DistanceFromCenter
                                        local PlayerAim = nil
                                        if AimPart == "Torso" then
                                            PlayerAim = v.Character:FindFirstChild("HumanoidRootPart") or v.Character:FindFirstChild("Torso")
                                        else
                                            PlayerAim = v.Character.Head
                                        end
                                        Closest[2] = PlayerAim
                                        Closest[3] = Vector2.new(PlayerScreen.X, PlayerScreen.Y)
                                        Closest[4] = Prediction
                                        Closest[5] = v
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
        if Closest[1] ~= nil and Closest[2] ~= nil and Closest[3] ~= nil and Closest[4] ~= nil and Closest[5] ~= nil then
            pcall(function()
                local AimAt = Camera:WorldToViewportPoint(Closest[2].Position + Closest[4])
                mousemoverel(AimToPosition(Vector2.new(AimAt.X, AimAt.Y)))
                AimingAt = Closest[5]
            end)
        else
            AimingAt = nil
        end
    end
end

local function getUserAvatarByUserId(ChangeTargetUserId)
    local url = "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds="..ChangeTargetUserId.."&size=48x48&format=Png&isCircular=false"
    local response = request({Url = url}).Body
    return HttpService:JSONDecode(response).data[1].imageUrl
end

local function getUserAvatarsByTokens(playerTokens)
    local url = "https://thumbnails.roblox.com/v1/batch"
    local data = {}
    for _, token in ipairs(playerTokens) do
        table.insert(data, {
            token = token,
            type = "AvatarHeadShot",
            size = "48x48",
            isCircular = false
        })
    end
    data = HttpService:JSONEncode(data)
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local response = request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = data
    }).Body
    local imageUrls = {}
    for _, item in ipairs(HttpService:JSONDecode(response).data) do
        table.insert(imageUrls, item.imageUrl)
    end
    return imageUrls
end

local function CancelSearch()
    sendnotification("Search canceled.", nil)
    SniperText.Text = "Join a player by just knowing what game their in!"
end

function ExecutorFunction()
    if R3THEXECUTOR == "Unsupported" then
        sendnotification("This option is not supported by your executor.")
        return true
    end
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
            if v.Name == Sheriff and IsAlive(v) and ChangeSheriffCham == true then
                Highlight.FillColor = Color3.fromRGB(0, 0, 225)
            elseif v.Name == Murder and IsAlive(v) and ChangeMurdererCham == true then
                Highlight.FillColor = Color3.fromRGB(225, 0, 0)
            elseif v.Name == Hero and IsAlive(v) and not IsAlive(Players[Sheriff]) and ChangeSheriffCham == true then
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
    for i,v in pairs (Workspace:GetDescendants()) do
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

-- Free Camera --
local Freecam = Instance.new("ScreenGui")

Freecam.Name = "Freecam"
Freecam.ResetOnSpawn = false

function FreeCameraWrap()
    local script = Instance.new("LocalScript")
    script.Parent = Freecam

    local pi    = math.pi
    local abs   = math.abs
    local clamp = math.clamp
    local exp   = math.exp
    local rad   = math.rad
    local sign  = math.sign
    local sqrt  = math.sqrt
    local tan   = math.tan
    if not LocalPlayer then
        Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
        LocalPlayer = Players.LocalPlayer
    end
    
    local Camera = Workspace.CurrentCamera
    Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
        local newCamera = Workspace.CurrentCamera
        if newCamera then
            Camera = newCamera
        end
    end)
        
    local TOGGLE_INPUT_PRIORITY = Enum.ContextActionPriority.Low.Value
    local INPUT_PRIORITY = Enum.ContextActionPriority.High.Value
    
    local NAV_GAIN = Vector3.new(1, 1, 1)*64
    local PAN_GAIN = Vector2.new(0.75, 1)*8
    local FOV_GAIN = 300
    
    local PITCH_LIMIT = rad(90)
    
    local VEL_STIFFNESS = 1.5
    local PAN_STIFFNESS = 1.0
    local FOV_STIFFNESS = 4.0
        
    local Spring = {} do
        Spring.__index = Spring
    
        function Spring.new(freq, pos)
            local self = setmetatable({}, Spring)
            self.f = freq
            self.p = pos
            self.v = pos*0
            return self
        end
    
        function Spring:Update(dt, goal)
            local f = self.f*2*pi
            local p0 = self.p
            local v0 = self.v
    
            local offset = goal - p0
            local decay = exp(-f*dt)
    
            local p1 = goal + (v0*dt - offset*(f*dt + 1))*decay
            local v1 = (f*dt*(offset*f - v0) + v0)*decay
    
            self.p = p1
            self.v = v1
    
            return p1
        end
    
        function Spring:Reset(pos)
            self.p = pos
            self.v = pos*0
        end
    end
    
    local cameraPos = Vector3.new()
    local cameraRot = Vector2.new()
    local cameraFov = 0
    
    local velSpring = Spring.new(VEL_STIFFNESS, Vector3.new())
    local panSpring = Spring.new(PAN_STIFFNESS, Vector2.new())
    local fovSpring = Spring.new(FOV_STIFFNESS, 0)
    
    local Input = {} do
        local thumbstickCurve do
            local K_CURVATURE = 2.0
            local K_DEADZONE = 0.15
    
            local function fCurve(x)
                return (exp(K_CURVATURE*x) - 1)/(exp(K_CURVATURE) - 1)
            end
    
            local function fDeadzone(x)
                return fCurve((x - K_DEADZONE)/(1 - K_DEADZONE))
            end
    
            function thumbstickCurve(x)
                return sign(x)*clamp(fDeadzone(abs(x)), 0, 1)
            end
        end
    
        local gamepad = {
            ButtonX = 0,
            ButtonY = 0,
            DPadDown = 0,
            DPadUp = 0,
            ButtonL2 = 0,
            ButtonR2 = 0,
            Thumbstick1 = Vector2.new(),
            Thumbstick2 = Vector2.new(),
        }
    
        local keyboard = {
            W = 0,
            A = 0,
            S = 0,
            D = 0,
            E = 0,
            Q = 0,
            U = 0,
            H = 0,
            J = 0,
            K = 0,
            I = 0,
            Y = 0,
            Up = 0,
            Down = 0,
            LeftShift = 0,
            RightShift = 0,
        }
    
        local mouse = {
            Delta = Vector2.new(),
            MouseWheel = 0,
        }
    
        local NAV_GAMEPAD_SPEED  = Vector3.new(1, 1, 1)
        local NAV_KEYBOARD_SPEED = Vector3.new(1, 1, 1)
        local PAN_MOUSE_SPEED    = Vector2.new(1, 1)*(pi/64)
        local PAN_GAMEPAD_SPEED  = Vector2.new(1, 1)*(pi/8)
        local FOV_WHEEL_SPEED    = 1.0
        local FOV_GAMEPAD_SPEED  = 0.25
        local NAV_ADJ_SPEED      = 0.75
        local NAV_SHIFT_MUL      = 0.25
    
        local navSpeed = 1
    
        function Input.Vel(dt)
            navSpeed = clamp(navSpeed + dt*(keyboard.Up - keyboard.Down)*NAV_ADJ_SPEED, 0.01, 4)
    
            local kGamepad = Vector3.new(
                thumbstickCurve(gamepad.Thumbstick1.x),
                thumbstickCurve(gamepad.ButtonR2) - thumbstickCurve(gamepad.ButtonL2),
                thumbstickCurve(-gamepad.Thumbstick1.y)
            )*NAV_GAMEPAD_SPEED
    
            local kKeyboard = Vector3.new(
                keyboard.D - keyboard.A + keyboard.K - keyboard.H,
                keyboard.E - keyboard.Q + keyboard.I - keyboard.Y,
                keyboard.S - keyboard.W + keyboard.J - keyboard.U
            )*NAV_KEYBOARD_SPEED
    
            local shift = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift)
    
            return (kGamepad + kKeyboard)*(navSpeed*(shift and NAV_SHIFT_MUL or 1))
        end
    
        function Input.Pan(dt)
            local kGamepad = Vector2.new(
                thumbstickCurve(gamepad.Thumbstick2.y),
                thumbstickCurve(-gamepad.Thumbstick2.x)
            )*PAN_GAMEPAD_SPEED
            local kMouse = mouse.Delta*PAN_MOUSE_SPEED
            mouse.Delta = Vector2.new()
            return kGamepad + kMouse
        end
    
        function Input.Fov(dt)
            local kGamepad = (gamepad.ButtonX - gamepad.ButtonY)*FOV_GAMEPAD_SPEED
            local kMouse = mouse.MouseWheel*FOV_WHEEL_SPEED
            mouse.MouseWheel = 0
            return kGamepad + kMouse
        end
    
        do
            local function Keypress(action, state, input)
                keyboard[input.KeyCode.Name] = state == Enum.UserInputState.Begin and 1 or 0
                return Enum.ContextActionResult.Sink
            end
    
            local function GpButton(action, state, input)
                gamepad[input.KeyCode.Name] = state == Enum.UserInputState.Begin and 1 or 0
                return Enum.ContextActionResult.Sink
            end
    
            local function MousePan(action, state, input)
                local delta = input.Delta
                mouse.Delta = Vector2.new(-delta.y, -delta.x)
                return Enum.ContextActionResult.Sink
            end
    
            local function Thumb(action, state, input)
                gamepad[input.KeyCode.Name] = input.Position
                return Enum.ContextActionResult.Sink
            end
    
            local function Trigger(action, state, input)
                gamepad[input.KeyCode.Name] = input.Position.z
                return Enum.ContextActionResult.Sink
            end
    
            local function MouseWheel(action, state, input)
                mouse[input.UserInputType.Name] = -input.Position.z
                return Enum.ContextActionResult.Sink
            end
    
            local function Zero(t)
                for k, v in pairs(t) do
                    t[k] = v*0
                end
            end
    
            function Input.StartCapture()
                ContextActionService:BindActionAtPriority("FreecamKeyboard", Keypress, false, INPUT_PRIORITY,
                    Enum.KeyCode.W, Enum.KeyCode.U,
                    Enum.KeyCode.A, Enum.KeyCode.H,
                    Enum.KeyCode.S, Enum.KeyCode.J,
                    Enum.KeyCode.D, Enum.KeyCode.K,
                    Enum.KeyCode.E, Enum.KeyCode.I,
                    Enum.KeyCode.Q, Enum.KeyCode.Y,
                    Enum.KeyCode.Up, Enum.KeyCode.Down
                )
                ContextActionService:BindActionAtPriority("FreecamMousePan",          MousePan,   false, INPUT_PRIORITY, Enum.UserInputType.MouseMovement)
                ContextActionService:BindActionAtPriority("FreecamMouseWheel",        MouseWheel, false, INPUT_PRIORITY, Enum.UserInputType.MouseWheel)
                ContextActionService:BindActionAtPriority("FreecamGamepadButton",     GpButton,   false, INPUT_PRIORITY, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonY)
                ContextActionService:BindActionAtPriority("FreecamGamepadTrigger",    Trigger,    false, INPUT_PRIORITY, Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonL2)
                ContextActionService:BindActionAtPriority("FreecamGamepadThumbstick", Thumb,      false, INPUT_PRIORITY, Enum.KeyCode.Thumbstick1, Enum.KeyCode.Thumbstick2)
            end
    
            function Input.StopCapture()
                navSpeed = 1
                Zero(gamepad)
                Zero(keyboard)
                Zero(mouse)
                ContextActionService:UnbindAction("FreecamKeyboard")
                ContextActionService:UnbindAction("FreecamMousePan")
                ContextActionService:UnbindAction("FreecamMouseWheel")
                ContextActionService:UnbindAction("FreecamGamepadButton")
                ContextActionService:UnbindAction("FreecamGamepadTrigger")
                ContextActionService:UnbindAction("FreecamGamepadThumbstick")
            end
        end
    end
    
    local function GetFocusDistance(cameraFrame)
        local znear = 0.1
        local viewport = Camera.ViewportSize
        local projy = 2*tan(cameraFov/2)
        local projx = viewport.x/viewport.y*projy
        local fx = cameraFrame.rightVector
        local fy = cameraFrame.upVector
        local fz = cameraFrame.lookVector
    
        local minVect = Vector3.new()
        local minDist = 512
    
        for x = 0, 1, 0.5 do
            for y = 0, 1, 0.5 do
                local cx = (x - 0.5)*projx
                local cy = (y - 0.5)*projy
                local offset = fx*cx - fy*cy + fz
                local origin = cameraFrame.p + offset*znear
                local _, hit = Workspace:FindPartOnRay(Ray.new(origin, offset.unit*minDist))
                local dist = (hit - origin).magnitude
                if minDist > dist then
                    minDist = dist
                    minVect = offset.unit
                end
            end
        end
    
        return fz:Dot(minVect)*minDist
    end
    
    local function StepFreecam(dt)
        local vel = velSpring:Update(dt, Input.Vel(dt))
        local pan = panSpring:Update(dt, Input.Pan(dt))
        local fov = fovSpring:Update(dt, Input.Fov(dt))
    
        local zoomFactor = sqrt(tan(rad(70/2))/tan(rad(cameraFov/2)))
    
        cameraFov = clamp(cameraFov + fov*FOV_GAIN*(dt/zoomFactor), 1, 120)
        cameraRot = cameraRot + pan*PAN_GAIN*(dt/zoomFactor)
        cameraRot = Vector2.new(clamp(cameraRot.x, -PITCH_LIMIT, PITCH_LIMIT), cameraRot.y%(2*pi))
    
        local cameraCFrame = CFrame.new(cameraPos)*CFrame.fromOrientation(cameraRot.x, cameraRot.y, 0)*CFrame.new(vel*NAV_GAIN*dt)
        cameraPos = cameraCFrame.p
    
        Camera.CFrame = cameraCFrame
        Camera.Focus = cameraCFrame*CFrame.new(0, 0, -GetFocusDistance(cameraCFrame))
        Camera.FieldOfView = cameraFov
    end
        
    local PlayerState = {} do
        local mouseBehavior
        local mouseIconEnabled
        local cameraType
        local cameraFocus
        local cameraCFrame
        local cameraFieldOfView
        local screenGuis = {}
        local coreGuis = {
            Backpack = true,
            Chat = true,
            Health = true,
            PlayerList = true,
        }
        local setCores = {
            BadgesNotificationsActive = true,
            PointsNotificationsActive = true,
        }
    
        function PlayerState.Push()
            for name in pairs(coreGuis) do
                coreGuis[name] = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType[name])
                StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[name], false)
            end
            for name in pairs(setCores) do
                setCores[name] = StarterGui:GetCore(name)
                StarterGui:SetCore(name, false)
            end
            local playergui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
            if playergui then
                for _, gui in pairs(playergui:GetChildren()) do
                    if gui:IsA("ScreenGui") and gui.Enabled then
                        screenGuis[#screenGuis + 1] = gui
                        gui.Enabled = false
                    end
                end
            end
    
            cameraFieldOfView = Camera.FieldOfView
            Camera.FieldOfView = 70
    
            cameraType = Camera.CameraType
            Camera.CameraType = Enum.CameraType.Custom
    
            cameraCFrame = Camera.CFrame
            cameraFocus = Camera.Focus
    
            mouseIconEnabled = UserInputService.MouseIconEnabled
            UserInputService.MouseIconEnabled = false
    
            mouseBehavior = UserInputService.MouseBehavior
            UserInputService.MouseBehavior = Enum.MouseBehavior.Default
        end
    
        function PlayerState.Pop()
            for name, isEnabled in pairs(coreGuis) do
                StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[name], isEnabled)
            end
            for name, isEnabled in pairs(setCores) do
                StarterGui:SetCore(name, isEnabled)
            end
            for _, gui in pairs(screenGuis) do
                if gui.Parent then
                    gui.Enabled = true
                end
            end
    
            Camera.FieldOfView = cameraFieldOfView
            cameraFieldOfView = nil
    
            Camera.CameraType = cameraType
            cameraType = nil
    
            Camera.CFrame = cameraCFrame
            cameraCFrame = nil
    
            Camera.Focus = cameraFocus
            cameraFocus = nil
    
            UserInputService.MouseIconEnabled = mouseIconEnabled
            mouseIconEnabled = nil
    
            UserInputService.MouseBehavior = mouseBehavior
            mouseBehavior = nil
        end
    end
    
    local function StartFreecam()
        local cameraCFrame = Camera.CFrame
        cameraRot = Vector2.new(cameraCFrame:toEulerAnglesYXZ())
        cameraPos = cameraCFrame.p
        cameraFov = Camera.FieldOfView
    
        velSpring:Reset(Vector3.new())
        panSpring:Reset(Vector2.new())
        fovSpring:Reset(0)
    
        PlayerState.Push()
        RunService:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, StepFreecam)
        Input.StartCapture()
    end
    
    local function StopFreecam()
        Input.StopCapture()
        RunService:UnbindFromRenderStep("Freecam")
        PlayerState.Pop()
    end
    
    do
        local enabled = false
    
        function ToggleFreecam()
            if enabled then
                StopFreecam()
            else
                StartFreecam()
            end
            enabled = not enabled
        end
    end

end
coroutine.resume(coroutine.create(FreeCameraWrap))

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
    while ChangeNoclip and task.wait() do
        for a, b in pairs(Workspace:GetChildren()) do
            if b.Name == LocalPlayer.Name then
                for i, v in pairs(Workspace[LocalPlayer.Name]:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = not ChangeNoclip
                    end
                end 
            end 
        end
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

function EnableAimbotFunction()
    if AimbotEnabled then
        FOVCircle.Visible = OriginalShowFOV
        AimbotInputBegan = UserInputService.InputBegan:Connect(function(Input, GPE)
            if GPE or AimbotEnabled == false then return end
            if Input.UserInputType == Enum.UserInputType.MouseButton2 then
                AimbotActive = true
            end
        end)
        
        AimbotInputEnded = UserInputService.InputEnded:Connect(function(Input, GPE)
            if GPE or AimbotEnabled == false then return end
            if Input.UserInputType == Enum.UserInputType.MouseButton2 then
                AimbotActive = false
                AimingAt = nil
            end
        end)
        
        AimbotRunService = RunService:BindToRenderStep("InitAimbot", 1, InitAimbot)
    else
        AimbotInputBegan:Disconnect()
        AimbotInputEnded:Disconnect()
        RunService:UnbindFromRenderStep("InitAimbot")
        OriginalShowFOV = ShowFOV
        FOVCircle.Visible = false
    end
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
                        return sendnotification("Error Occurred: Targeting is sitting", true)
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
                        return sendnotification("Error Occurred: Target is missing everything", true)
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
                    return sendnotification("Error Occurred: Random error", true)
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
                    sendnotification("Error Occurred: Username Invalid", true)
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

Aimbot:addToggle("Enable Aimbot", false, function(Value)
    AimbotEnabled = Value
    EnableAimbotFunction()
end)

Aimbot:addToggle("Visibility Check", false, function(Value)
    VisibilityCheck = Value
end)

Aimbot:addToggle("Movement Prediction", false, function(Value)
    MovementPredicition = Value
end)

if R3THDEVICE == "Mobile" then
    Aimbot:addTextbox("Movement Prediction Strength 0 - 20", 1, function(Value, focusLost)
        MovementPredictionStrength = Value
    end)
else
    Aimbot:addSlider("Movement Prediction Strength", 1, 0, 20, function(Value)
        MovementPredictionStrength = Value
    end)
end

Aimbot:addToggle("Team Check", false, function(Value)
    TeamCheck = Value
end)

Aimbot:addToggle("Show FOV Circle", false, function(Value)
    ShowFOV = Value
end)

if R3THDEVICE == "Mobile" then
    Aimbot:addTextbox("Field Of View 0 - 200", 25, function(Value, focusLost)
        FOV_Size = Value
    end)
else
    Aimbot:addSlider("Field Of View", 25, 0, 200, function(Value)
        FOV_Size = Value
    end)
end

Aimbot:addToggle("Trigger Bot", false, function(Value)
    ChangeTriggerBot = Value
    local Mouse = LocalPlayer:GetMouse()
    while ChangeTriggerBot do
        for i, v in pairs(game:GetService("Players"):GetChildren()) do 
            if TeamCheck and Mouse.Target.Parent == v.Character and Mouse.Target:IsA("Part" or "BasePart") and v.Team ~= LocalPlayer.Team then 
                mouse1press()
                wait()
                mouse1release()
            elseif not TeamCheck and Mouse.Target.Parent == v.Character and Mouse.Target:IsA("Part" or "BasePart") then
                mouse1press()
                wait()
                mouse1release()
            end
        end
        wait()
    end
end)

Aimbot:addDropdown("Aim Part", {"Head", "Torso"}, function(Value)
    ChangeAimPart = Value
end)

Aimbot:addColorPicker("Circle Color", Color3.fromRGB(0, 255, 127), function(Value)
    FOV_Color = Value
end)

Target:addDropdown("Select Player", playerlist, function(Value)
    ChangeFlingTarget = Value
end)

Target:addToggle("Fling", false, function(Value)
    ChangeFling = Value
    FlingFunction()
end)

Anti:addToggle("Anti Fling", false, function(Value)
    if Value then
        local Services = setmetatable({}, {__index = function(Self, Index)
            local NewService = game.GetService(game, Index)
            if NewService then
                Self[Index] = NewService
            end
            return NewService
        end})
        
        local LocalPlayer = Services.Players.LocalPlayer
        
        local function PlayerAdded(Player)
            local Detected = false
            local Character;
            local PrimaryPart;
            
            local function CharacterAdded(NewCharacter)
                Character = NewCharacter
                repeat
                    wait()
                    PrimaryPart = NewCharacter:FindFirstChild("HumanoidRootPart")
                until PrimaryPart
                Detected = false
            end
            
            CharacterAdded(Player.Character or Player.CharacterAdded:Wait())
            AntiFlingCharacterAdded = Player.CharacterAdded:Connect(CharacterAdded)
            AntiFlingConnection = Services.RunService.Heartbeat:Connect(function()
                if (Character and Character:IsDescendantOf(workspace)) and (PrimaryPart and PrimaryPart:IsDescendantOf(Character)) then
                    if PrimaryPart.AssemblyAngularVelocity.Magnitude > 50 or PrimaryPart.AssemblyLinearVelocity.Magnitude > 100 then
                        Detected = true
                        for i,v in ipairs(Character:GetDescendants()) do
                            if v:IsA("BasePart") then
                                v.CanCollide = false
                                v.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                                v.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                                v.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
                            end
                        end
                        PrimaryPart.CanCollide = false
                        PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                        PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                        PrimaryPart.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
                    end
                end
            end)
        end
        
        for i,v in ipairs(Services.Players:GetPlayers()) do
            if v ~= LocalPlayer then
                PlayerAdded(v)
            end
        end
        AntiFlingPlayerAdded = Services.Players.PlayerAdded:Connect(PlayerAdded)
        
        local LastPosition = nil
        AntiFlingConnection2 = Services.RunService.Heartbeat:Connect(function()
            pcall(function()
                local PrimaryPart = LocalPlayer.Character.PrimaryPart
                if PrimaryPart.AssemblyLinearVelocity.Magnitude > 250 or PrimaryPart.AssemblyAngularVelocity.Magnitude > 250 then
                    PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                    PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                    PrimaryPart.CFrame = LastPosition
                elseif PrimaryPart.AssemblyLinearVelocity.Magnitude < 50 or PrimaryPart.AssemblyAngularVelocity.Magnitude > 50 then
                    LastPosition = PrimaryPart.CFrame
                end
            end)
        end)
    else
        AntiFlingPlayerAdded:Disconnect()
        AntiFlingCharacterAdded:Disconnect()
        AntiFlingConnection:Disconnect()
        AntiFlingConnection2:Disconnect()
    end
end)

Anti:addToggle("Anti Void", false, function(Value)
    if Value then
        OldFallenPartsDestroyHeight = Workspace.FallenPartsDestroyHeight
        Workspace.FallenPartsDestroyHeight = math.huge-math.huge
    else
        Workspace.FallenPartsDestroyHeight = OldFallenPartsDestroyHeight
    end
end)

Server:addButton("No Delay", function()
    if ExecutorFunction() then return end
    g = hookfunction(wait, function(seconds) return g(0) end)
    visualg = hookfunction(wait, function(seconds) return g(0) end)
end)

Server:addToggle("Free Camera", false, function()
    ToggleFreecam()
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
    while ChangeAutoKillAll and task.wait() do
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
    end
end)

Murderer:addToggle("Knife Aura", false, function(Value)
    ChangeKnifeAura = Value
    while ChangeKnifeAura and task.wait() do
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and LocalPlayer:DistanceFromCharacter(player.Character.HumanoidRootPart.Position) < KnifeAuraSlider then
                EquipKnife()
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

Murderer:addButton("Fast Knife Throw", function()
    if ExecutorFunction() then return end
    g = hookfunction(wait, function(seconds) return g(0) end)
    visualg = hookfunction(wait, function(seconds) return g(0) end)
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
    if ExecutorFunction() then return end
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

Innocent:addToggle("2 Lifes", false, function(Value)
    Change2Lifes = Value
    while Change2Lifes and task.wait() do
        Humanoid:ChangeState(11)
    end
end)

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

Chams:addToggle("Player Chams", false, function(playerchams) -- not improved yet
    playerchamsloop = playerchams
    while playerchamsloop and task.wait(1) do
        function playerchamsloopfix()
        CreateHighlight()
        UpdateHighlights()
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
    while loopinteractiveloop and task.wait() do
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
    end
    wait()
    pcall(loopinteractiveloopfix)
    end
end)

World:addToggle("Always Alive Chat", false, function(Value)
    if ExecutorFunction() then return end
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
    while ChangeImproveFPS and task.wait() do
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
    while ChangeLoopDropGuns and task.wait() do
        if Humanoid then
            Gameplay.FakeGun:FireServer(true)
            dropgun()
        end
    end
end)

ChromaGuns:addToggle("Pickup All Guns", false, function(Value)
    ChangePickupAllGuns = Value
    while ChangePickupAllGuns and task.wait() do
        for _,v in pairs(Workspace:GetDescendants()) do
            if v:IsA("TouchTransmitter") then
                firetouchinterest(HumanoidRootPart, v.Parent, 0)
                task.wait()
                firetouchinterest(HumanoidRootPart, v.Parent, 1)
            end
        end
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
    while ChangeHideTradeUI and task.wait() do
        local gui = LocalPlayer.PlayerGui:FindFirstChild("TradeGUI")
        if gui then
            gui.Enabled = false
            local frame = gui:FindFirstChild("Container")
            if frame then
                frame.Visible = false
            end
        end
    end
end)

Trading:addToggle("Auto Accept Trade", false, function(Value)
    ChangeAutoAcceptTrade = Value
    while ChangeAutoAcceptTrade and task.wait() do
        Trade.AcceptTrade:FireServer()
    end
end)

Traps:addKeybind("Place Trap", KeyCode, function()
    ReplicatedStorage:WaitForChild("TrapSystem"):WaitForChild("PlaceTrap"):InvokeServer(CFrame.new(Character.Head.Position.X, Character.Head.Position.Y, Character.Head.Position.Z))
end, function()
	sendnotification("Place Trap keybind changed.", false)
end)

Traps:addToggle("Anti Trap", false, function(Value)
    ChangeAntiTrap = Value
    while ChangeAntiTrap and task.wait() do -- will be better when i remake it
        function ChangeAntiTrapFix()
        if Humanoid.WalkSpeed == 0.009999999776482582 then
            Humanoid.WalkSpeed = 16
        end
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
        end
    end
end

LoopTarget:addToggle("Loop Reset", false, function(Value)
    ChangeLoopResetPlayer = Value
    while ChangeLoopResetPlayer and task.wait() do
        function ChangeLoopResetPlayerFix()
        UseSpray(ChangeLoopTarget, 0, "Top", 2048, "HumanoidRootPart", CFrame.new(8999999488, -8999999488, 8999999488), CFrame.Angles(0, 0, 0), 1)
    end
    wait()
    pcall(ChangeLoopResetPlayerFix)
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
        UseSpray(ChangeLoopTarget, 1, "Front", 2048, "HumanoidRootPart", CFrame.new(0, -25000, 0), CFrame.Angles(0, 0, 0), 1)
        UseSpray(ChangeLoopTarget, 1, "Front", 2048, "HumanoidRootPart", CFrame.new(0, 25000, 0), CFrame.Angles(0, 0, 0), 1)
        wait(12)
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
    while ChangeLoopTrapPlayer and task.wait() do
        function ChangeLoopTrapPlayerFix()
        if ChangeLoopTarget == "All" then
            for i,v in pairs(Players:GetChildren()) do
                if v ~= LocalPlayer then
                    local Target = Players:FindFirstChild(v.Name)
                    PlaceTrap:InvokeServer(CFrame.new(Target.Character.HumanoidRootPart.Position))
                end
            end
        else
            Target = Players:FindFirstChild(ChangeLoopTarget)
            PlaceTrap:InvokeServer(CFrame.new(Target.Character.HumanoidRootPart.Position))
        end
    end
    wait()
    pcall(ChangeLoopTrapPlayerFix)
    end
end)

LoopTarget:addToggle("Auto Equip Spray Paint", false, function(Value)
    ChangeAutoEquipSprayPaint = Value
    while ChangeAutoEquipSprayPaint and task.wait() do
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

Antijoin:addToggle("Anti Join", false, function(Value)
    ChangeAntiJoin = Value
    while ChangeAntiJoin and task.wait() do
        function ChangeAntiJoinFix()
        for i,v in pairs(antijoinlist) do
            local Target = Players:FindFirstChild(v.Name)
            UseSpray(Target, 0, "Top", 2048, "HumanoidRootPart", CFrame.new(8999999488, -8999999488, 8999999488), CFrame.Angles(0, 0, 0), 1)
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

--------------------------------------------------------------------------------------TARGET----------------------------------------------------------------------------------------
SniperContainer, SniperText = Sniper:addParagraph("Status", "Join a player by just knowing what game their in!")

Sniper:addTextbox("Target User Id", nil, function(Value, focusLost)
    ChangeTargetUserId = Value
end)

Sniper:addTextbox("Target Place Id", nil, function(Value, focusLost)
    ChangeTargetPlaceId = Value
end)

Sniper:addToggle("Search", false, function(Value)
    ChangeSearch = Value
    if not ChangeSearch then CancelSearch() return end
    SniperText.Text = 'Retrieving user info...'
    
    local userAvatarUrl = getUserAvatarByUserId(ChangeTargetUserId)
    
    local cursor = ""
    local sniperfound = false
    
    local sniperpage = 1
    
    repeat
        if not ChangeSearch then CancelSearch() return end
        SniperText.Text = "Retrieving server list... (Page " .. sniperpage .. ")"
        local url = "https://games.roblox.com/v1/games/"..ChangeTargetPlaceId.."/servers/Public?sortOrder=Asc&limit=100"
        if cursor then
            url = url .. "&cursor=" .. cursor
        end
        local response = request({ Url = url }).Body
        local data = HttpService:JSONDecode(response)
        for i, server in ipairs(data.data) do
            if not ChangeSearch then CancelSearch() return end
            wait()
            SniperText.Text = "Scanning servers (Page " .. sniperpage .. " - " .. i .. "/" .. #data.data .. " - " .. server.playing .. " online)"
            local serverAvatarUrls = getUserAvatarsByTokens(server.playerTokens)
            for _, serverAvatarUrl in ipairs(serverAvatarUrls) do
                if not ChangeSearch then CancelSearch() return end
                wait()
                if serverAvatarUrl == userAvatarUrl then
                    SniperText.Text = "Player found, Teleporting..."
                    TeleportService:TeleportToPlaceInstance(ChangeTargetPlaceId, server.id, LocalPlayer)
                    wait(0.1)
                    sniperfound = true
                    break
                end
            end
            if sniperfound then break end
        end
    
        cursor = data.nextPageCursor or ""
        sniperpage = sniperpage + 1
    until sniperfound or cursor == ""
    
    if not sniperfound then
        SniperText.Text = "The user could not be found in the game."
        sendnotification("The user could not be found in the game.", nil)
    end
end)

Webhook:addTextbox("Webhook Url", nil, function(Value, focusLost)
    ChangeWebhookUrl = Value
end)

Webhook:addTextbox("Webhook Username", nil, function(Value, focusLost)
    ChangeWebhookUsername = Value
end)

Webhook:addTextbox("Webhook Message", nil, function(Value, focusLost)
    ChangeWebhookMessage = Value
end)

Webhook:addToggle("Spam Webhook", false, function(Value) -- I am not liable for how this might be utilised because it was simply added for educational purposes.
    ChangeSpamWebhook = Value
    while ChangeSpamWebhook and task.wait() do
        function ChangeSpamWebhookFix()
        local response = request({
            Url = ChangeWebhookUrl,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = HttpService:JSONEncode({content = ChangeWebhookMessage, username = ChangeWebhookUsername})
        })
    end
    wait()
    pcall(ChangeSpamWebhookFix)
    end
end)

--------------------------------------------------------------------------------------SCRIPTS----------------------------------------------------------------------------------------
loadstring(game:HttpGet('https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/OtherScripts/Game%20Status.lua'))()

Container1, Text1 = R3THPRIVV1:addParagraph(nil, "Abyss World: " .. R3THPRIVV1_AbyssWorld)

Container2, Text2 = R3THPRIVV1:addParagraph(nil, "Blade Ball: " .. R3THPRIVV1_BladeBall)

Container3, Text3 = R3THPRIVV1:addParagraph(nil, "Bloxy Bingo: " .. R3THPRIVV1_BloxyBingo)

Container4, Text4 = R3THPRIVV1:addParagraph(nil, "Bulked Up: " .. R3THPRIVV1_BulkedUp)

Container5, Text5 = R3THPRIVV1:addParagraph(nil, "FOBLOX: " .. R3THPRIVV1_FOBLOX)

Container6, Text6 = R3THPRIVV1:addParagraph(nil, "Harbor Havoc: " .. R3THPRIVV1_HarborHavoc)

Container7, Text7 = R3THPRIVV1:addParagraph(nil, "Murder Mystery 2: " .. R3THPRIVV1_MurderMystery2)

Container8, Text8 = R3THPRIVV1:addParagraph(nil, "Sharkbite 2: " .. R3THPRIVV1_Sharkbite2)

Container9, Text9 = R3THPRIVV1:addParagraph(nil, "THEIF LIFE Simulator: " .. R3THPRIVV1_THEIFLIFESimulator)

Container10, Text10 = R3THPRIVV1:addParagraph(nil, "Total Roblox Drama: " .. R3THPRIVV1_TotalRobloxDrama)

Container11, Text11 = R3THPRIVV1:addParagraph(nil, "Tower of Hell: " .. R3THPRIVV1_TowerofHell)

Container12, Text12 = R3THPRIVV1:addParagraph(nil, "Universal: " .. R3THPRIVV1_Universal)

--------------------------------------------------------------------------------------FAQ----------------------------------------------------------------------------------------
Container13, Text13 = FAQ:addParagraph("Why should I use R3TH PRIV?", "At the moment, R3TH PRIV is completely free and without a key system, in contrast to competitors that charge up to $20 for a skidded script.")

Container14, Text14 = FAQ:addParagraph("Does R3TH PRIV log anything?", "No, it's a common misconception that I log users just because the script is free. R3TH PRIV is trusted by over 10,000 individuals; as such, we will never gather information about you without your knowledge.")

Container15, Text15 = FAQ:addParagraph("Why are the scripts all free to use?", "Despite the fact that I have encountered other script owners attempting to remove my script, I will not stop producing free scripts since it has always been my goal to provide all of my users with the greatest experience possible at no price.")

Container16, Text16 = FAQ:addParagraph("How can I submit a bug report?", "If you have any problems using the script, you can report bugs by creating a ticket on the official Discord server at discord.gg/pethicial. The defect will be resolved as soon as possible to allow you to continue using the script.")

--------------------------------------------------------------------------------------KEYBINDS----------------------------------------------------------------------------------------
UniversalKeybind:addKeybind("Enable WalkSpeed", KeyCode, function()
    if ChangeWalkSpeed then
        ChangeWalkSpeed = false
    else
        ChangeWalkSpeed = true
        WalkSpeedFunction()
    end
end, function()
	sendnotification("Enable WalkSpeed keybind changed.", false)
end)

UniversalKeybind:addKeybind("Enable JumpPower", KeyCode, function()
    if ChangeJumpPower then
        ChangeJumpPower = false
    else
        ChangeJumpPower = true
        JumpPowerFunction()
    end
end, function()
	sendnotification("Enable JumpPower keybind changed.", false)
end)

UniversalKeybind:addKeybind("Noclip", KeyCode, function()
    if ChangeNoclip then
        ChangeNoclip = false
    else
        ChangeNoclip = true
        NoclipFunction()
    end
end, function()
	sendnotification("Enable JumpPower keybind changed.", false)
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
	sendnotification("Enable Fly keybind changed.", false)
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
	sendnotification("Xray keybind changed.", false)
end)

UniversalKeybind:addKeybind("Respawn", KeyCode, function()
    Humanoid.Health = 0
end, function()
	sendnotification("Respawn keybind changed.")
end)

UniversalKeybind:addKeybind("Enable Aimbot", KeyCode, function()
    if AimbotEnabled then
        AimbotEnabled = false
        EnableAimbotFunction()
    else
        AimbotEnabled = true
        EnableAimbotFunction()
    end
end, function()
	sendnotification("Enable Aimbot keybind changed.", false)
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
	sendnotification("Fling keybind changed.", false)
end)

UniversalKeybind:addKeybind("Free Camera", KeyCode, function()
    ToggleFreecam()
end, function()
	sendnotification("Free Camera keybind changed.", false)
end)

--------------------------------------------------------------------------------------SETTINGS----------------------------------------------------------------------------------------
Settings:addToggle("Anti Afk", true, function(Value)
    ChangeAntiAFK = Value
end)

Settings:addKeybind("UI Toggle", Enum.KeyCode.LeftControl, function()
	R3TH:toggle()
end, function()
	sendnotification("UI Toggle keybind changed.", false)
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

for theme, color in pairs(Themes) do
	Theme:addColorPicker(theme, color, function(color3)
		R3TH:setTheme(theme, color3)
	end)
end


Credits:addButton("Pethicial", function()
end)

--------------------------------------------------------------------------------------FINISHED----------------------------------------------------------------------------------------
R3TH:SelectPage(R3TH.pages[1], true)

local TimeEnd = tick()
local TotalTime = string.format("%.2f", math.abs(TimeStart - TimeEnd))
sendnotification("Successfully loaded the script in " .. TotalTime .. "s.", nil)

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
