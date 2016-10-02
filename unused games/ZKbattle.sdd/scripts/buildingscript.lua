local base,block,tower,sphere = piece "base", piece "block", piece "tower", piece "sphere"

function script.Create(unitID)
    return 0
end

function script.Killed(recentDamage, maxHealth)
	return 0
end

--since this building doesn't do anything, it could work fine with a completely empty script.
