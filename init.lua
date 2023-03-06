--[[
    X Farming. Extends Minetest farming mod with new plants, crops and ice fishing.
    Copyright (C) 2023 SaKeL <juraj.vajda@gmail.com>

    This library is free software; you can redistribute it and/or
    modify it pos the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this library; if not, write to juraj.vajda@gmail.com
--]]

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
    x_bonemeal = {
        tree_defs = {
            ['x_farming:christmas_tree_sapling'] = {
                -- christmas tree
                name = 'x_farming:christmas_tree_sapling',
                chance = 2,
                grow_tree = function(pos)
                    if not x_farming.x_bonemeal.is_on_soil(pos) then
                        return false
                    end

                    x_farming.grow_christmas_tree(pos)

                    return true
                end
            },
            ['default:sapling'] = {
                -- apple tree
                name = 'default:sapling',
                chance = 2,
                grow_tree = function(pos)
                    if not x_farming.x_bonemeal.is_on_soil(pos) then
                        return false
                    end

                    default.grow_new_apple_tree(pos)

                    return true
                end
            },
            ['default:junglesapling'] = {
                -- jungle tree
                name = 'default:junglesapling',
                chance = 2,
                grow_tree = function(pos)
                    if not x_farming.x_bonemeal.is_on_soil(pos) then
                        return false
                    end

                    default.grow_new_jungle_tree(pos)

                    return true
                end
            },
            ['default:emergent_jungle_sapling'] = {
                -- emergent jungle tree
                name = 'default:emergent_jungle_sapling',
                chance = 2,
                grow_tree = function(pos)
                    if not x_farming.x_bonemeal.is_on_soil(pos) then
                        return false
                    end

                    default.grow_new_emergent_jungle_tree(pos)

                    return true
                end
            },
            ['default:acacia_sapling'] = {
                -- acacia tree
                name = 'default:acacia_sapling',
                chance = 2,
                grow_tree = function(pos)
                    if not x_farming.x_bonemeal.is_on_soil(pos) then
                        return false
                    end

                    default.grow_new_acacia_tree(pos)

                    return true
                end
            },
            ['default:aspen_sapling'] = {
                -- aspen tree
                name = 'default:aspen_sapling',
                chance = 2,
                grow_tree = function(pos)
                    if not x_farming.x_bonemeal.is_on_soil(pos) then
                        return false
                    end

                    default.grow_new_aspen_tree(pos)

                    return true
                end
            },
            ['default:pine_sapling'] = {
                -- pine tree
                name = 'default:pine_sapling',
                chance = 2,
                grow_tree = function(pos)
                    if not x_farming.x_bonemeal.is_on_soil(pos) then
                        return false
                    end

                    if minetest.find_node_near(pos, 1, { 'group:snowy' }) then
                        default.grow_new_snowy_pine_tree(pos)
                    else
                        default.grow_new_pine_tree(pos)
                    end

                    return true
                end
            },
            ['default:bush_sapling'] = {
                -- Bush
                name = 'default:bush_sapling',
                chance = 2,
                grow_tree = function(pos)
                    if not x_farming.x_bonemeal.is_on_soil(pos) then
                        return false
                    end

                    default.grow_bush(pos)

                    return true
                end
            },
            ['default:acacia_bush_sapling'] = {
                -- Acacia bush
                name = 'default:acacia_bush_sapling',
                chance = 2,
                grow_tree = function(pos)
                    if not x_farming.x_bonemeal.is_on_soil(pos) then
                        return false
                    end

                    default.grow_acacia_bush(pos)

                    return true
                end
            },
            ['default:pine_bush_sapling'] = {
                -- Pine bush
                name = 'default:pine_bush_sapling',
                chance = 2,
                grow_tree = function(pos)
                    if not x_farming.x_bonemeal.is_on_soil(pos) then
                        return false
                    end

                    default.grow_pine_bush(pos)

                    return true
                end
            },
            ['default:blueberry_bush_sapling'] = {
                -- Blueberry bush
                name = 'default:blueberry_bush_sapling',
                chance = 2,
                grow_tree = function(pos)
                    if not x_farming.x_bonemeal.is_on_soil(pos) then
                        return false
                    end

                    default.grow_blueberry_bush(pos)

                    return true
                end
            },
            ['default:papyrus'] = {
                -- Papyrus
                name = 'default:papyrus',
                chance = 2,
                grow_tree = function(pos)
                    if not x_farming.x_bonemeal.is_on_soil(pos) then
                        return false
                    end

                    local node = minetest.get_node(pos)

                    default.grow_papyrus(pos, node)

                    return true
                end
            },
            ['default:large_cactus_seedling'] = {
                -- Large Cactus
                name = 'default:large_cactus_seedling',
                chance = 2,
                grow_tree = function(pos)
                    if not x_farming.x_bonemeal.is_on_sand(pos) then
                        return false
                    end

                    default.grow_large_cactus(pos)

                    return true
                end
            },
            ['x_farming:kiwi_sapling'] = {
                -- Kiwi Tree
                name = 'x_farming:kiwi_sapling',
                chance = 2,
                grow_tree = function(pos)
                    if not x_farming.x_bonemeal.is_on_soil(pos) then
                        return false
                    end

                    x_farming.grow_kiwi_tree(pos)

                    return true
                end
            },
            ['x_farming:large_cactus_with_fruit_seedling'] = {
                -- Cactus Seedling
                name = 'x_farming:large_cactus_with_fruit_seedling',
                chance = 2,
                grow_tree = function(pos)
                    if not x_farming.x_bonemeal.is_on_sand(pos) then
                        return false
                    end

                    x_farming.grow_large_cactus(pos)

                    return true
                end
            },
            ['x_farming:jungle_with_cocoa_sapling'] = {
                -- Jungle Tree with Cocoa
                name = 'x_farming:jungle_with_cocoa_sapling',
                chance = 2,
                grow_tree = function(pos)
                    if not x_farming.x_bonemeal.is_on_soil(pos) then
                        return false
                    end

                    x_farming.grow_jungle_tree(pos)

                    return true
                end
            },
            ['x_farming:pine_nut_sapling'] = {
                -- Pine Nut Tree
                name = 'x_farming:pine_nut_sapling',
                chance = 2,
                grow_tree = function(pos)
                    if not x_farming.x_bonemeal.is_on_soil(pos) then
                        return false
                    end

                    x_farming.grow_pine_nut_tree(pos)

                    return true
                end
            },
        }
    },
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
dofile(path .. '/christmas_tree.lua')
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
