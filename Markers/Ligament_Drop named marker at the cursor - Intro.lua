--[[
 * ReaScript Name: Drop named marker at the cursor - Intro
 * Author: John Harkins
 * Licence: GPL v3
 * REAPER: 5.99
 * Extensions: None
 * Version: 1.0
--]]
 
--[[
 * Changelog:
 * v1.0 (2020-02-14)
 	+ Initial Release
--]]

function Insert_Marker_Custom_Name(name)
	reaper.Undo_BeginBlock()
	cursor_pos = reaper.GetCursorPosition()
	play_pos = reaper.GetPlayPosition()
	marker_index, num_markersOut, num_regionsOut = reaper.CountProjectMarkers( 0 )
	reaper.AddProjectMarker( 0, 0, play_pos, 0, name, marker_index+1 )
	reaper.Undo_EndBlock("Drop named marker at the cursor", 0)
	reaper.UpdateArrange()
end

--
-- CUSTOM MARKER NAME HERE
--
local name = "Intro"
--

Insert_Marker_Custom_Name(name)