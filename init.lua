--[[
    X Farming. Extends Minetest farming mod with new plants, crops and ice fishing.
    Copyright (C) 2022 SaKeL <juraj.vajda@gmail.com>

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this library; if not, write to juraj.vajda@gmail.com
--]]

hbhunger = minetest.global_exists('hbhunger') and hbhunger --[[@as table]]

minetest.register_alias('x_farming:hog_stew', 'x_farming:fish_stew')

-- main class
x_farming = {
    hbhunger = minetest.get_modpath('hbhunger'),
    vessels = minetest.get_modpath('vessels'),
    bucket = minetest.get_modpath('bucket'),
    colors = {
        brown = '#DEB887',
        red = '#FF8080',
        green = '#98E698'
    },
    x_bonemeal = {},
    allowed_crate_items = {},
    allowed_bag_items = {},
    registered_crates = {},
    lbm_nodenames_crates = {}
}

local mod_start_time = minetest.get_us_time()
local path = minetest.get_modpath('x_farming')

dofile(path .. '/api.lua')
dofile(path .. '/melon.lua')
dofile(path .. '/pumpkin.lua')
dofile(path .. '/coffee.lua')
dofile(path .. '/corn.lua')
dofile(path .. '/obsidian_wart.lua')
dofile(path .. '/potato.lua')
dofile(path .. '/beetroot.lua')
dofile(path .. '/carrot.lua')
dofile(path .. '/cocoa.lua')
dofile(path .. '/seeds.lua')
dofile(path .. '/kiwi_tree.lua')
dofile(path .. '/cactus.lua')
dofile(path .. '/strawberry.lua')
dofile(path .. '/pine_nut.lua')
dofile(path .. '/stevia.lua')
dofile(path .. '/soybean.lua')
dofile(path .. '/salt.lua')
dofile(path .. '/ice_fishing.lua')
dofile(path .. '/nodes.lua')
dofile(path .. '/crafting.lua')
dofile(path .. '/bonemeal.lua')
dofile(path .. '/crates.lua')
dofile(path .. '/bags.lua')
dofile(path .. '/composter.lua')

if not x_farming.vessels then
    dofile(path .. '/vessels.lua')
end

---timer for crates
minetest.register_lbm({
    label = 'x_farming timer for crates',
    name = 'x_farming:start_nodetimer_crates',
    nodenames = x_farming.lbm_nodenames_crates,
    action = function(pos, node)
        x_farming.tick_again_crates(pos)
    end
})

-- hbhunger
if x_farming.hbhunger ~= nil then
    if hbhunger.register_food ~= nil then
        dofile(path .. '/register_hbhunger.lua')
    end
end

-- mob
if minetest.get_modpath('mobs_npc') then
    dofile(path .. '/snow_golem.lua')
end

local mod_end_time = (minetest.get_us_time() - mod_start_time) / 1000000

print('[Mod] x_farming loaded.. [' .. mod_end_time .. 's]')
