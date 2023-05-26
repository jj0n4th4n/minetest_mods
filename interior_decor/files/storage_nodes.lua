
-- Crate:
minetest.register_node("interior_decor:crate", {
    description = "interior decor crate",
    drawtype = "mesh",
    paramtype = "light",
    mesh = "interior_decor_crate.obj",
    tiles = {"interior_decor_crate.png"},
    visual_scale = 0.0625, -- 1/16
    wield_scale = vector.new(0.0625,0.0625,0.0625),
    groups = {oddly_breakable_by_hand = 3, axey=2},
    _mcl_hardness=0.6,
    on_construct = function(pos)
        minetest.get_meta(pos):get_inventory():set_size("main", 9*3)
    end,
    on_place = function(itemstack, placer, pointed_thing)
        local ipv = minetest.item_place(itemstack, placer, pointed_thing)

        if itemstack:get_meta():get("contents") then
            local contents = minetest.deserialize(itemstack:get_meta():get("contents"))
            for k,v in pairs(contents) do
                contents[k] = ItemStack(v)
            end

            minetest.get_meta(pointed_thing.above):get_inventory():set_list("main", contents)
        end
        if itemstack:get_meta():get("description") then
            minetest.get_meta(pointed_thing.above):set_string(
                "description", itemstack:get_meta():get("description")
            )
        else
            local description = placer and placer:get_player_name() .. "'s crate" or "unknown's crate"
            minetest.get_meta(pointed_thing.above):set_string(
                "description", description
            )
        end
        return ipv
    end,
    on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
        local fnpos = table.concat({pos.x, pos.y, pos.z}, ",")
        local fs = {
            "size[8,8]",
            "listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]",
            "label[0,-0.25;" .. minetest.get_meta(pos):get_string("description") .. "]",
            "style_type[list;spacing=0.1]",
            "list[nodemeta:" .. fnpos .. ";main;0,0.3;9,3;]",
            "label[0,3.2;Inventory]",
            "style_type[list;spacing=0.25]", --reset to default
            "list[current_player;main;0,3.75;8,4;]",
            "listring[nodemeta:" .. fnpos .. ";main]",
            "listring[current_player;main]",
        }
        --TODO: support i3, add checkbox for locking to placing player or not

        minetest.show_formspec(clicker:get_player_name(), "interior_decor:crate_fs", table.concat(fs, ""))
    end,
    preserve_metadata = function(pos, oldnode, oldmeta, drops)
        local meta = minetest.get_meta(pos)

        local stringlist = {}
        for k,v in pairs(meta:get_inventory():get_list("main")) do
            stringlist[#stringlist+1] = v:to_string()
        end
        --minetest meta limits will be an issue way be minetest.serialize failing will be
        drops[1]:get_meta():set_string("contents", minetest.serialize(stringlist))

        if meta:get("description") then
            drops[1]:get_meta():set_string("description", minetest.get_meta(pos):get_string("description"))
        end
    end,

})

-- Drawers:
minetest.register_node("interior_decor:drawer", {
    description = "interior decor drawer",
    drawtype = "mesh",
    paramtype = "light",
    paramtype2 = "facedir",
    mesh = "interior_decor_drawer.obj",
    tiles = {"interior_decor_drawer.png"},
    visual_scale = 0.0625, -- 1/16
    wield_scale = vector.new(0.0625,0.0625,0.0625),
    groups = {oddly_breakable_by_hand = 3, axey=2},
    _mcl_hardness=0.6,
    on_construct = function(pos)
        minetest.get_meta(pos):get_inventory():set_size("main", 9*2)
    end,
    on_place = function(itemstack, placer, pointed_thing)
        local ipv = minetest.item_place(itemstack, placer, pointed_thing)

        if itemstack:get_meta():get("description") then
            minetest.get_meta(pointed_thing.above):set_string(
                "description", itemstack:get_meta():get("description")
            )
        else
            local description = placer and placer:get_player_name() .. "'s drawer" or "unknown's drawer"
            minetest.get_meta(pointed_thing.above):set_string(
                "description", description
            )
        end
        return ipv
    end,
    on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
        local fnpos = table.concat({pos.x, pos.y, pos.z}, ",")
        local fs = {
            "size[8,7]",
            "listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]",
            "label[0,-0.25;" .. minetest.get_meta(pos):get_string("description") .. "]",
            "style_type[list;spacing=0.1]",
            "list[nodemeta:" .. fnpos .. ";main;0,0.3;9,2;]",
            "label[0,2.2;Inventory]",
            "style_type[list;spacing=0.25]", --reset to default
            "list[current_player;main;0,2.75;8,4;]",
            "listring[nodemeta:" .. fnpos .. ";main]",
            "listring[current_player;main]",
        }
        --TODO: support i3, add checkbox for locking to placing player or not

        minetest.show_formspec(clicker:get_player_name(), "interior_decor:crate_fs", table.concat(fs, ""))
    end,
    on_dig = function(pos, node, digger)
        local inv = minetest.get_inventory({type="node", pos=pos})
        for _, item in ipairs(inv:get_list("main")) do
            local posi = {
                x=pos.x + (math.random(-2,2)/5),
                y=pos.y + (math.random(0,2)/5),
                z=pos.z + (math.random(-2,2)/5),
            }
            minetest.add_item(posi, item)
        end
        minetest.node_dig(pos, node, digger)
    end,
    preserve_metadata = function(pos, oldnode, oldmeta, drops)
        if minetest.get_meta(pos):get("description") then
            drops[1]:get_meta():set_string("description", minetest.get_meta(pos):get_string("description"))
        end
    end,
})

