
-- 3d models and textures fro easy swap:
local skinList = {
			sam			= {"sam_kneebendable.b3d"			, "character_sam.png"			},
			samantha	= {"samantha_kneebendable.b3d"		, "character_samantha.png"		},
			custom		= {"sam_kneebendable.b3d"			, "character_custom.png"		},
			custom_beel	= {"beel_kneebendable_custom.b3d"	, "character_custom_beel.png"	},
}


-- Variables to add as settings(todo):

local headanim_true	= true
local currentModel	= skinList.custom
local eyelevel		= 1.6

-- I try using minetest.register_on_joinplayer() to swap the player model but it did not work,
-- minetest.after() was extremely inconsistent, with a time interval = 0 seconds it didn't worked at all
-- while a time interval = 1 or 2 seconds it sometimes worked sometimes it did nothing.
-- The solution I used was given by prestidigitator in the forum: https://forum.minetest.net/viewtopic.php?t=9687

-- Create a table to store the callable functions:
local playerReadyCallbacks = {};

-- Function to test if 'foo' is a function otherwise, if it's an object test if 
-- it's metadata is a function:
local function isCallable(func)
   if not func then 
      return false
   elseif type(func) == "function" then
      return true
   else
      local meta = getmetatable(func)
      return isCallable(meta and meta.__call)
   end
end

-- Function to run all the player  function:
local function firePlayerReadyCallbacks(player)
   for _, func in ipairs(playerReadyCallbacks) do
      func(player)
   end
end

-- Check if func can run and if playerReadyCallbacks is empty?
function addPlayerReadyCallback(func)
   assert(isCallable(func), "playerReady callback must be callable")

   if not next(playerReadyCallbacks) then
      minetest.register_on_joinplayer(
         function(player)
            minetest.after(0, firePlayerReadyCallbacks, player)
         end);
   end

   table.insert(playerReadyCallbacks, func)
end

-- Add the function to swap the model and texture to the table 'playerReadyCallbacks':
addPlayerReadyCallback(function(player) 
	player:set_properties({
		eye_height	=  eyelevel,
		mesh		=  currentModel[1],
		textures	= {currentModel[2] }
		--visual_size	= {x=1,y=1.05},
	})
end)

-- Add animation to the head. The custom models I'm using have the head showing backwards with the mod headanim,
-- this code has the headanim tweaked to show with the right direction:
if headanim_true and not minetest.get_modpath("headanim") then
	dofile( minetest.get_modpath(minetest.get_current_modname()) .."/hdanim_adapt.lua")
end


