-- Farming Addons
-- by SaKeL

-- Intllib
local S
if minetest.get_modpath("intllib") then
  S = intllib.Getter()
else
  S = function(s, a, ...)
    if a == nil then
      return s
    end
    a = {a, ...}
    return s:gsub("(@?)@(%(?)(%d+)(%)?)",
      function(e, o, n, c)
        if e == ""then
          return a[tonumber(n)] .. (o == "" and c or "")
        else
          return "@" .. o .. n .. c
        end
      end)
  end
end
mobs.intllib = S

farming.path = minetest.get_modpath("farming_addons")

dofile(farming.path.."/melon.lua")
dofile(farming.path.."/pumpkin.lua")
dofile(farming.path.."/coffee.lua")
dofile(farming.path.."/corn.lua")
dofile(farming.path.."/snow_golem.lua")

minetest.log("action", "[Mod] farming_addons loaded")
