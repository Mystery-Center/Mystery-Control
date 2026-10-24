local HttpGet = game.HttpGet
local GameId = game.GameId
local DiscordLink = "https://discord.gg/g8NGM8VUD8"
pcall(function()
    local copy = setclipboard or toclipboard or (syn and syn.write_clipboard) or (Clipboard and Clipboard.set)
    if copy then
        copy(DiscordLink)
    end
end)
local Games = {
    [1268927906] = "https://raw.githubusercontent.com/Mystery-Center/Roblox-Games/refs/heads/main/Muscle%20Legends.lua", -- Muscle Legends
    [66654135] = "https://raw.githubusercontent.com/Mystery-Center/Roblox-Games/refs/heads/main/Murder%20Mystery%202.lua", -- Murder Mystery 2
    [2440500124] = "", -- Soon New Game 
}
local URL = Games[GameId]
if not URL or URL == "" then return end
local Success, Source = pcall(function()
    return HttpGet(game, URL)
end)
if not Success or not Source or Source == "" then return end
local Execute = loadstring(Source)
if not Execute then return end
pcall(Execute)
