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

local teamList = Spring.GetTeamList()

local left = 1600
local right = 6144 - left

local positions = {
	512,
	2048,
	3328,
	4608,
	6144,
	7680,
}

function gadget:GameFrame(f)
	if f == 20 then
		local defID = UnitDefNames["dyntrainer_support_base"].id
		local teamList = Spring.GetTeamList()
		for i = 1, #teamList do
			local x, z
			if i <= 6 then
				x = left - 100
				z = positions[i]
			else
				x = right + 100
				z = positions[i - 6]
			end
			if x and z then
				local teamID = teamList[i]
				local unitID = Spring.CreateUnit(defID, x, 0, z, 0, teamID)
				--Spring.SetUnitRulesParam(unitID, "facplop", 1)
			end
		end
	end
	
	--if f > 30 and f <= 42 then
	--	local defID = UnitDefNames["factoryshield"].id
	--	local i = f - 30
	--	local x, z
	--	if i <= 6 then
	--		x = left
	--		z = positions[i]
	--	else
	--		x = right
	--		z = positions[i - 6]
	--	end
	--	local teamID = teamList[i]
	--	local units = Spring.GetTeamUnits(teamID)
	--	if units and #units ~= 0 then
	--		local unitID = units[1]
	--		Spring.GiveOrderToUnit(unitID, -defID, {x, 0, z}, {})
	--	end
	--end
end
