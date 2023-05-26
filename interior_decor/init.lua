
local mod_path = minetest.get_modpath("interior_decor")
local fpath = "/files"

interior_decor = {}
interior_decor.flowers = {}



dofile(mod_path.. fpath.. "/decorative_nodes.lua")
dofile(mod_path.. fpath.. "/flower_pots.lua")
dofile(mod_path.. fpath.. "/storage_nodes.lua")

dofile(mod_path.. fpath.. "/grandfather_clock.lua")
dofile(mod_path.. fpath.. "/gramophone.lua")
dofile(mod_path.. fpath.. "/piano.lua")
