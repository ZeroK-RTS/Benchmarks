function IsCurrentVersionNewerThan(rel, dev)
	-- Argument example, <rel>.0.1-<dev>-g5072695
	local thisVersion = Game.version
	local thisRel, thisDev
	local i = 1
	for word in thisVersion:gmatch("[^%-]+") do
		if i == 1 then
			local j = 1
			for subword in word:gmatch("[^%.]+") do
				if j == 1 then
					thisRel = tonumber(subword)
					if thisRel then
						if thisRel < rel then
							return false
						end
						if thisRel > rel then
							return true
						end
					end
				end
				j = j + 1
			end
		elseif i == 2 then
			thisDev = tonumber(word)
			if thisDev then
				return thisDev > dev
			end
		end
		i = i + 1
	end
	return false -- A newer version would not fail to return before now
end

function gadget:GetInfo()
  return {
    name      = "Gadget_Fps_Log",
    desc      = "Some random logging",
    author    = "Licho",
    date      = "2013",
    license   = "GNU GPL, v2 or later",
    layer     = 1,
    enabled   = IsCurrentVersionNewerThan(97, 0),
  }
end 

local spGetTimer = Spring.GetTimer 
local spDiffTimers = Spring.DiffTimers
 
local LOG_START = 30*60*4
local LOG_END = LOG_START + 60*30

if not (gadgetHandler:IsSyncedCode()) then

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