local HttpGet = game.HttpGet
local GameId: number = game.GameId

local Games: { [number]: string } = {
	[1268927906]  = "https://raw.githubusercontent.com/Mystery-Center/Mystery-Games/refs/heads/main/Muscle%20Legends.lua",
	[3317771874] = "",
	[2440500124] = "",
}

local URL: string? = Games[GameId]
if not URL then return end

loadstring(HttpGet(game, URL))()
