--[[
    R3TH PRIV LOADER SOURCE

    Credits:
        pethicial
]]

assert(getgenv, "Exploit unsupported")

local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
    Title = "R3TH PRIV";
    Text = "R3TH PRIV V2 coming out soon join for updates! https://discord.gg/pethicial";
    Duration = 10;
}) 

print("[ R3TH PRIV ]: R3TH PRIV V2 coming out soon join for updates! https://discord.gg/pethicial")

local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()
local StarterGui = game:GetService("StarterGui")

function sendnotification(notificationmessage)
    if WVryGeXr38ZZtdJWtrBtyeEKdm9Kkweaxm7tnUpuCcH835AQN2aLxV2NeG76kYZuWnCZz4yRr == true then
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

if zac5mDuh2AXjsBebYVg6ZSMEf4yxQkw8dRLNGKHF7J9CPT3qWp then
    print("[ R3TH PRIV ]: Script already executed, if your having any problems join discord.gg/pethicial for support.")
    sendnotification("Script already executed, if your having any problems join discord.gg/pethicial for support.")
    return
end

getgenv().zac5mDuh2AXjsBebYVg6ZSMEf4yxQkw8dRLNGKHF7J9CPT3qWp = true

wait()
print("[ R3TH PRIV ]: R3TH PRIV LOADING...")

local UIS = game:GetService("UserInputService")
local PC, PCwithTouch, Touchscreen = (UIS.MouseEnabled and UIS.KeyboardEnabled), (UIS.MouseEnabled and UIS.KeyboardEnabled and UIS.TouchEnabled), UIS.TouchEnabled
if Touchscreen == true then
    device = "Mobile"
    getgenv().WVryGeXr38ZZtdJWtrBtyeEKdm9Kkweaxm7tnUpuCcH835AQN2aLxV2NeG76kYZuWnCZz4yRr = true
else
    device = "PC"
    getgenv().WVryGeXr38ZZtdJWtrBtyeEKdm9Kkweaxm7tnUpuCcH835AQN2aLxV2NeG76kYZuWnCZz4yRr = false
end

print("[ R3TH PRIV ]: " ..device .." detected")

sendnotification("Script loading, this may take awhile depending on your device.")

function getexploit()
    if identifyexecutor == nil then return "Unsupported" end
    local exploit = identifyexecutor()
    if not exploit:find("Krampus") then return "Unsupported" end
  
    return exploit
end

print("[ R3TH PRIV ]: " ..getexploit() .." detected")
if getexploit() == "Unsupported" then
    print("[ R3TH PRIV ]: Unsupported executor detected, some scripts may not work.")
    sendnotification(`{getexploit()} isn't fully supported right now, you may experience some bugs.`)
end

request({
    Url = 'http://127.0.0.1:6463/rpc?v=1',
    Method = 'POST',
    Headers = {
        ['Content-Type'] = 'application/json',
        Origin = 'https://discord.com'
    },
    Body = game:GetService("HttpService"):JSONEncode({
        cmd = 'INVITE_BROWSER',
        nonce = game:GetService("HttpService"):GenerateGUID(false),
        args = {code = "pethicial"}
    })
})

if game.PlaceId == (142823291 or 335132309 or 636649648) then
    print("[ R3TH PRIV ]: Game Supported!")
    loadstring(game:HttpGet('https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/Games/Murder%20Mystery%202.lua'))()
elseif game.PlaceId == 7863262550 then
    print("[ R3TH PRIV ]: Game Supported!")
    loadstring(game:HttpGet('https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/Games/FOBLOX.lua'))()
elseif game.PlaceId == 5244411056 then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/Games/Bloxy%20Bingo.lua'))()
elseif game.PlaceId == 8908228901 then
    print("[ R3TH PRIV ]: Game Supported!")
    loadstring(game:HttpGet('https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/Games/SharkBite%202.lua'))()
elseif game.PlaceId == 6847090259 then
    print("[ R3TH PRIV ]: Game Supported!")
    loadstring(game:HttpGet('https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/Games/Bulked%20Up.lua'))()
elseif game.PlaceId == 12151453277 then
    print("[ R3TH PRIV ]: Game Supported!")
    loadstring(game:HttpGet('https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/Games/Abyss%20World.lua'))()
elseif game.PlaceId == 2693739238 then
    print("[ R3TH PRIV ]: Game Supported!")
    loadstring(game:HttpGet('https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/Games/THIEF%20LIFE%20Simulator.lua'))()
elseif game.PlaceId == 3891618314 then
    print("[ R3TH PRIV ]: Game Supported!")
    loadstring(game:HttpGet('https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/Games/Harbor%20Havoc.lua'))()
elseif game.PlaceId == 13772394625 then
    print("[ R3TH PRIV ]: Game Supported!")
    loadstring(game:HttpGet('https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/Games/Blade%20Ball.lua'))()
elseif game.PlaceId == 14732610803 then
    print("[ R3TH PRIV ]: Game Supported!")
    loadstring(game:HttpGet('https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/Games/Blade%20Ball.lua'))()
elseif game.PlaceId == 4889315193 then
    print("[ R3TH PRIV ]: Game Supported!")
    loadstring(game:HttpGet('https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/Games/Total%20Roblox%20Drama.lua'))()
elseif game.PlaceId == 4939362930 then
    print("[ R3TH PRIV ]: Game Supported!")
    loadstring(game:HttpGet('https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/Games/Total%20Roblox%20Drama.lua'))()
elseif game.PlaceId == 4939362610 then
    print("[ R3TH PRIV ]: Game Supported!")
    loadstring(game:HttpGet('https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/Games/Total%20Roblox%20Drama.lua'))()
elseif game.PlaceId == 7172152072 then
    print("[ R3TH PRIV ]: Game Supported!")
    loadstring(game:HttpGet('https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/Games/Total%20Roblox%20Drama.lua'))()
elseif game.PlaceId == 1962086868 then
    print("[ R3TH PRIV ]: Game Supported!")
    loadstring(game:HttpGet('https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/Games/Tower%20of%20Hell.lua'))()
elseif game.PlaceId == 3582763398 then
    print("[ R3TH PRIV ]: Game Supported!")
    loadstring(game:HttpGet('https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/Games/Tower%20of%20Hell.lua'))()
elseif game.PlaceId == 5253186791 then
    print("[ R3TH PRIV ]: Game Supported!")
    loadstring(game:HttpGet('https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/Games/Tower%20of%20Hell.lua'))()
else
    print("[ R3TH PRIV ]: Game not Supported.")
    loadstring(game:HttpGet('https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/Games/Universal.lua'))()
end
