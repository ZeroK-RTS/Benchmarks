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

local LOG_START = 30*60*10
local LOG_END = LOG_START + 60*30
local EXIT_TIME = LOG_END + 30*5
local SPEEDY_FPS_START = 30*60
local SPEEDY_FPS_END = 30*60*9
local normalSpeedTime = LOG_START - 30*5

local FPS_RANGE_SIZE = 2.5
local FPS_RANGE_COUNT = 20

local fpsRange = {}
local speedyFpsRange = {}

local debugView = false

local setFast = false

local spGetTimer = Spring.GetTimer 
local spDiffTimers = Spring.DiffTimers
local spGetAllUnits = Spring.GetAllUnits

local startTimer = spGetTimer()

function widget:Initialize()
	Spring.Echo("Logger Initialized")
end

local cheated = false
function widget:Update(dt)
	if not cheated then
		Spring.SendCommands("cheat")
		cheated = true
	end
	local frame = Spring.GetGameFrame() 
	if frame > 0 and not setFast then
		-- Set camera in case different engines have different default locations
		Spring.SetCameraState({
			px = 3072,
			py = 91.71875,
			pz = 4096,
			flipped = -1,
			dx = 0,
			dy = -0.8945,
			dz = -0.4472,
			name = "ta",
			zscale = 0.5,
			height = 3000,
			mode = 1,
		}, 0)
		
		Spring.WarpMouse(100, 100)
		
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
		if dt > 0 then
			local fps = 1/dt
			local range = math.min(FPS_RANGE_COUNT, math.max(0, math.floor(fps/FPS_RANGE_SIZE))) + 1
			fpsRange[range] = (fpsRange[range] or 0) + 1
		end
	end
	if frame > SPEEDY_FPS_START and frame < SPEEDY_FPS_END then
		if dt > 0 then
			local fps = 1/dt
			local range = math.min(FPS_RANGE_COUNT, math.max(0, math.floor(fps/FPS_RANGE_SIZE))) + 1
			speedyFpsRange[range] = (speedyFpsRange[range] or 0) + 1
		end
	end
	if frame > LOG_END and not debugView then
		Spring.SendCommands("debuginfo profiling")
		Spring.SendCommands("gameinfo")
		Spring.SendCommands("debug")
		debugView = true
	end
	if (frame > EXIT_TIME) then
		--Spring.SendCommands("screenshot")
		
		for i = 1, FPS_RANGE_COUNT do
			Spring.Echo("!transmitlobby fps_" .. (i - 1)*FPS_RANGE_SIZE .. "_" .. i*FPS_RANGE_SIZE .. ": " .. (fpsRange[i] or 0))
		end
		Spring.Echo("!transmitlobby fps_over_60: " .. (fpsRange[FPS_RANGE_COUNT + 1] or 0))
		
		for i = 1, FPS_RANGE_COUNT do
			Spring.Echo("!transmitlobby speedy_fps_" .. (i - 1)*FPS_RANGE_SIZE .. "_" .. i*FPS_RANGE_SIZE .. ": " .. (speedyFpsRange[i] or 0))
		end
		Spring.Echo("!transmitlobby speedy_fps_over_" .. (FPS_RANGE_SIZE*FPS_RANGE_COUNT) .. ": " .. (speedyFpsRange[FPS_RANGE_COUNT + 1] or 0))
		
		local units = spGetAllUnits()
		Spring.Echo("!transmitlobby units_end: " .. #units)
		Spring.SendCommands("quitforce")
	end
end


