local building, platform, nanopoint = piece "building", piece "platform", piece "nanopoint"
-- declares all the pieces we'll be using.

function script.Create()
	Spring.SetUnitRulesParam(unitID,"testparam",1, {inlos = true})
	SetUnitValue(COB.YARD_OPEN, 1)
	SetUnitValue(COB.INBUILDSTANCE, 1)
	SetUnitValue(COB.BUGGER_OFF, 1)
    return 0
end

function script.QueryBuildInfo() return platform end
-- When building a unit in this building, put it on the "platform" piece.

function script.QueryNanoPiece() return nanopoint end
-- If using nanospray, make the nanospray appear from the "nanopoint" piece (the sphere). This won't be used here, but meh.


local function BuildDelay()
	SetUnitValue(COB.YARD_OPEN, 0)
	SetUnitValue(COB.INBUILDSTANCE, 0)
	Sleep(1400)
	SetUnitValue(COB.YARD_OPEN, 1)
	SetUnitValue(COB.INBUILDSTANCE, 1)
end

function script.StopBuilding()
	StartThread(BuildDelay)
	return 0
end


--Actually, I'm not sure if Activate() is called when the base is finished, rather than when it starts building anything. I'll need to check that.

function script.Killed(recentDamage, maxHealth)
	return 0
end
