--// GAY EL QUE LO LEA
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RbxAnalytics = game:GetService("RbxAnalyticsService")


local DISCORD = "discord.gg/a3xJ9FuJK9"


local ValidKeys = {
    ["NOV-4J1-8101"] = nil,
    ["N1O-V47-HL30"] = nil,
    ["AJX-92K-LQ11"] = nil,
    ["XQ2-81M-ZP55"] = nil,
    ["NVH-44Q-PL92"] = nil,
    ["KJ9-AQ2-18XZ"] = nil,
    ["NOA-71L-VVB2"] = nil,
    ["PV9-21Z-KK10"] = nil,
    ["TRX-91B-QW82"] = nil,
    ["JS8-22L-MM19"] = nil
}


local USER_KEY = getgenv().ScriptKey
local HWID = RbxAnalytics:GetClientId()

local function Kick(msg)
    task.wait(0.25)
    LocalPlayer:Kick(msg)
end


if typeof(USER_KEY) ~= "string" or USER_KEY == "" then
    Kick("NO KEY FOUND | BUY IN " .. DISCORD)
    return
end

if not ValidKeys[USER_KEY] then
    Kick("KEY IS INVALID | BUY IN " .. DISCORD)
    return
end


if ValidKeys[USER_KEY] == nil then

    ValidKeys[USER_KEY] = HWID
else

    if ValidKeys[USER_KEY] ~= HWID then
        Kick("HWID MISMATCH | KEY LOCKED TO ANOTHER DEVICE")
        return
    end
end


local success, err = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/TakeScripts/Src/main/AutoJoiner.lua"))()
end)

if not success then
    warn("Failed to load AutoJoiner:", err)
end
