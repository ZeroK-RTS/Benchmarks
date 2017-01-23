-- Set build options
local buildOpts = VFS.Include("gamedata/buildoptions.lua")
for name, ud in pairs(UnitDefs) do
	if ud.buildoptions and (#ud.buildoptions == 0) then
		ud.buildoptions = buildOpts
	end
end
