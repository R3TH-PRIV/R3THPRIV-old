--[[
    R3TH PRIV TOTAL ROBLOX DRAMA SOURCE

    .gg/pethicial

    Credits:
        pethicial
]]

--------------------------------------------------------------------------------------R3THPRIV----------------------------------------------------------------------------------------
repeat wait() until game:IsLoaded()


print("[ R3TH PRIV ]: R3TH PRIV Total Roblox Drama loading...")

local TimeStart = tick()

for i,v in pairs(game.ReplicatedStorage:GetDescendants())do
    if v.Name == "OfficialLobby" then
        MapName = "Lobby"
        break
    elseif v.Name == "Map" and v.ClassName == "StringValue" then
        MapName = v.Value
        break
    end
end

print("[ R3TH PRIV ]: " ..MapName .." detected")

--------------------------------------------------------------------------------------DEFINE----------------------------------------------------------------------------------------
loadstring(game:HttpGet("https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/OtherScripts/Adonis%20Anti-Cheat%20Bypass.lua"))()
wait()

print("[ R3TH PRIV ]: R3TH PRIV's Anti-cheat bypasser activated")

local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/OtherScripts/VenyxUI.lua"))()
local R3TH = library.new("R3TH PRIV | .gg/pethicial", 5013109572)

local Universal = R3TH:addPage("Universal", 5012540623)
local Player = Universal:addSection("Player")
local ESP = Universal:addSection("ESP")
local Target = Universal:addSection("Target")
local Server = Universal:addSection("Server")

local Main0 = R3TH:addPage("Main", 5012544944)
if MapName ~= "Lobby" then
    Teleports = Main0:addSection("Teleports")
    Votes = Main0:addSection("Votes")
    Game0 = Main0:addSection("Game")
    Farm = Main0:addSection("Farm")
else
    Main = Main0:addSection("Main")
end

local Keybinds = R3TH:addPage("Keybinds")
local UniversalKeybind = Keybinds:addSection("Universal")

local Settings0 = R3TH:addPage("Settings", 5012544372)
local Settings = Settings0:addSection("Settings")
local Credits = Settings0:addSection("Credits")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
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

local DefaultWalkSpeed = Humanoid.WalkSpeed
local DefaultJumpPower = Humanoid.JumpPower
local WalkSpeedSlider = DefaultWalkSpeed
local JumpPowerSlider = DefaultJumpPower
FlySpeedSlider = 50
ChangeAntiAFK = true
ChangeAnswerDelay = 0

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

function TeleportPlayer(Position, Offset)
    HumanoidRootPart.CFrame = Position * Offset
end

function HidePlayers()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local character = player.Character
            if character then
                for _, descendant in pairs(character:GetDescendants()) do
                    if descendant:IsA("BasePart") or descendant:IsA("MeshPart") then
                        descendant.Transparency = descendant.Name == "HumanoidRootPart" and 1 or (hideplayersloop and 1 or 0)
                    elseif descendant:IsA("Accessory") then
                        local handle = descendant:FindFirstChild("Handle")
                        if handle then
                            handle.Transparency = hideplayersloop and 1 or 0
                        end
                    elseif descendant.Name == "Sector" then
                        hidenametags = not hideplayersloop
                        descendant.Visible = hidenametags
                    end
                end
            end
        end
    end
end

--------------------------------------------------------------------------------------EXTRA----------------------------------------------------------------------------------------
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
    local name = Value.Name
    table.insert(playerlist,name)
end)

Players.PlayerRemoving:Connect(function(Value)
    local name = Value.Name
    for i,v in pairs(playerlist)do
        if v == name then  
            table.remove(playerlist,i)
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

if MapName ~= "Lobby" then
    ReplicatedStorage.Season.Voting.Votes.ChildAdded:Connect(function(v)
        local PlayerVoted = ReplicatedStorage.Season.Players[v.Value].Value
        local PlayerPicked = ReplicatedStorage.Season.Players[v.Name].Value
        local message = PlayerVoted .." voted for " ..PlayerPicked
        if ChangeNotifyVotes then
            sendnotification(message)
        end
        if ChangePrintVotes then
            print(message)
        end
        if ChangeExposeVotes then
            ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
        end
    end)
end

--------------------------------------------------------------------------------------KEYBINDS----------------------------------------------------------------------------------------
function WalkSpeedFunction()
    while ChangeWalkSpeed and task.wait() do
        if ChangeWalkSpeed then
            Humanoid.Walkspeed = WalkSpeedSlider
        else
            Humanoid.WalkSpeed = DefaultWalkSpeed
        end
    end
end

function JumpPowerFunction()
    while ChangeJumpPower and task.wait() do
        if ChangeJumpPower then
            Humanoid.JumpPower = JumpPowerSlider
        else
            Humanoid.JumpPower = DefaultJumpPower
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

--------------------------------------------------------------------------------------MAIN----------------------------------------------------------------------------------------

if MapName ~= "Lobby" then
    Teleports:addButton("Teleport to Camp", function()
        if MapName == "Camp" then
            LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(147, -16, -414)
        elseif MapName == "Movies" then
            LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-21, 52, 4)
        elseif MapName == "Expedition" then
            LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(42, 97, -36)
        end
        wait()
    end)

    if MapName == "Camp" then
        Teleports:addButton("Teleport to Exile", function()
            LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-77, -15, -158)
            wait()
        end)
    end

    Teleports:addButton("Teleport to Voting", function()
        if MapName == "Camp" then
            LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-10, 93, -530)
        elseif MapName == "Movies" then
            LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(59, 56, -172)
        elseif MapName == "Expedition" then
            LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-120, 97, -29)
        end
        wait()
    end)
    
    Teleports:addButton("Teleport to Game", function()   ---- fix the telport
        if MapName == "Camp" then
            LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(143, -16, -231)
        elseif MapName == "Movies" then
            LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(292, 52, -206)
        elseif MapName == "Expedition" then
            LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-70, 276, 317)
        end
        wait()
    end)

    Teleports:addButton("Teleport to Spectators", function()
        if MapName == "Camp" then
            LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(36, -17, 8)
        elseif MapName == "Movies" then
            LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-672, -67, -619)
        elseif MapName == "Expedition" then
            LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-65, -28, -891)
        end
        wait()
    end)

    Votes:addToggle("Notify Votes", false, function(Value)
        ChangeNotifyVotes = Value
    end)

    Votes:addToggle("Print Votes", false, function(Value)
        ChangePrintVotes = Value
    end)

    Votes:addToggle("Expose Votes", false, function(Value)
        ChangeExposeVotes = Value
    end)

    Game0:addToggle("Hide Players", false, function(Value)
        ChangeHidePlayers = Value
        while ChangeHidePlayers and task.wait() do
            HidePlayers()
        end
    end)

    Game0:addToggle("Force Move", false, function(Value)
        ChangeForceMove = Value
        while ChangeForceMove and task.wait() do
            if Humanoid.WalkSpeed == 0 then
                Humanoid.WalkSpeed = (DefaultWalkSpeed)
            end
        end
    end)

    Game0:addToggle("Walk on Water", false, function(Value)
        for i,v in pairs (Workspace:GetDescendants()) do
            if v.Name == "Water" then
                v.CanCollide = Value
            elseif v.Name == "water" then
                v.CanCollide = Value
            end
        end
    end)

    Game0:addToggle("Remove Barriers", false, function(Value)
        for i,v in pairs (Workspace:GetDescendants()) do
            if v.Name == "Glass" then
                v.CanCollide = Value
            end
        end
    end)

    Game0:addTextbox("Change Confession", "", function(Value, focusLost)
        ReplicatedStorage.Events.Confessional:FireServer(Value)
    end)

    if R3THDEVICE == "Mobile" then
        Farm:addTextbox("Answer Delay", 0, function(Value, focusLost)
            ChangeAnswerDelay = Value
        end)
    else
        Farm:addSlider("Answer Delay", 0, 0, 10, function(Value)
            ChangeAnswerDelay = Value
        end)
    end

    Farm:addToggle("Auto Math Triva", false, function(Value)
        ChangeAutoMathTriva = Value
        while ChangeAutoMathTriva and task.wait() do
            LoopCount = 0
            for i = 1, 10 do
                if ChangeAutoMathTriva then
                    LoopCount = LoopCount + 1
                    local QuizText = LocalPlayer.PlayerGui.MathMania[LoopCount].MainText.Text
                    local RemovedExtra = QuizText:gsub("[=? ]","")
                    local SolvedAnswer = loadstring("return " .. RemovedExtra)()
                    task.wait()
                    LocalPlayer.PlayerGui.MathMania[LoopCount].Box.Text = SolvedAnswer
                    task.wait()
                    local button = LocalPlayer.PlayerGui.MathMania[LoopCount].Enter
                    local events = {"MouseButton1Click", "MouseButton1Down", "Activated"}
                    for _, event in ipairs(events) do
                        for _, connection in ipairs(getconnections(button[event])) do
                            connection:Fire()
                        end
                    end
                    task.wait(ChangeAnswerDelay)
                end
            end
        end
    end)

    Farm:addToggle("Auto Win Obbys", false, function(Value)
        ChangeAutoWinObbys = Value
        while ChangeAutoWinObbys and task.wait() do
            for i,v in pairs (Workspace:GetDescendants()) do
                if v.Name == "Finish" then
                    v.CanCollide = false
                    v.Transparency = 1
                    v.Position = Character.Torso.Position
                end
            end
        end
    end)

    if MapName == "Movies" then
        Farm:addToggle("Monster Godmode", false, function(Value)
            ChangeMonsterGodmode = Value
            while ChangeMonsterGodmode and task.wait() do
                for i,v in pairs (Workspace.Monster:GetDescendants()) do
                    if v.Name == "TouchInterest" then
                        v:Destroy()
                    end
                end
            end
        end)
    end

    if MapName == "Movies" then
        Farm:addToggle("Auto Collect Alien Egg", false, function(Value)
            ChangeAutoCollectAlienEgg = Value
            while ChangeAutoCollectAlienEgg and task.wait() do
                for i,v in pairs (Workspace.Assets.Alien.Eggs:GetDescendants()) do
                    if v == LocalPlayer then
                        v.CanCollide = false
                        v.Position = Character.Torso.Position
                    end
                end
            end
        end)
    end

    if MapName == "Movies" then
        Farm:addToggle("Auto Collect Guitars", false, function(Value)
            ChangeAutoCollectGuitars = Value
            while ChangeAutoCollectGuitars and task.wait() do
                for i,v in pairs (Workspace:GetDescendants()) do
                    if v.Name == "Coin" then
                        v.CanCollide = false
                        v.Position = Character.Torso.Position
                    end
                end
            end
        end)
    end

    if MapName == "Movies" then
        Farm:addToggle("Auto Collect Pre-Historic Coins", false, function(Value)
            ChangeAutoCollectPreHistoricCoins = Value
            while ChangeAutoCollectPreHistoricCoins and task.wait() do
                for i,v in pairs (Workspace:GetDescendants()) do
                    if v.Name == "Coin" then
                        v.CanCollide = false
                        v.Position = Character.Torso.Position
                    end
                end
            end
        end)
    end

    if MapName == "Camp" then
        Farm:addToggle("Auto Collect All Coins", false, function(Value)
            ChangeAutoCollectAllCoins = Value
            while ChangeAutoCollectAllCoins and task.wait() do
                for _, v in ipairs(Workspace:GetChildren()) do
                    if v.Name == "Gem" or v.Name == "Coin" then
                        v.Transparency = 1
                        v.Position = Character.Torso.Position
                    end
                end
            end
        end)
    end

    Farm:addToggle("Auto Get Trophy", false, function(Value)
        ChangeAutoGetTrophy = Value
        while ChangeAutoGetTrophy and task.wait() do
            for _, v in ipairs(Workspace.Idols:GetChildren()) do
                if v.Name == "Bag" or v.Name == "SafetyStatue" then
                    v.hit.Transparency = 1
                    v.hit.CanCollide = false
                    v.hit.Position = Character.Torso.Position
                    if v.Name == "Bag" then
                        v:Destroy()
                    end
                end
            end
        end
    end)    
else
    Main:addButton("Load into a game mode so the scripts load.", function()
    end)
end

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

UniversalKeybind:addKeybind("Free Camera", KeyCode, function()
    ToggleFreecam()
end, function()
	print("[ R3TH PRIV ] Free Camera keybind changed.")
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

--------------------------------------------------------------------------------------FINISHED----------------------------------------------------------------------------------------
R3TH:SelectPage(R3TH.pages[1], true)

local TimeEnd = tick()
local TotalTime = string.format("%.2f", math.abs(TimeStart - TimeEnd))
print("[ R3TH PRIV ]: Successfully loaded the script in " .. TotalTime .. "s.")
sendnotification("Successfully loaded the script in " .. TotalTime .. "s.")
