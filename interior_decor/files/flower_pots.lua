local modname = "flowers:"
local desc	  = "Flower pot with a "


-- Table of flower nodes used to register nodes:
interior_decor.flowers = { 
		-- fullnodename 				, nodename				, description			, growth_level, texture
		{"interior_decor:flowerpot_rose", "large_rose"			, "large rose"			, 2	, "interior_decor_flower_pot_rose_2.png"},
}

-- Load file with all the registered flowers and plants:
dofile( minetest.get_modpath("interior_decor") .. "/files" .. "/fpots_mod_support.lua")

-- Registering the flower pot node:
for i in pairs(interior_decor.flowers) do
	
	-- Flowers variables:
	local newtiles = {
		{name = "interior_decor_flower_pot_pot.png"},
		{name = interior_decor.flowers[i][5] .. "^[transformR180"}, -- Necessay because the texture of the flowerpot is upside down
		{name = interior_decor.flowers[i][5] .. "^[transformR180"}, -- Necessay because the texture of the flowerpot is upside down
	}
	local name    = interior_decor.flowers[i][2] .. "_".. tostring(interior_decor.flowers[i][4])
	local label   = desc .. interior_decor.flowers[i][3]
	local grouped = {oddly_breakable_by_hand = 3, axey=2,  flammable = 2, not_in_creative_inventory=1}
	
	-- Registering nodes from the table:
	minetest.register_node(":interior_decor:flowerpot_" .. name, {
		description = label,
		drawtype = "mesh",
		paramtype = "light",
		paramtype2 = "facedir",
		mesh = "interior_decor_flower_pot.obj",
		tiles = newtiles,
		visual_scale = 0.0625, -- 1/16
		collision_box = {
			type = "fixed",
			fixed = {
				{ -0.15,  0.01, -0.15, 0.15, 0.2, 0.15, },
				{ -0.25, -0.5 , -0.25, 0.25, 0.0, 0.25, }
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{ -0.15,  0.01, -0.15, 0.15, 0.6, 0.15, },
				{ -0.25, -0.5 , -0.25, 0.25, 0.0, 0.25, }
			}
		},
		wield_scale = vector.new(0.0625,0.0625,0.0625),
		groups = grouped,
		mcl_hardness=0.6,
		drop = {
			max_items = 1,
			items = {
				{rarity = 2, items = {interior_decor.flowers[i][1]	}	}, -- 50% chance: drop this
				{rarity = 1, items = {"interior_decor:dry_shrub"}	}, -- otherwise : drop this
			}
		},
		
		after_dig_node = function(pos, oldnode, oldmetadata, digger)
			minetest.swap_node(pos, {name = "interior_decor:flowerpot"})
		end,
	})
		

end


-- Functions to fill the flowerpot with the right flower:
local function search_table(tbl, element)
    found = false
    --for _, v in pairs(tbl) do
    for i in pairs(tbl) do
        if element == tbl[i][1] then 
            found = true 
        end
    end
    return found
end

local function indexOf(tbl, value)
    for i in pairs(tbl) do
        if tbl[i][1] == value then 
            return i
        end
    end
    return nil
end

local on_rightclick_flowerpot = function(pos, node, clicker, itemstack, pointed_thing)
	local item_name = itemstack:get_name()
	local foundE	= search_table(interior_decor.flowers, item_name)
	
	if foundE then
		
		local i		= indexOf(interior_decor.flowers, item_name)
		local named = "interior_decor:flowerpot_" .. interior_decor.flowers[i][2] .. "_".. tostring(interior_decor.flowers[i][4])
		
		minetest.swap_node(pos, {name = named})
		itemstack:take_item()
		
	else
		return itemstack
	end

		
end


-- Dry shrub (50% chance of drop on breaking a flowerpot plant, make placing plants more engaging): 
minetest.register_node("interior_decor:dry_shrub", {
	description = "Dry Shrub",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"default_dry_shrub.png"},
	inventory_image = "interior_decor_flower_pot_dry_shrub.png",
	wield_image = "interior_decor_flower_pot_dry_shrub.png",
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 4,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flammable = 3, attached_node = 1, not_in_creative_inventory=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 4 / 16, 6 / 16},
	},
})


-- Empty Flower Pot:
minetest.register_node("interior_decor:flowerpot", {
    description = "Empty flower pot",
    drawtype = "mesh",
    paramtype = "light",
    paramtype2 = "facedir",
    mesh = "interior_decor_flower_pot.obj",
    tiles = {
        "interior_decor_flower_pot_pot.png",
        "empty.png",
    },
    visual_scale = 0.0625, -- 1/16
    collision_box = {
		type = "fixed",
		fixed = {
			{ -0.25, -0.5 , -0.25, 0.25, 0.0, 0.25, }
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{ -0.25, -0.5 , -0.25, 0.25, 0.0, 0.25, }
		}
	},
    wield_scale = vector.new(0.0625,0.0625,0.0625),
    groups = {oddly_breakable_by_hand = 3, axey=2},
    _mcl_hardness=0.6,
    
    on_rightclick = on_rightclick_flowerpot,
})
