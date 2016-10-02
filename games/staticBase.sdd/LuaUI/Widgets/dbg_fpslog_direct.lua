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

-----------------------------------------------------------
-----------------------------------------------------------
-- Configuration

-- Time at which logging begins.
local LOG_START = 10*30

-- Time at which logging ends.
local LOG_END = LOG_START + 10*30

-- When Spring is closed.
local EXIT_TIME = LOG_END + 5*30

-- Fas foward to this time.
local NORMAL_SPEED_TIME = 0

-----------------------------------------------------------
-----------------------------------------------------------
-- Variables

local debugView = false

local initializationComplete = false
local inFastMode = false

local spGetTimer = Spring.GetTimer 
local spDiffTimers = Spring.DiffTimers
local spGetAllUnits = Spring.GetAllUnits

local startTimer = spGetTimer()

local cheated = false

-----------------------------------------------------------
-----------------------------------------------------------
-- Widget interface

function widget:Initialize()
	Spring.Echo("Logger Initialized")
end

function widget:Update(dt)
	if not cheated then
		Spring.SendCommands("cheat")
		cheated = true
	end
	local frame = Spring.GetGameFrame() 
	if frame > 0 and not initializationComplete then
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
		
		if NORMAL_SPEED_TIME and NORMAL_SPEED_TIME > 0 then
			startTimer = spGetTimer()
			Spring.SendCommands("setminspeed 20")
			Spring.SendCommands("setmaxspeed 20")
			inFastMode = true
		end
		initializationComplete = true
	end
	if NORMAL_SPEED_TIME and frame > NORMAL_SPEED_TIME and inFastMode then
		Spring.SendCommands("setminspeed 1")
		Spring.SendCommands("setmaxspeed 1")
		--Spring.SendCommands("screenshot")
		
		local units = spGetAllUnits()
		Spring.Echo("!transmitlobby units_start: " .. #units)
		
		local newTimer = spGetTimer()
		Spring.Echo("!transmitlobby speedy_dt: " .. spDiffTimers(newTimer, startTimer))
		inFastMode = false
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
		Spring.SendCommands("quitforce")
	end
end
