
function gadget:GetInfo()
  return {
    name      = "Gadget_Fps_Log",
    desc      = "Some random logging",
    author    = "Licho",
    date      = "2013",
    license   = "GNU GPL, v2 or later",
    layer     = 1,
    enabled   = Spring.Utilities.IsCurrentVersionNewerThan(97, 0),
  }
end 

local spGetTimer = Spring.GetTimer 
local spDiffTimers = Spring.DiffTimers
 
-- Time at which logging begins.
local LOG_START = 10*30

-- Time at which logging ends.
local LOG_END = LOG_START + 10*30

if not (gadgetHandler:IsSyncedCode()) then

local frameTimer= spGetTimer()
local gfTimer = spGetTimer()
local lastGameFrame = 0

function gadget:GameFrame(gf)
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

end