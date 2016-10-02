local unitName = "base"

local unitDef =
{
-- Internal settings
	BuildPic = "base.bmp",
	Category = "BUILDING NOTSCOUT NOTHEAVY NOTAIR NOTEPIC NOTSHIP NOTSTEALTHY ALL",
	ObjectName = "base2.s3o",
	Side = "TANK",
	TEDClass = "PLANT",
	script = "basescript.lua",
	
-- Unit limitations and properties
	ActivateWhenBuilt = true,
    commander = true,
	Description = "Produces units. Grants Supply 7.",
	MaxDamage = 1500,
	Name = "Base",
	RadarDistance = 0,
	SightDistance = 400,
	SoundCategory = "BUILDING",
	Upright = 1,
	WorkerTime = 10,
	levelground = 1,
	
-- Energy and metal related
	BuildTime = 5,
	BuildCostEnergy = 5,
	EnergyStorage = 0,
	EnergyUse = 0,
	MetalStorage = 0,
	EnergyMake = 50, 
	MakesMetal = 0, 
	MetalMake = 50,
	
-- Pathfinding and related
	FootprintX = 4,
	FootprintZ = 4,
	MaxSlope = 10,
	MaxWaterDepth = 0,
	YardMap = "cccc cccc cccc cccc",

-- Abilities
	Builder = 1,
    Reclaimable = 0,
	ShowNanoSpray = 0,
	CanBeAssisted = 0,
    radarDistance = 2100,
	buildoptions = 
	{
		"tank",
		"tank1",
		"tank4",
		"tank5",
		"anothertank",
		"builder",
	},
	
-- Abilities new to Spring

	CustomParams = 
	{
		supply_granted = 7,
	},
	
-- Weapons and related

	ExplodeAs = "BUILDINGLARGEDEATH",
	SelfDestructAs = "BUILDINGLARGEDEATH",
	SelfDestructCountdown = 5,
}

return lowerkeys({ [unitName] = unitDef })
