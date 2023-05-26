

-- Copied from jukebox mod:


interior_decor.gramophone = {}
interior_decor.registered_discs = {}

function interior_decor.register_disc(name, def)
	def.stack_max = 1
	
	local music_name = def.music_name
	def.music_name = nil

	minetest.register_craftitem(":" .. name, def)

	interior_decor.registered_discs[name] = music_name
end

-- Gramophone:
local handlers = {}

minetest.register_node("interior_decor:gramophone", {
    description = "interior decor gramophone",
    drawtype = "mesh",
    paramtype = "light",
    paramtype2 = "facedir",
    mesh = "interior_decor_gramophone.obj",
    tiles = {
        "interior_decor_gramophone_base.png",
        "interior_decor_gramophone_horn.png",
        "interior_decor_gramophone_record.png",
    },
    visual_scale = 0.0625, -- 1/16
    collision_box = {
		type = "fixed",
		fixed = {
			{ -0.25, -0.5, -0.25, 0.25, 0, 0.25, }
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{ -0.25, -0.5, -0.25, 0.25, 0, 0.25, }
		}
	},
    wield_scale = vector.new(0.0625,0.0625,0.0625),
    groups = {choppy = 2, flammable = 2, oddly_breakable_by_hand = 3, axey=2},
    mcl_hardness=0.6,
    --sounds = default.node_sound_wood_defaults(),
    
    
	-- Allow Placement and retrieval of disc.
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		inv:set_size("main", 1)
	end,
	on_destruct = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()

		if inv:is_empty("main") then return end

		local drop_pos = minetest.find_node_near(pos, 1, "air")
		if not drop_pos then drop_pos = {x = pos.x, y = pos.y + 1, z = pos.z} end

		minetest.add_item(drop_pos, inv:get_stack("main", 1))
		inv:remove_item("main", inv:get_stack("main", 1))

		local pos_string = minetest.pos_to_string(pos)

		if handlers[pos_string] then
			minetest.sound_stop(handlers[pos_string])
		end
	end,
	
	
	--TODO: make work with music disks or something
	on_rightclick = function(pos, node, clicker, itemstack)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()

		local pos_string = minetest.pos_to_string(pos)

		if inv:is_empty("main") then
			local item_name = itemstack:get_name()
			local music_name = interior_decor.registered_discs[item_name]

			if not music_name then return end

			inv:set_stack("main", 1, itemstack:take_item())

			local handle = minetest.sound_play(music_name, {
				pos = pos,
				gain = 0.5,
				max_hear_distance = 25,
				loop = true
			})

			handlers[pos_string] = handle

			meta:set_string("music_name", music_name) -- for LBM
		else
			local drop_pos = minetest.find_node_near(pos, 1, "air")
			if not drop_pos then drop_pos = {x = pos.x, y = pos.y + 1, z = pos.z} end

			minetest.add_item(drop_pos, inv:get_stack("main", 1))
			inv:remove_item("main", inv:get_stack("main", 1))

			if handlers[pos_string] then
				minetest.sound_stop(handlers[pos_string])
			end
		end
	end
})


-- Resume playing the music if there is a disc in the gramophone on joinplayer (is it working?)
minetest.register_lbm({
	name = "interior_decor:resume_playing",
	nodenames = "interior_decor:gramophone",
	action = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()

		local pos_string = minetest.pos_to_string(pos)

		if inv:is_empty("main") then return end
		if handlers[pos_string] then return end

		local music_name = meta:get_string("music_name")
		local handle = minetest.sound_play(music_name, {
			pos = pos,
			gain = 0.5,
			max_hear_distance = 25,
			loop = true
		})

		handlers[pos_string] = handle
	end
})


local S = minetest.get_translator("interior_decor")

-- +---------+
-- |  Discs  |
-- +---------+

for i = 0, 9 do
	local item_name = "interior_decor:disc_" .. i
	local description = S("Music Disc @1", i)
	local inventory_image = "gramophone_disc_" .. i .. ".png"
	local music_name = "gramophone_disc_" .. i

	interior_decor.register_disc(item_name, {
		description = description,
		inventory_image = inventory_image,
		music_name = music_name
	})
end
