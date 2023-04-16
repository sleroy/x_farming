--[[
    X Farming. Extends Minetest farming mod with new plants, crops and ice fishing.
    Copyright (C) 2023 SaKeL <juraj.vajda@gmail.com>

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

stairs = stairs --[[@as MtgStairs]]

local S = minetest.get_translator(minetest.get_current_modname())
local minlight = 0
local maxlight = 14

-- OBSIDIAN WART
x_farming.register_plant('x_farming:obsidian_wart', {
    description = S('Obsidian Wart Seed') .. '\n' .. S('Plant on Obsidian') .. '\n' .. S('Compost chance') .. ': 30%',
    short_description = S('Obsidian Wart Seed'),
    paramtype2 = 'meshoptions',
    inventory_image = 'x_farming_obsidian_wart_seed.png',
    steps = 6,
    minlight = minlight,
    maxlight = maxlight,
    fertility = { 'underground' },
    groups = { flammable = 4 },
    place_param2 = 3
})

-- needed
minetest.override_item('x_farming:obsidian_wart', {
    description = S('Obsidian Wart') .. '\n' .. S('Compost chance') .. ': 65%',
    short_description = S('Obsidian Wart'),
    groups = { compost = 65 }
})

if minetest.get_modpath('default') then
    -- default obsidian
    minetest.override_item('default:obsidian', {
        groups = { cracky = 1, level = 2, soil = 1, underground = 1 },
        soil = {
            base = 'default:obsidian',
            dry = 'x_farming:obsidian_soil',
            wet = 'x_farming:obsidian_soil_wet'
        }
    })

    -- obsidian - soil
    minetest.register_node('x_farming:obsidian_soil', {
        description = S('Obsidian Soil'),
        short_description = S('Obsidian Soil'),
        drop = 'default:obsidian',
        tiles = { 'x_farming_obsidian_soil.png', 'default_obsidian.png' },
        groups = { cracky = 1, level = 2, soil = 2, underground = 1, field = 1, not_in_creative_inventory = 1 },
        sounds = x_farming.node_sound_stone_defaults(),
        soil = {
            base = 'default:obsidian',
            dry = 'x_farming:obsidian_soil',
            wet = 'x_farming:obsidian_soil_wet'
        }
    })

    -- obsidian - soil - wet
    minetest.register_node('x_farming:obsidian_soil_wet', {
        description = S('Wet Obsidian Soil'),
        short_description = S('Wet Obsidian Soil'),
        drop = 'default:obsidian',
        tiles = { 'x_farming_obsidian_soil_wet.png', 'x_farming_obsidian_soil_wet_side.png' },
        groups = { cracky = 1, level = 2, soil = 3, wet = 1, underground = 1, field = 1, not_in_creative_inventory = 1 },
        sounds = x_farming.node_sound_stone_defaults(),
        soil = {
            base = 'default:obsidian',
            dry = 'x_farming:obsidian_soil',
            wet = 'x_farming:obsidian_soil_wet'
        }
    })
end

--
-- Nodes
--
minetest.register_node('x_farming:wart_block', {
    description = S('Wart Block') .. '\n' .. S('Compost chance') .. ': 85%',
    short_description = S('Wart Block'),
    tiles = { 'x_farming_wart_block.png' },
    groups = { cracky = 3, compost = 85 },
    sounds = x_farming.node_sound_stone_defaults()
})

minetest.register_node('x_farming:wartrack', {
    description = S('Wartrack'),
    short_description = S('Wartrack'),
    tiles = { 'x_farming_wartrack.png' },
    groups = { cracky = 3 },
    sounds = x_farming.node_sound_stone_defaults()
})

minetest.register_node('x_farming:wart_brick_block', {
    description = S('Wart Brick Block'),
    short_description = S('Wart Brick Block'),
    tiles = { 'x_farming_wart_brick_block.png' },
    groups = { cracky = 2 },
    sounds = x_farming.node_sound_stone_defaults()
})

minetest.register_node('x_farming:wart_red_brick_block', {
    description = S('Wart Red Brick Block'),
    short_description = S('Wart Red Brick Block'),
    tiles = { 'x_farming_wart_red_brick_block.png' },
    groups = { cracky = 2 },
    sounds = x_farming.node_sound_stone_defaults()
})

--
-- Register Wart stairs and slabs
--
    if minetest.get_modpath('default') then
    stairs.register_stair_and_slab(
        'wart_block',
        'x_farming:wart_block',
        { cracky = 3 },
        { 'x_farming_wart_block.png' },
        S('Wart Block Stair'),
        S('Wart Block Slab'),
        x_farming.node_sound_stone_defaults()
    )

    stairs.register_stair_and_slab(
        'wart_brick_block',
        'x_farming:wart_brick_block',
        { cracky = 2 },
        { 'x_farming_wart_brick_block.png' },
        S('Wart Brick Stair'),
        S('Wart Brick Slab'),
        x_farming.node_sound_stone_defaults()
    )

    stairs.register_stair_and_slab(
        'wart_red_brick_block',
        'x_farming:wart_red_brick_block',
        { cracky = 2 },
        { 'x_farming_wart_red_brick_block.png' },
        S('Wart Red Brick Stair'),
        S('Wart Red Brick Slab'),
        x_farming.node_sound_stone_defaults()
    )

    stairs.register_stair_and_slab(
        'wartrack',
        'x_farming:wartrack',
        { cracky = 3 },
        { 'x_farming_wartrack.png' },
        S('Wartrack Stair'),
        S('Wartrack Slab'),
        x_farming.node_sound_stone_defaults()
    )
end

minetest.register_node('x_farming:obsidian_wart_decor', {
    description = S('Obsidian Wart'),
    short_description = S('Obsidian Wart'),
    drawtype = 'plantlike_rooted',
    waving = 1,
    paramtype = 'light',
    tiles = { 'default_obsidian.png' },
    special_tiles = { { name = 'x_farming_obsidian_wart_6.png', tileable_vertical = true } },
    inventory_image = 'x_farming_obsidian_wart_6.png',
    groups = { snappy = 3, not_in_creative_inventory = 1 },
    light_source = 4,
    selection_box = {
        type = 'fixed',
        fixed = {
            { -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 },
            { -4 / 16, 0.5, -4 / 16, 4 / 16, 1.5, 4 / 16 },
        },
    },
    node_dig_prediction = 'default:obsidian',
    node_placement_prediction = '',
    sounds = x_farming.node_sound_stone_defaults({
        dig = { name = 'default_dig_snappy', gain = 0.2 },
        dug = { name = 'default_grass_footstep', gain = 0.25 },
    }),
    drop = {
        items = {
            { items = { 'x_farming:obsidian_wart' }, rarity = 1 },
            { items = { 'x_farming:obsidian_wart' }, rarity = 2 },
            { items = { 'x_farming:seed_obsidian_wart' }, rarity = 1 },
            { items = { 'x_farming:seed_obsidian_wart' }, rarity = 2 }
        }
    },

    after_destruct = function(pos, oldnode)
        minetest.set_node(pos, { name = 'default:obsidian' })
    end,
})

---crate
x_farming.register_crate('crate_obsidian_wart_3', {
    description = S('Obsidian Wart Crate'),
    short_description = S('Obsidian Wart Crate'),
    tiles = { 'x_farming_crate_obsidian_wart_3.png' },
    _custom = {
        crate_item = 'x_farming:obsidian_wart'
    }
})

minetest.register_on_mods_loaded(function()
    local deco_place_on = {}
    local deco_biomes = {}

    -- MTG
    if minetest.get_modpath('default') then
        table.insert(deco_place_on, 'default:stone')
        table.insert(deco_biomes, 'icesheet_under')
        table.insert(deco_biomes, 'tundra_under')
        table.insert(deco_biomes, 'taiga_under')
        table.insert(deco_biomes, 'snowy_grassland_under')
        table.insert(deco_biomes, 'grassland_under')
        table.insert(deco_biomes, 'coniferous_forest_under')
        table.insert(deco_biomes, 'deciduous_forest_under')
        table.insert(deco_biomes, 'desert_under')
        table.insert(deco_biomes, 'sandstone_desert_under')
        table.insert(deco_biomes, 'cold_desert_under')
        table.insert(deco_biomes, 'savanna_under')
        table.insert(deco_biomes, 'rainforest_under')
    end

    if next(deco_place_on) and next(deco_biomes) then
        minetest.register_decoration({
            name = 'x_farming:obsidian_wart_decor',
            deco_type = 'simple',
            place_offset_y = -1,
            place_on = deco_place_on,
            sidelen = 16,
            noise_params = {
                offset = -0.1,
                scale = 0.1,
                spread = { x = 50, y = 50, z = 50 },
                seed = 4242,
                octaves = 3,
                persist = 0.7
            },
            biomes = deco_biomes,
            y_max = -1000,
            y_min = -31000,
            flags = 'force_placement, all_floors',
            decoration = { 'x_farming:obsidian_wart_decor' },
        })
    end
end)
