local msg = require("mp.msg")

local resume_time = nil
local prompted = false

mp.register_event("file-loaded", function()
	resume_time = mp.get_property_number("time-pos", 0)

	-- Don't prompt for very short resume times
	if resume_time and resume_time > 5 and not prompted then
		prompted = true
		mp.set_property("pause", "yes")
		mp.osd_message("Resume from last position? (y/n)", 10)

		-- Press "y" to resume
		mp.add_forced_key_binding("y", "resume-yes", function()
			mp.set_property("pause", "no")
			mp.commandv("seek", resume_time, "absolute", "exact")
			mp.osd_message("Resumed from " .. string.format("%.1f", resume_time) .. "s")
			mp.remove_key_binding("resume-yes")
			mp.remove_key_binding("resume-no")
		end)

		-- Press "n" to start over
		mp.add_forced_key_binding("n", "resume-no", function()
			mp.set_property("pause", "no")
			mp.commandv("seek", 0, "absolute", "exact")
			mp.osd_message("Starting from beginning")
			mp.remove_key_binding("resume-yes")
			mp.remove_key_binding("resume-no")
		end)
	end
end)
