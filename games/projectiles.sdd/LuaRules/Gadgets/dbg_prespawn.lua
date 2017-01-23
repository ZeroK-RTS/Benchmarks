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
	if f == 10 then
		local params = {
			pos = {3000, 92, 4000},
			speed = {0, -100, 0},
		}
		local count = 1
		local weaponDefID = 1
		while count <= 1000 do
			local wd = WeaponDefs[weaponDefID]
			if not wd then
				break
			end
			if wd.type == "Cannon" or wd.type == "MissileLauncher" then
				Spring.SpawnProjectile(weaponDefID, params)
				count = count + 1
			end
			weaponDefID = weaponDefID + 1
		end
	end
end





























































