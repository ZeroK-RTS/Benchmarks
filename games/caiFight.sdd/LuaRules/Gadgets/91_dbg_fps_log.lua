
function gadget:GetInfo()
  return {
    name      = "Gadget_Fps_Log_91",
    desc      = "Some random logging",
    author    = "Licho",
    date      = "2013",
    license   = "GNU GPL, v2 or later",
    layer     = 1,
    enabled   = not Spring.Utilities.IsCurrentVersionNewerThan(97, 0),
  }
end 

local spGetTimer = Spring.GetTimer 
local spDiffTimers = Spring.DiffTimers
 
local LOG_START = 30*60*8
local LOG_END = LOG_START + 60*30

if (gadgetHandler:IsSyncedCode()) then

function gadget:GameFrame(gf)
	SendToUnsynced("gameFrame", gf)
end


else 

local frameTimer= spGetTimer()
local gfTimer = spGetTimer()
local lastGameFrame = 0


function gadget:Update() 
	local newTimer = spGetTimer()
	local frame = Spring.GetGameFrame()
	if frame > LOG_START and frame < LOG_END then
		Spring.Echo("!transmitlobby g_update_dt: " .. spDiffTimers(newTimer, frameTimer))
	end
	frameTimer = newTimer
end

local function gameFrame(_, gf)
	if gf > lastGameFrame then
		local newTimer = spGetTimer()
		local frame = Spring.GetGameFrame()
		if frame > LOG_START and frame < LOG_END then
			Spring.Echo("!transmitlobby g_gameframe_dt: " .. spDiffTimers(newTimer, gfTimer) / (gf - lastGameFrame))
		end
		lastGameFrame = gf
		gfTimer = newTimer
	end
end 

function gadget:Initialize()
    gadgetHandler:AddSyncAction("gameFrame", gameFrame)
end

end