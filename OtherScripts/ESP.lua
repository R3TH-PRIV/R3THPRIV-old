-- Synapse X ESP Library for Roblox

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = game.Workspace.CurrentCamera

local ESP = {}

ESP.Settings = {
    NameEnabled = true,
    BoxEnabled = true,
    HealthEnabled = true,
    TeamCheckEnabled = true,
    WallCheckEnabled = true,
    TracesEnabled = true,
    DistanceEnabled = true,
}

-- Function to draw ESP elements
function ESP.DrawESP(player)
    local character = player.Character
    if not character then return end
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    local head = character:FindFirstChild("Head")
    
    if not humanoid or not rootPart or not head then return end
    
    local onScreen, position = Camera:WorldToViewportPoint(rootPart.Position)
    if not onScreen then return end
    
    -- Name
    if ESP.Settings.NameEnabled then
        local nameLabel = Drawing.new("Text")
        nameLabel.Text = player.Name
        nameLabel.Position = Vector2.new(position.X, position.Y)
        nameLabel.Size = 14
        nameLabel.Color = Color3.fromRGB(255, 255, 255)
        nameLabel.Center = true
        nameLabel.Visible = true
        nameLabel.Outline = true
        nameLabel.OutlineColor = Color3.fromRGB(0, 0, 0)
        nameLabel.Font = Drawing.Fonts.UI
        nameLabel.Visible = true
        nameLabel.ZIndex = 2
    end
    
    -- Box
    if ESP.Settings.BoxEnabled then
        local headPosition, headVisible = Camera:WorldToViewportPoint(head.Position + head.CFrame.UpVector * 2.5)
        local legPosition, legVisible = Camera:WorldToViewportPoint(rootPart.Position - rootPart.CFrame.UpVector * 2)
        
        if headVisible and legVisible then
            local box = Drawing.new("Square")
            box.Position = Vector2.new(legPosition.X, legPosition.Y)
            box.Size = Vector2.new(headPosition.X - legPosition.X, headPosition.Y - legPosition.Y)
            box.Color = Color3.fromRGB(255, 0, 0)
            box.Thickness = 2
            box.Visible = true
            box.Filled = false
            box.ZIndex = 1
        end
    end
    
    -- Health
    if ESP.Settings.HealthEnabled then
        local healthBarPosition, visible = Camera:WorldToViewportPoint(rootPart.Position + Vector3.new(0, 3, 0))
        local healthBarSize = Vector2.new(50, 4)
        
        if visible then
            local healthBar = Drawing.new("Rectangle")
            healthBar.Position = Vector2.new(healthBarPosition.X - healthBarSize.X / 2, healthBarPosition.Y - healthBarSize.Y / 2)
            healthBar.Size = healthBarSize
            healthBar.Color = Color3.fromRGB(0, 255, 0)
            healthBar.Thickness = 1
            healthBar.Filled = true
            healthBar.Visible = true
            healthBar.ZIndex = 2
            
            local health = humanoid.Health / humanoid.MaxHealth
            healthBar.Size = Vector2.new(healthBarSize.X * health, healthBarSize.Y)
        end
    end
    
    -- Team check (example: red for enemies, green for allies)
    if ESP.Settings.TeamCheckEnabled then
        if player.Team ~= Players.LocalPlayer.Team then
            -- Customize color based on team
        end
    end
    
    -- Wall check (example: draw line to show if there's a wall between player and camera)
    if ESP.Settings.WallCheckEnabled then
        -- Check for walls between player and camera
        -- Draw line or indicator
    end
    
    -- Traces (example: draw line from camera to player's head)
    if ESP.Settings.TracesEnabled then
        local headPosition, headVisible = Camera:WorldToViewportPoint(head.Position)
        
        if headVisible then
            local trace = Drawing.new("Line")
            trace.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
            trace.To = Vector2.new(headPosition.X, headPosition.Y)
            trace.Color = Color3.fromRGB(255, 255, 255)
            trace.Thickness = 1
            trace.Visible = true
            trace.Transparency = 0.5
            trace.ZIndex = 1
        end
    end
    
    -- Distance indicator
    if ESP.Settings.DistanceEnabled then
        local distance = (rootPart.Position - Camera.CFrame.Position).Magnitude
        local distanceLabel = Drawing.new("Text")
        distanceLabel.Text = string.format("%.1f studs", distance)
        distanceLabel.Position = Vector2.new(position.X, position.Y + 20)
        distanceLabel.Size = 14
        distanceLabel.Color = Color3.fromRGB(255, 255, 255)
        distanceLabel.Center = true
        distanceLabel.Visible = true
        distanceLabel.Outline = true
        distanceLabel.OutlineColor = Color3.fromRGB(0, 0, 0)
        distanceLabel.Font = Drawing.Fonts.UI
        distanceLabel.Visible = true
        distanceLabel.ZIndex = 2
    end
end

-- Function to update ESP based on player visibility and settings
function ESP.Update()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            ESP.DrawESP(player)
        end
    end
end

-- Toggle ESP settings
function ESP.ToggleSetting(settingName)
    if ESP.Settings[settingName] ~= nil then
        ESP.Settings[settingName] = not ESP.Settings[settingName]
        ESP.Update()
    end
end

-- Example UI toggle buttons (you need to create GUI for these)
Player:addToggle("Names", true, function(enabled)
    ESP.ToggleSetting("NameEnabled")
end)

Player:addToggle("Boxes", true, function(enabled)
    ESP.ToggleSetting("BoxEnabled")
end)

Player:addToggle("Health Bars", true, function(enabled)
    ESP.ToggleSetting("HealthEnabled")
end)

Player:addToggle("Team Check", true, function(enabled)
    ESP.ToggleSetting("TeamCheckEnabled")
end)

Player:addToggle("Wall Check", true, function(enabled)
    ESP.ToggleSetting("WallCheckEnabled")
end)

Player:addToggle("Traces", true, function(enabled)
    ESP.ToggleSetting("TracesEnabled")
end)

Player:addToggle("Distance", true, function(enabled)
    ESP.ToggleSetting("DistanceEnabled")
end)

-- Main loop to continuously update ESP visuals
RunService.RenderStepped:Connect(function()
    ESP.Update()
end)

return ESP
