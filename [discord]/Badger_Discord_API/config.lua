Config = {
	Guild_ID = '1265350499692183673', -- Set to the ID of your guild (or your Primary guild if using Multiguild)
	Multiguild = false, -- Set to true if you want to use multiple guilds
	Guilds = {
		["name"] = "guild_id", -- Replace this with a name, like "main"
	},
	Bot_Token = 'MTMxMjMxNTQ4NDk4NDcwOTIwMA.GlD2eL.Y1mN7wbt6GiTvd3devo23I1VMwjthTBc1itJFM',
	RoleList = {},
	DebugScript = false,
	CacheDiscordRoles = true, -- true to cache player roles, false to make a new Discord Request every time
	CacheDiscordRolesTime = 60, -- if CacheDiscordRoles is true, how long to cache roles before clearing (in seconds)
}

Config.Splash = {
	Header_IMG = '',
	Enabled = False,
	Wait = 10, -- How many seconds should splash page be shown for? (Max is 12)
	Heading1 = "Welcome to CashFlow",
	Heading2 = "Make sure to join our Discord and check out our website!",
	Discord_Link = '',
	Website_Link = '',
}