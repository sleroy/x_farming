-- Farming Addons
-- by SaKeL

farming.path = minetest.get_modpath("farming_addons")

dofile(farming.path.."/melon.lua")
dofile(farming.path.."/coffee.lua")

minetest.log("action", "[Mod] farming_addons loaded")
