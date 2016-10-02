function gadget:GetInfo()
	return {
		name      = "Prespawn Spam",
		desc      = "Spawns start units",
		author    = "Google Frog",
		date      = "25 September 2014",
		license   = "GNU GPL, v2 or later",
		layer     = 1,
		enabled   = true -- loaded by default?
	}
end 

if not (gadgetHandler:IsSyncedCode()) then
	return 
end
local first = true

local spawnDist = 2048
local mapWidth = 8192

function gadget:GameFrame(f)
	if f == 6 or first then
		local defID = UnitDefNames["base"].id
		
		for i = 1, 30 do
			local unitID = Spring.CreateUnit(defID, spawnDist, 92, i*256, 1, 0)
			--Spring.GiveOrderToUnit(unitID, CMD.MOVE, {mapWidth/4, 92, i*256}, {"shift"})
			Spring.GiveOrderToUnit(unitID, CMD.FIGHT, {mapWidth/2, 92, i*256}, {"shift"})
			Spring.GiveOrderToUnit(unitID, CMD.FIGHT, {mapWidth*3/4, 92, i*256}, {"shift"})
			Spring.GiveOrderToUnit(unitID, CMD.FIGHT, {mapWidth-spawnDist, 92, i*256}, {"shift"})
			Spring.GiveOrderToUnit(unitID, CMD.REPEAT, {1}, {})
			Spring.GiveOrderToUnit(unitID, -UnitDefNames["tank5"].id, {}, {})
		end
		
		for i = 1, 30 do
			local unitID = Spring.CreateUnit(defID, mapWidth - spawnDist, 92, i*256, 3, 1)
			--Spring.GiveOrderToUnit(unitID, CMD.MOVE, {mapWidth*3/4, 92, i*256}, {"shift"})
			Spring.GiveOrderToUnit(unitID, CMD.FIGHT, {mapWidth/2, 92, i*256}, {"shift"})
			Spring.GiveOrderToUnit(unitID, CMD.FIGHT, {mapWidth/4, 92, i*256}, {"shift"})
			Spring.GiveOrderToUnit(unitID, CMD.FIGHT, {spawnDist, 92, i*256}, {"shift"})
			Spring.GiveOrderToUnit(unitID, CMD.REPEAT, {1}, {})
			Spring.GiveOrderToUnit(unitID, -UnitDefNames["tank5"].id, {}, {})
		end
		
		--Spring.CreateUnit(defID, 1280, 92, 512, 1, 0)
		--Spring.CreateUnit(defID, 4864, 92, 512, 3, 1)
		--Spring.CreateUnit(defID, 1280, 92, 7680, 1, 0)
		--Spring.CreateUnit(defID, 4864, 92, 7680, 3, 1)
		--
		--Spring.CreateUnit(defID, 1280, 92, 2048, 1, 0)
		--Spring.CreateUnit(defID, 4864, 92, 2048, 3, 1)
		--Spring.CreateUnit(defID, 1280, 92, 6144, 1, 0)
		--Spring.CreateUnit(defID, 4864, 92, 6144, 3, 1)
		--
		--Spring.CreateUnit(defID, 1280, 92, 3328, 1, 0)
		--Spring.CreateUnit(defID, 4864, 92, 3584, 3, 1)
		--Spring.CreateUnit(defID, 1280, 92, 4608, 1, 0)
		--Spring.CreateUnit(defID, 4864, 92, 4864, 3, 1)
		first = false
	end
end
