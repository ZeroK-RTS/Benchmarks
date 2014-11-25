
-- $Id: movedefs.lua 3518 2008-12-23 08:46:54Z saktoth $
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  file:    moveDefs.lua
--  brief:   move data definitions
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local common_depthmodparams = {
	quadraticCoeff = 0,
	linearCoeff = 0.07,
}

local moveDefs = {
	Default2x2 = {
		footprintX = 2,
		maxWaterDepth = 10,
		maxSlope = 20,
		crushStrength = 25,
	},
	KBOT1 = {
		footprintx = 1,
		footprintz = 1,
		maxwaterdepth = 16,
		maxslope = 36,
		crushstrength = 5,
		depthmodparams = common_depthmodparams,
	},

	KBOT2 = {
		footprintx = 2,
		footprintz = 2,
		maxwaterdepth = 22,
		maxslope = 36,
		crushstrength = 50,
		depthmodparams = common_depthmodparams,
	},

	KBOT3 = {
		footprintx = 3,
		footprintz = 3,
		maxwaterdepth = 22,
		maxslope = 36,
		crushstrength = 150,
		depthmodparams = common_depthmodparams,
	},
	
	KBOT4 = {
		footprintx = 4,
		footprintz = 4,
		maxwaterdepth = 22,
		maxslope = 36,
		crushstrength = 500,
		depthmodparams = common_depthmodparams,
	},
	
	AKBOT2 = {		--amphib
		footprintx = 2,
		footprintz = 2,
		maxwaterdepth = 5000,
		depthmod = 0,
		maxslope = 36,
		crushstrength = 50,
	},
	
	AKBOT3 = {		--amphib
		footprintx = 3,
		footprintz = 3,
		maxwaterdepth = 5000,
		depthmod = 0,
		maxslope = 36,
		crushstrength = 150,
	},
	
	AKBOT4 = {		--amphib
		footprintx = 4,
		footprintz = 4,
		maxwaterdepth = 5000,
		depthmod = 0,
		maxslope = 36,
		crushstrength = 500,
	},
	
	AKBOT6 = {		--amphib
		footprintx = 6,
		footprintz = 6,
		maxwaterdepth = 5000,
		depthmod = 0,
		maxslope = 36,
		crushstrength = 5000,
	},
	
	TKBOT1 = {		--allterrain
		footprintx = 1,
		footprintz = 1,
		maxwaterdepth = 16,
		maxslope = 70,
		crushstrength = 5,
		depthmodparams = common_depthmodparams,
	},

	TKBOT3 = {		--allterrain
		footprintx = 3,
		footprintz = 3,
		maxwaterdepth = 22,
		maxslope = 70,
		crushstrength = 150,
		depthmodparams = common_depthmodparams,
	},
	
	TKBOT4 = {		--allterrain
		footprintx = 4,
		footprintz = 4,
		maxwaterdepth = 22,
		maxslope = 70,
		crushstrength = 500,
		depthmodparams = common_depthmodparams,
	},

	ATKBOT3 = {		--amphib + allterrain
		footprintx = 3,
		footprintz = 3,
		maxwaterdepth = 5000,
		maxslope = 70,
		crushstrength = 150,
	},
	
	TANK2 = {
		footprintx = 2,
		footprintz = 2,
		maxwaterdepth = 22,
		maxslope = 18,
		slopemod = 20,
		crushstrength = 50,
		depthmodparams = common_depthmodparams,
	},
	
	TANK3 = {
		footprintx = 3,
		footprintz = 3,
		maxwaterdepth = 22,
		maxslope = 18,
		slopemod = 20,
		crushstrength = 150,
		depthmodparams = common_depthmodparams,
	},

	TANK4 = {
		footprintx = 4,
		footprintz = 4,
		maxwaterdepth = 22,
		maxslope = 18,
		slopemod = 20,
		crushstrength = 500,
		depthmodparams = common_depthmodparams,
	},
	
	HOVER3 = {
		footprintx = 3,
		footprintz = 3,
		maxslope = 18,
		maxwaterdepth = 5000,
		slopemod = 40,
		crushstrength = 50,
	},

	BHOVER3 = {		--hover with bot slope
		footprintx = 3,
		footprintz = 3,
		maxslope = 36,
		maxwaterdepth = 5000,
		--slopemod = 60,
		crushstrength = 150,
	},
	
	BOAT3 = {
		footprintx = 3,
		footprintz = 3,
		minwaterdepth = 5,
		crushstrength = 150,
	},

	BOAT4 = {
		footprintx = 4,
		footprintz = 4,
		minwaterdepth = 5,
		crushstrength = 500,
	},
	
	BOAT6 = {
		footprintx = 6,
		footprintz = 6,
		minwaterdepth = 15,
		crushstrength = 5000,
	},
	
	UBOAT3 = {
		footprintx = 3,
		footprintz = 3,
		minwaterdepth = 15,
		crushstrength = 150,
		subMarine = 1,
	},
}

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- convert from map format to the expected array format

local array = {}
local i = 1
for k,v in pairs(moveDefs) do
	v.heatmapping = false -- disable heatmapping
	array[i] = v
	v.name = k
	i = i + 1
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

return array

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
