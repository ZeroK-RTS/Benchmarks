function gadget:GetInfo()
	return {
		name      = "Disable Gadgets",
		desc      = "Disables all gadgets from a list.",
		author    = "GoogleFrog",
		date      = "24 November 2014",
		license   = "GNU GPL, v2 or later",
		layer     = math.huge,
		enabled   = true,
		handler   = true,
	}
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local gadgetList = {
	--"CAI",
	--"LUS",
	--"LupsNanoSpray91",
	--"Mex Control with energy link",
	--"Metalspot Finder Gadget",
	--"Mex Placement",
	
	"91 Teleporter",
	"Awards_91",
	"Capture_91",
	"LupsSyncedManager_91",
	"LupsSyncedManager",
	"Thrusters_91",
	"UnitCloakShield_91",
	"Rezz Hp Changer + effect_91",
	"Nano Frame Death Handeling91",
	"CustomUnitShaders_91",
	"Ceasefires2",
	"Perks",
	"UnitMorph",
	"DroppedStartPos",
	"Dont fire at radar",
	"Disable Buildoptions",
	"Teleporter",
	"Grey Goo",
	"No Self-D",
	"Attributes",
	"Fall Damage",
	"Transport Speed",
	"MarketPlace",
	"Refuel Pad Handler",
	"Windmill Control",
	"Weapon Timed Replace",
	"Mod statistics",
	"Unit Explosion Spawner",
	"astar.lua",
	"Tactical Unit AI",
	"Repair Speed Changer",
	"Terrain Texture Handler",
	"Spherical LOS",
	"Target Priority",
	"TransportAIbuttons",
	"Ranks API",
	"Nano Frame Death Handeling",
	"Terraformers",
	"AutoReadyStartpos",
	"Lups Cloak FX",
	"Test",
	"api_subdir_gadgets.lua",
	"NoAirNuke",
	"Lag Monitor",
	"Animator",
	"Control gunship strafe range",
	"Awards",
	"Carrier Drones",
	"Bounties",
	"Aircraft Command",
	"Boolean Disable",
	"DoLine",
	"Instant Self Destruct",
	"Missile Silo Controller",
	"Factory Anti Slacker",
	"Time slow v2",
	"Gunship Strafe Control",
	"Aircraft Crashing",
	"Game Over",
	"UnitStealth",
	"Noexplode Stopper",
	"Puppy Handler",
	"Blocking Tag Implementation",
	"Area Denial",
	"Water Effects",
	"UnitPriority",
	"Rezz Hp changer + effect",
	"Units on fire",
	"Allow Builder Hold Fire",
	"Target on the move",
	"Unit E-Stall Disable",
	"Stockpile",
	"Impulse Float Toggle",
	"Retreat Command",
	"Decloak when damaged",
	"ShareControl",
	"Center Offset",
	"Shield Link",
	"Set Nano Piece",
	"Self destruct blocker",
	"LockOptions",
	"AirTransport_SeaPickup",
	"Area Guard",
	"Reclaim HP changer",
	"Weapon Impulse ",
	"Bomber Dive",
	"Solar Force Closed",
	"Vertical Swarm",
	"Prevent Lab Hax",
	"lups_wrapper.lua",
	"Jumpjets",
	"One Click Weapon",
	"Paralysis",
	"Thrusters",
	"No Friendly Fire",
	"AirPlantParents",
	"UnitCloakShield",
	"StartSetup",
	"Save/Load",
	"Capture",
	"Single-Hit Weapon",
	"IconGenerator",
	"Orbital Drop",
	"D-Gun Aim Fix",
	"lavarise",
	"Resign Gadget",
	"CMD_RAW_MOVE",
	"CEG Spawner",
	"LupsNanoSpray",
	"CustomUnitShaders",
	"Hide Autorepairlevel Command",
	"Ore mexes!",
	"Lups",
	"Planet Wars Structures",
	"BOXXY R1 w volume type",
	"Chicken Spawner",
	"Jugglenaut Juggle",
	"Chicken control",
	"unit_missilesilo.lua",
	"Disable Features",
	"unit_carrier_drones.lua",
	"Zombies!",
	"Turn Without Interia",
	"Recorder (Load)",
}

local unsyncedGadgetList = {
	"CAI",
	"LUS",
	"LupsNanoSpray91",
	"Mex Control with energy link",
	"Metalspot Finder Gadget",
	"Mex Placement",
}
if (gadgetHandler:IsSyncedCode()) then

local first = true

function gadget:GameFrame(n)
	if first and n > 5 then
		Spring.Echo("DisableGadget here")
		for i = 1, #gadgetList do
			gadgetHandler:GotChatMsg("disablegadget " .. gadgetList[i], 0)
		end
		first = false
	end
end

else

local first = true
function gadget:Update()
	if first and Spring.GetGameFrame() > 5 then
		for i = 1, #gadgetList do
			gadgetHandler:GotChatMsg("disablegadget " .. gadgetList[i], 0)
		end
		for i = 1, #unsyncedGadgetList do
			gadgetHandler:GotChatMsg("disablegadget " .. unsyncedGadgetList[i], 0)
		end
		first = false
	end
end

end
