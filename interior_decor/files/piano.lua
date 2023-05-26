
-- Added support to the piano mod: https://forum.minetest.net/viewtopic.php?t=22662



local on_rightclick
if minetest.get_modpath("piano") then
	
	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		if not clicker:is_player() then
			return itemstack
		end
		
		local name = clicker:get_player_name()
		minetest.show_formspec(name, "piano_keyboard", piano_form)
		
	end
	-- If the piano mod was not found, the interior decor piano node is
	-- just a decorative node.
end


-- Piano:
minetest.register_node("interior_decor:piano", {
    description = "interior decor piano", -- The piano is still slightly offset into one of the horizontal directions.
    drawtype = "mesh",
    paramtype = "light",
    paramtype2 = "facedir",
    mesh = "interior_decor_piano.obj",
    tiles = {
        "interior_decor_piano_base.png",
        "interior_decor_piano_parts.png",
    },
    collision_box = {
		type = "fixed",
		fixed = {
			{ -0.4, -0.4, -0.4, 1.4, 1.15, 0.4, },
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{ -0.4, -0.4, -0.4, 1.4, 1.15, 0.4, },
		}
	},
    visual_scale = 0.04, --0.0625, -- 1/16
    wield_scale = vector.new(0.0625,0.0625,0.0625),
    groups = {oddly_breakable_by_hand = 3, axey=2},
    mcl_hardness=0.6,
    on_rightclick = on_rightclick,
})
