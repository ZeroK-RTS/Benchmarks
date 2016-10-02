function widget:GetInfo()
	return {
		name      = "Disable Widgets",
		desc      = "Disables all widgets except for a whitelist",
		author    = "GoogleFrog",
		date      = "4 October 2014",
		license   = "GNU GPL, v2 or later",
		layer     = 1000,
		enabled   = true,
		handler   = true,
	}
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local whitelist = {
	["Disable Widgets"] = true,
	["Widget_Fps_Log"] = true,
}

local count = 0

function widget:Update()
	if count > 16 then
		return
	end
	count = count + 1
	if count < 10 then
		return
	else
		for name, data in pairs(widgetHandler.widgets) do
			local name = data.whInfo.name
			if not whitelist[name] then
				widgetHandler:DisableWidget(name)
			end
		end
	end
end	