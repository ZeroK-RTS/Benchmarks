local planetUtilities = VFS.Include("campaign/sample/planetUtilities.lua")
--local AI_NAME = "CircuitAIBrutal"
--local AI_BIT = true

local AI_NAME = "NullAI"
local AI_BIT = false

-- Team pattern: 01011010

local gameConfig = {
	mapName = "ScorpioBattleground",
	gameName = "Zero-K Benchmark v1.8.2.5",
	playerConfig = {
		startX = 1475,
		startZ = 400,
		allyTeam = 0,
		isSpectator = true,
	},
	modoptions = {
		singleplayercampaignbattleid = -1,
	},
	aiConfig = {
		{
			startX = 4904,
			startZ = 3500,
			aiLib = AI_NAME,
			bitDependant = AI_BIT,
			allyTeam = 0,
			startUnits = {}
		},
		{
			startX = 4904,
			startZ = 3500,
			aiLib = AI_NAME,
			bitDependant = AI_BIT,
			allyTeam = 1,
			startUnits = {}
		},
	}
}

-- Merge AIs with the same allyTeam
--local aiConfig = gameConfig.aiConfig
--local teams = {}
--for i = 1, #aiConfig do
--	local data = aiConfig[i]
--	local allyNum = data.allyTeam + 1
--	if teams[allyNum] then
--		local units = data.startUnits
--		local teamUnits = teams[allyNum].startUnits
--		for j = 1, #units do
--			teamUnits[#teamUnits + 1] = units[j]
--		end
--	else
--		teams[allyNum] = data
--	end
--end
--gameConfig.aiConfig = teams

return gameConfig
