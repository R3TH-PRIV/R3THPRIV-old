--[[
    R3TH PRIV PARTICLES SOURCE

    .gg/pethicial

    Credits:
        pethicial
]]

local Players = game:GetService("Players")

function AddParticles(player)
    local character = player.Character
    repeat wait() until character
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
end

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

local function isInUserIdList(UserId)
    for i, v in ipairs(UserIds) do
        if UserId == v then
            return true
        end
    end
    return false
end

local function AddListener(player)
    if player ~= Players.LocalPlayer then
        player.CharacterAdded:Connect(function(character)
            AddParticles(player)
            AddNameTag(player)
        end)
        AddParticles(player)
        AddNameTag(player)
    end
end

for i,v in pairs(Players:GetPlayers()) do
    if isInUserIdList(v.UserId) then
        AddListener(v)
    end
end

Players.PlayerAdded:Connect(function(player)
    if isInUserIdList(player.UserId) then
        AddListener(player)
    end
end)
