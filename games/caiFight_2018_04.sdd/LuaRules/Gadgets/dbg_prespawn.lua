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

local positions = {
	512,
	2048,
	3328,
	4608,
	6144,
	7680,
}

function gadget:GameFrame(f)
	if f == 1 then
		local defID = UnitDefNames["factoryshield"].id
		local leftSeen = 0
		local rightSeen = 0
		local teamList = Spring.GetTeamList()
		for i = 1, #teamList do
			local teamID = teamList[i]
			local allyTeamID = select(6, Spring.GetTeamInfo(teamID))
			if allyTeamID == 0 then
				leftSeen = leftSeen + 1
				Spring.CreateUnit(defID, 1280, 92, positions[leftSeen], 1, teamID)
			elseif allyTeamID == 1 then
				rightSeen = rightSeen + 1
				Spring.CreateUnit(defID, 4864, 92, positions[rightSeen], 3, teamID)
			end
		end
	end
	if f == 30 then
		local units = Spring.GetAllUnits()
		for i = 1, #units do
			Spring.SetUnitRulesParam(units[i],"facplop",0)
		end
	end
end
