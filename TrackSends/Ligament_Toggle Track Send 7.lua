-- @version 0.1
-- @author Ligament
-- @changelog
--   Initial version
-- @description Toggle Track Send X
-- @about
--   # Toggle Track Send X
--
--   Toggles send enable/disable on the selected track
-- @metapackage
-- @provides
--   [main] . > Ligament_Toggle Track Send 1.lua
--   [main] . > Ligament_Toggle Track Send 2.lua
--   [main] . > Ligament_Toggle Track Send 3.lua
--   [main] . > Ligament_Toggle Track Send 4.lua
--   [main] . > Ligament_Toggle Track Send 5.lua
--   [main] . > Ligament_Toggle Track Send 6.lua
--   [main] . > Ligament_Toggle Track Send 7.lua
--   [main] . > Ligament_Toggle Track Send 8.lua

function ToggleTrackSendMute(sendIdx)
	
	local tr_count = reaper.CountSelectedTracks(0)
	if tr_count == 0 then
		return
	end
	
	reaper.Undo_BeginBlock()
	track = reaper.GetSelectedTrack(0, 0)
	sendMute = reaper.ToggleTrackSendUIMute(track,sendIdx)
	reaper.Undo_EndBlock("Toggle track send")

end 

local send = tonumber(({reaper.get_action_context()})[2]:match("send (%d+).lua"))
if send then
	ToggleTrackSendMute(send - 1)
else
	error("could not determine send number from script name")
end