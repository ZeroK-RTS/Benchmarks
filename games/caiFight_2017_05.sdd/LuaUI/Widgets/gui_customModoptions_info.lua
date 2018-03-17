--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function widget:GetInfo()
  return {
    name      = "Chili Custom Modoptions Info",
    desc      = "v0.001 Display list of customized modoptions if available",
    author    = "xponen",
    date      = "15 March 2014",
    license   = "GNU GPL, v2 or later",
    layer     = 1,
    enabled   = false  --  loaded by default?
  }
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local options = VFS.Include("ModOptions.lua")

-- gui elements
local window2
	
function widget:Initialize()
end