
-- Pile of books:
minetest.register_node("interior_decor:books", {
    description = "interior decor books",
    drawtype = "mesh",
    paramtype = "light",
    paramtype2 = "facedir",
    mesh = "interior_decor_books.obj",
    tiles = {"interior_decor_books.png"},
    visual_scale = 0.046, -- 0.0625, -- 1/16
    collision_box = {
		type = "fixed",
		fixed = {
			{ -0.25, -0.5, -0.25, 0.25, 0.2, 0.25, },
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{ -0.25, -0.5, -0.25, 0.25, 0.2, 0.25, },
		}
	},
    wield_scale = vector.new(0.0625,0.0625,0.0625),
    groups = {oddly_breakable_by_hand = 3, axey=2},
    _mcl_hardness=0.6,
})

-- World Globe:
minetest.register_node("interior_decor:globe", {
    description = "interior decor globe",
    drawtype = "mesh",
    paramtype = "light",
    paramtype2 = "facedir",
    mesh = "interior_decor_globe.obj",
    tiles = {"interior_decor_globe.png"},
    visual_scale = 0.054, --0.0625, -- 1/16 -- 1/32 + 
    collision_box = {
		type = "fixed",
		fixed = {
			{ -0.25, -0.5, -0.25, 0.25, 0.3, 0.25, },
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{ -0.25, -0.5, -0.25, 0.25, 0.3, 0.25, },
		}
	},
    wield_scale = vector.new(0.0625,0.0625,0.0625),
    groups = {oddly_breakable_by_hand = 3, axey=2},
    _mcl_hardness=0.6,
    --TODO: open up formspec with minimap of area, with you are here and optional support for markers or whatever
})

-- Mug:
minetest.register_node("interior_decor:mug", {
    description = "interior decor mug",
    drawtype = "mesh",
    paramtype = "light",
    paramtype2 = "facedir",
    mesh = "interior_decor_mug.obj",
    tiles = {"interior_decor_mug.png"},
    visual_scale = 0.0625, -- 1/16
    collision_box = {
		type = "fixed",
		fixed = {
			{ -0.2, -0.5, -0.2, 0.2, 0.0, 0.2, },
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{ -0.2, -0.5, -0.2, 0.2, 0.0, 0.2, },
		}
	},
    wield_scale = vector.new(0.0625,0.0625,0.0625),
    groups = {oddly_breakable_by_hand = 3, axey=2},
    _mcl_hardness=0.6,
})

