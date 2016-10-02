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
	if f == 1 then
		local defID = UnitDefNames["factoryshield"].id
		Spring.CreateUnit(defID, 1280, 92, 512, 1, 0)
		Spring.CreateUnit(defID, 4864, 92, 512, 3, 1)
		Spring.CreateUnit(defID, 1280, 92, 7680, 1, 2)
		Spring.CreateUnit(defID, 4864, 92, 7680, 3, 3)
		
		Spring.CreateUnit(defID, 1280, 92, 2048, 1, 4)
		Spring.CreateUnit(defID, 4864, 92, 2048, 3, 5)
		Spring.CreateUnit(defID, 1280, 92, 6144, 1, 6)
		Spring.CreateUnit(defID, 4864, 92, 6144, 3, 7)
		
		Spring.CreateUnit(defID, 1280, 92, 3328, 1, 8)
		Spring.CreateUnit(defID, 4864, 92, 3584, 3, 9)
		Spring.CreateUnit(defID, 1280, 92, 4608, 1, 10)
		Spring.CreateUnit(defID, 4864, 92, 4864, 3, 11)
	end
end
