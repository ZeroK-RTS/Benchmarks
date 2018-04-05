function gadget:GetInfo()
	return {
		name      = "Prespawn",
		desc      = "Spawns start units",
		author    = "Google Frog",
		date      = "25 September 2014",
		license   = "GNU GPL, v2 or later",
		layer     = 1,
		enabled   = true -- loaded by default?
	}
end

local spawnUnitDefID = (UnitDefNames["energywind"] or UnitDefNames["armwin"]).id

if not (gadgetHandler:IsSyncedCode()) then
	return 
end

function gadget:GameFrame(f)
	if f == 1 then
		for i = 1, 60 do
			for j = 1, 30 do
				Spring.CreateUnit(spawnUnitDefID, 900 + 70*i, 92, 2300 + 100*j, 1, 0)
			end
		end
	end
end
