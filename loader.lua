--[[
    R3TH PRIV LOADER SOURCE

    It should be noted that this script is rather messy and not recommended for learning off because it is many months old and my first script hub ever.
    V2 is being developed, and now that I've had six months of experience with lua, I can create a much better script hub.
    .gg/pethicial

    Credits:
        pethicial
]]

--------------------------------------------------------------------------------------R3THPRIV----------------------------------------------------------------------------------------
local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

function sendnotification(notfiicationmessage)
    if R3THDEVICE == "Mobile" then
        game:GetService("StarterGui"):SetCore("SendNotification", {
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

if r3thexecuted then
    print("[ R3TH PRIV ]: Script already executed, if your having any problems join discord.gg/pethicial for support.")
    sendnotification("Script already executed, if your having any problems join discord.gg/pethicial for support.")
    return
end

getgenv().r3thexecuted = true

local UIS = game:GetService("UserInputService")
local PC, PCwithTouch, Touchscreen = (UIS.MouseEnabled and UIS.KeyboardEnabled), (UIS.MouseEnabled and UIS.KeyboardEnabled and UIS.TouchEnabled), UIS.TouchEnabled
if Touchscreen == true then
    getgenv().R3THDEVICE = "Mobile"
else
    getgenv().R3THDEVICE = "PC"
end

if type(hookmetamethod) and type(getnamecallmethod) == "function" then
    print("Supported")
else
    print("Unsupported")
end

if R3THEXECUTOR == "Unsupported" then
    print("[ R3TH PRIV ]: Unsupported executor detected, some scripts may not work.")
    sendnotification("Unsupported executor detected, some scripts may not work.")
end

print("[ R3TH PRIV ]: Script loading, this may take awhile depending on your device.")
sendnotification("Script loading, this may take awhile depending on your device.")

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
elseif game.PlaceId == 13772394625 then
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
