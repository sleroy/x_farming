-- Farming Addons
-- by SaKeL

farming.path = minetest.get_modpath("farming_addons")

dofile(farming.path.."/api.lua")
dofile(farming.path.."/melon.lua")
dofile(farming.path.."/pumpkin.lua")
dofile(farming.path.."/coffee.lua")
dofile(farming.path.."/corn.lua")
dofile(farming.path.."/obsidian_wart.lua")

print ("[Mod] Farming Addons Loaded.")
