
-- Grandfather clock:
minetest.register_node("interior_decor:grandfather_clock", {
    description = "interior decor grandfather clock",
    drawtype = "mesh",
    paramtype = "light",
    paramtype2 = "facedir",
    mesh = "interior_decor_grandfather_clock.obj",
    tiles = {
		"interior_decor_grandfather_clock_base.png",
        "interior_decor_grandfather_clock_b.png",
        "interior_decor_grandfather_clock_m0.png",
        "interior_decor_grandfather_clock_m0.png", --m1
        "interior_decor_grandfather_clock_c.png",
        "interior_decor_grandfather_clock_a.png",
    },
    overlay_tiles = {
		{
			name = "interior_decor_grandfather_clock_base_minutes.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 64,
				aspect_h = 64,
				length = 60, -- 12 = 1 minute
			},
		},
    },
    
    use_texture_alpha = "blend",
    visual_scale = 0.042, --0.0625, -- 1/16
    collision_box = {
		type = "fixed",
		fixed = {
			{ -0.25, -0.01, -0.25, 0.25, 1.5, 0.25, }
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{ -0.25, -0.01, -0.25, 0.25, 1.5, 0.25, }
		}
	},
    wield_scale = vector.new(0.0625,0.0625,0.0625),
    groups = {oddly_breakable_by_hand = 3, axey=2},
    mcl_hardness=0.6,
    
    on_construct = function(pos)
		-- Start the count	
		minetest.env:get_node_timer(pos):start(1)
	end,
    
    on_timer = function (pos, elapsed)	
		--Ticking the clock
		minetest.sound_play("clock", {gain = 3, max_hear_distance = 1, loop = false})
		local meta = minetest.get_meta(pos)
		local time1 = minetest.get_timeofday()*24000
		
		local hours = math.floor(time1/1000)
		local decinutes = (time1%1000)/10
		local minutes = tonumber(string.format("%.4f", decinutes*0.6))
		
		if minutes < 10 then
			meta:set_string("infotext", "time: ".. hours ..":0" .. minutes)
		else
			meta:set_string("infotext", "time: ".. hours ..":" .. minutes)
		end
		-- If hit midnight or midday, play this tune
		if (time1 >= 0 and time1 < 30) or (time1 > 12000 and time1 < 12030) then 
			minetest.sound_play("clock_strikes_twelve",	{gain = 1, max_hear_distance = 1, loop = false})
		end
		
		-- Loop the timer:
		return true
	end,
    
})
