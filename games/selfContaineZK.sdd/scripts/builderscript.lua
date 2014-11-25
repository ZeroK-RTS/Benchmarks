local base = piece "base"
local body = piece "body"
local turret = piece "turret"
local bar = piece "bar"
local frontsphere = piece "frontsphere"

local SIG_BUILD = 2
-- local RESTORE_DELAY = Spring.UnitScript.GetLongestReloadTime(unitID) * 2

function script.Create()
	return 0
end

function script.StartBuilding(heading, pitch)
--called whenever construction begins.
	Signal(SIG_BUILD)
	SetSignalMask(SIG_BUILD)
-- Stops the unit from "building" and "not building" at the same time. This would be confusing.
    --Turn the turret
	Turn(turret, y_axis, heading, math.rad(90))
	WaitForTurn(turret, y_axis)
    --Start building!
	SetUnitValue(COB.INBUILDSTANCE, 1)

--If you gave the builder a weapon, like a flamethrower, and you wanted it to be continuously firing while building, you'd use this code:
--[[
	while true do
		EmitSfx(nano, 2048) -- fire the weapon (2048 means weapon) from piece "frontsphere"
		Sleep(1)
	end
]]--
	return 1
end

function script.QueryNanoPiece() return frontsphere end
-- make nanospray from this piece, if we're using nanospray. Which we're not. Also, point this piece at the construction site.

function script.AimFromWeapon() return turret end
-- Look down from the origin of this piece "turret", to see if the NanoPiece "frontsphere" is pointing at the construction site.

function script.StopBuilding()
	Signal(SIG_BUILD)
	SetSignalMask(SIG_BUILD)
-- Stops the unit from "building" and "not building" at the same time. This would be confusing.
	SetUnitValue(COB.INBUILDSTANCE, 0)
    --Stops building!
	Turn(turret, y_axis, 0, math.rad(90))
	WaitForTurn(turret, y_axis)
    -- Moves the turret back to the default position
	Sleep(1)
	return 0
end

function script.Killed(recentDamage, maxHealth)
	return 0
end

function script.HitByWeapon(x,z,weaponDef,damage)
    -- This stops the unit being damaged if it's not been built yet.
	if GetUnitValue(COB.BUILD_PERCENT_LEFT)>2 then return 0
	else return damage
	end
end

