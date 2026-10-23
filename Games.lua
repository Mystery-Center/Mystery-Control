local HttpGet = game.HttpGet
local GameId: number = game.GameId

local DiscordLink = "https://discord.gg/g8NGM8VUD8"

pcall(function()
	local copy = setclipboard or toclipboard or (syn and syn.write_clipboard) or (Clipboard and Clipboard.set)
	if copy then
		copy(DiscordLink)
	end
end)

local Games: { [number]: string } = {
	[1268927906] = "https://raw.githubusercontent.com/Mystery-Center/Mystery-Games/refs/heads/main/Muscle%20Legends.lua",
	[3317771874] = "",
	[2440500124] = "",
}

local URL: string? = Games[GameId]
if not URL or URL == "" then return end

loadstring(HttpGet(game, URL))()
