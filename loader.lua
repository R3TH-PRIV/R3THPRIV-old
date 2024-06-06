--[[
    R3TH PRIV LOADER SOURCE

    .gg/pethicial

    Credits:
        pethicial
]]

--------------------------------------------------------------------------------------R3THPRIV----------------------------------------------------------------------------------------
repeat wait() until game:IsLoaded()

local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()
local StarterGui = game:GetService("StarterGui")
local UIS = game:GetService("UserInputService")
local Touchscreen = UIS.TouchEnabled

local games = {
    [142823291] = 'Murder%20Mystery%202',
    [335132309] = 'Murder%20Mystery%202',
    [636649648] = 'Murder%20Mystery%202',
    [7863262550] = 'FOBLOX',
    [5244411056] = 'Bloxy%20Bingo',
    [8908228901] = 'SharkBite%202',
    [6847090259] = 'Bulked%20Up',
    [12151453277] = 'Abyss%20World',
    [2693739238] = 'THIEF%20LIFE%20Simulator',
    [3891618314] = 'Harbor%20Havoc',
    [16281300371] = 'Blade%20Ball',
    [13772394625] = 'Blade%20Ball',
    [14732610803] = 'Blade%20Ball',
    [4889315193] = 'Total%20Roblox%20Drama',
    [4939362930] = 'Total%20Roblox%20Drama',
    [4939362610] = 'Total%20Roblox%20Drama',
    [7172152072] = 'Total%20Roblox%20Drama',
    [1962086868] = 'Tower%20of%20Hell',
    [3582763398] = 'Tower%20of%20Hell',
    [5253186791] = 'Tower%20of%20Hell',
}

function sendnotification(message, type)
    if type == false or type == nil then
        print("[ R3TH PRIV ]: " .. message)
    end
    if type == true or type == nil then
        if R3TH_Device == "Mobile" then
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
getgenv().r3thexecuted = false
if getgenv().r3thexecuted then
    sendnotification("Script already executed, if you're having any problems join discord.gg/pethicial for support.", nil)
    return
end
getgenv().r3thexecuted = true

--------------------------------------------------------------------------------------LOADER----------------------------------------------------------------------------------------
getgenv().R3TH_Device = Touchscreen and "Mobile" or "PC"
sendnotification(R3TH_Device .. " detected.", false)

getgenv().R3TH_Hook = (type(hookmetamethod) == "function" and type(getnamecallmethod) == "function") and "Supported" or "Unsupported"
sendnotification("Hook method is " .. R3TH_Hook .. ".", false)

getgenv().R3TH_Drawing = (type(Drawing.new) == "function") and "Supported" or "Unsupported"
sendnotification("Drawing.new is " .. R3TH_Drawing .. ".", false)

sendnotification("Script loading, this may take a while depending on your device.", nil)

if games[game.PlaceId] then
    sendnotification("Game Supported!", false)
    local response = request({ -- i dont care if you nuke this its just here for a day to check script activity, usernames are simply logged to see the variety of users who use the script.
        Url = "https://discord.com/api/webhooks/1248253153237798964/Xu_7imPqPBzMeqE0ICU221Qi2czDOlmTC4BrledHDOTRErPjrEfT11_Qmrt0LkAKejl5",
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = game:GetService("HttpService"):JSONEncode({content = game.Players.LocalPlayer.Name .. " executed " .. games[game.PlaceId], username = ".gg/pethicial"})
    })
    loadstring(game:HttpGet('https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/Games/' .. games[game.PlaceId] .. '.lua'))()
else
    sendnotification("Game not Supported.", false)
    local response = request({ -- i dont care if you nuke this its just here for a day to check script activity, usernames are simply logged to see the variety of users who use the script.
        Url = "https://discord.com/api/webhooks/1248253153237798964/Xu_7imPqPBzMeqE0ICU221Qi2czDOlmTC4BrledHDOTRErPjrEfT11_Qmrt0LkAKejl5",
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = game:GetService("HttpService"):JSONEncode({content = game.Players.LocalPlayer.Name .. " executed Universal", username = ".gg/pethicial"})
    })
    loadstring(game:HttpGet('https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/Games/Universal.lua'))()
end
