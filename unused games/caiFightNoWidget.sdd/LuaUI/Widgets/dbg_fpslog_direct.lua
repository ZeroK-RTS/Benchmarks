function widget:GetInfo()
  return {
    name      = "Widget_Fps_Log",
    desc      = "Some random logging",
    author    = "Licho",
    date      = "2013",
    layer     = 0,
    enabled   = true,  --  loaded by default
  }
end

local LOG_START = 30*60*8
local LOG_END = LOG_START + 60*30
local EXIT_TIME = LOG_END + 30*5
local normalSpeedTime = LOG_START - 30*5

local debugView = false

local setFast = false

local spGetTimer = Spring.GetTimer 
local spDiffTimers = Spring.DiffTimers
local spGetAllUnits = Spring.GetAllUnits

local startTimer = spGetTimer()

function widget:Initialize()
	Spring.Echo("Logger Initialized")
end

function widget:Update(dt)
	local frame = Spring.GetGameFrame() 
	if frame > 0 and not setFast then
		startTimer = spGetTimer()
		Spring.SendCommands("setminspeed 20")
		Spring.SendCommands("setmaxspeed 20")
		setFast = true
	end
	if normalSpeedTime and frame > normalSpeedTime then
		Spring.SendCommands("setminspeed 1")
		Spring.SendCommands("setmaxspeed 1")
		--Spring.SendCommands("screenshot")
		
		local units = spGetAllUnits()
		Spring.Echo("!transmitlobby units_start: " .. #units)
		
		local newTimer = spGetTimer()
		Spring.Echo("!transmitlobby speedy_dt: " .. spDiffTimers(newTimer, startTimer))
		normalSpeedTime = false
	end
	if frame > LOG_START and frame < LOG_END then
		Spring.Echo("!transmitlobby w_update_dt: "..dt)
	end
	if frame > LOG_END and not debugView then
		Spring.SendCommands("gameinfo")
		Spring.SendCommands("debug")
		debugView = true
	end
	if (frame > EXIT_TIME) then
		--Spring.SendCommands("screenshot")
		local units = spGetAllUnits()
		Spring.Echo("!transmitlobby units_end: " .. #units)
		Spring.SendCommands("quit")
	end
end


