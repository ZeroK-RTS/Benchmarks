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

if not (gadgetHandler:IsSyncedCode()) then
	return 
end

function gadget:GameFrame(f)
	if f == 20 then
		local defID = (UnitDefNames["vehcon"] or UnitDefNames["corned"]).id
		Spring.CreateUnit(defID, 0, 0, 0, 0, 0)
	end
end





























































