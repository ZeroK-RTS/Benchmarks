local unitName = "building"

local unitDef =  
{
-- Internal settings
	BuildPic = "building.bmp",
	Category = "BUILDING NOTSCOUT NOTHEAVY NOTAIR NOTSHIP NOTEPIC NOTSTEALTHY ALL",
	ObjectName = "building.s3o",
	Side = "TANK",
	script = "buildingscript.lua",

-- Unit limitations and properties
	ActivateWhenBuilt = 1,
	Description = "Produces Energy. Grants supply 5.",
	MaxDamage = 1000,
	Name = "Energy Tower",
	RadarDistance = 0,
	SightDistance = 400,
	SoundCategory = "BUILDING",
	Upright = 1,
	levelground = 1,
	
-- Energy and metal related
	BuildTime = 5,
	BuildCostEnergy = 5,
	EnergyStorage = 40,
	EnergyUse = 0,
	MetalStorage = 0,
	EnergyMake = 5, 
	MakesMetal = 0, 
	MetalMake = 0,
	
-- Pathfinding and related
	FootprintX = 2,
	FootprintZ = 2,
	MaxSlope = 10,
	MaxWaterDepth = 0,
	YardMap = "c",

	
-- Abilities
	Builder = 0,
    Reclaimable = 0,
	
-- Abilities new to Spring

	CustomParams = 
	{
		supply_granted = 5,
	},
	
-- Weapons and related
	ExplodeAs = "CUBEBUILDINGSMALLDEATH",
	SelfDestructAs = "CUBEBUILDINGSMALLDEATH",
	SelfDestructCountdown = 5,
}

return lowerkeys({ [unitName] = unitDef })
