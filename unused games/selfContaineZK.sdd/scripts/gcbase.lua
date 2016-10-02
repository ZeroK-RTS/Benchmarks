local base, nano, pad = piece "base", piece "nano", piece "pad"

function script.StartBuilding()
	BUILDINGVAR = 1
--	while true do
--		EmitSfx(nano, 2048)
--		Sleep(1200)
--	end
end

function script.StopBuilding()
	BUILDINGVAR = 0
end

local function Buildpulse()
	while true do
		if BUILDINGVAR == 1 then
			EmitSfx(nano, 2048)
		end
	Sleep(1200)
	end
end

function script.Create(unitID)
	StartThread(Buildpulse)
end

function script.QueryBuildInfo() return pad end
function script.QueryNanoPiece() return nano end

function script.Activate()
	SetUnitValue(COB.YARD_OPEN, 1)
	SetUnitValue(COB.INBUILDSTANCE, 1)
	SetUnitValue(COB.BUGGER_OFF, 1)
--	return 1
--	while true do
--		EmitSfx(nano, 2048)
--		Sleep(1200)
--	end
	return 1
end

function script.Deactivate()
	SetUnitValue(COB.YARD_OPEN, 0)
	SetUnitValue(COB.INBUILDSTANCE, 0)
	SetUnitValue(COB.BUGGER_OFF, 0)
	return 0
end

function script.Killed()
	return 0
end
