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

-- Donuts
minetest.register_node('x_farming:donut', {
    description = S('Donut') .. '\n' .. S('Compost chance') .. ': 85%\n'
        .. minetest.colorize(x_farming.colors.brown, S('Hunger') .. ': 3'),
    short_description = S('Donut'),
    drawtype = 'mesh',
    mesh = 'x_farming_donut.obj',
    tiles = { 'x_farming_donut_mesh.png' },
    inventory_image = 'x_farming_donut.png',
    wield_image = 'x_farming_donut.png',
    paramtype = 'light',
    is_ground_content = false,
    walkable = true,
    selection_box = {
        type = 'fixed',
        fixed = { -0.25, -0.5, -0.25, 0.25, -0.35, 0.25 }
    },
    collision_box = {
        type = 'fixed',
        fixed = { -0.25, -0.5, -0.25, 0.25, -0.35, 0.25 }
    },
    groups = { dig_immediate = 3, attached_node = 1, compost = 85 },
    sounds = default.node_sound_leaves_defaults(),
    on_use = minetest.item_eat(3),
    sunlight_propagates = true
})

minetest.register_node('x_farming:donut_chocolate', {
    description = S('Chocolate Donut') .. '\n' .. S('Compost chance') .. ': 85%\n'
        .. minetest.colorize(x_farming.colors.brown, S('Hunger') .. ': 4'),
    short_description = S('Chocolate Donut'),
    drawtype = 'mesh',
    mesh = 'x_farming_donut.obj',
    tiles = { 'x_farming_donut_chocolate_mesh.png' },
    inventory_image = 'x_farming_donut_chocolate.png',
    wield_image = 'x_farming_donut_chocolate.png',
    paramtype = 'light',
    is_ground_content = false,
    walkable = true,
    selection_box = {
        type = 'fixed',
        fixed = { -0.25, -0.5, -0.25, 0.25, -0.35, 0.25 }
    },
    collision_box = {
        type = 'fixed',
        fixed = { -0.25, -0.5, -0.25, 0.25, -0.35, 0.25 }
    },
    groups = { dig_immediate = 3, attached_node = 1, compost = 85 },
    sounds = default.node_sound_leaves_defaults(),
    on_use = minetest.item_eat(4),
    sunlight_propagates = true
})

-- Fries
minetest.register_node('x_farming:fries', {
    description = S('Fries') .. '\n' .. S('Compost chance') .. ': 85%\n'
        .. minetest.colorize(x_farming.colors.brown, S('Hunger') .. ': 6'),
    short_description = S('Fries'),
    drawtype = 'mesh',
    mesh = 'x_farming_fries.obj',
    tiles = { 'x_farming_fries_mesh.png' },
    inventory_image = 'x_farming_fries.png',
    wield_image = 'x_farming_fries.png',
    paramtype = 'light',
    paramtype2 = 'facedir',
    is_ground_content = false,
    walkable = true,
    selection_box = {
        type = 'fixed',
        fixed = { -0.25, -0.5, -0.1, 0.25, 0.05, 0.1 }
    },
    collision_box = {
        type = 'fixed',
        fixed = { -0.25, -0.5, -0.1, 0.25, -0.2, 0.1 }
    },
    groups = { dig_immediate = 3, attached_node = 1, compost = 85 },
    sounds = default.node_sound_leaves_defaults(),
    on_use = minetest.item_eat(6),
    sunlight_propagates = true
})

-- Pumpkin pie
minetest.register_node('x_farming:pumpkin_pie', {
    description = S('Pumpkin Pie') .. '\n' .. S('Compost chance') .. ': 100%\n'
        .. minetest.colorize(x_farming.colors.brown, S('Hunger') .. ': 6'),
    short_description = S('Pumpkin Pie'),
    drawtype = 'mesh',
    mesh = 'x_farming_pumpkin_pie.obj',
    tiles = { 'x_farming_pumpkin_pie_mesh.png' },
    inventory_image = 'x_farming_pumpkin_pie.png',
    wield_image = 'x_farming_pumpkin_pie.png',
    paramtype = 'light',
    paramtype2 = 'facedir',
    is_ground_content = false,
    walkable = true,
    selection_box = {
        type = 'fixed',
        fixed = { -0.3, -0.5, -0.3, 0.3, -0.2, 0.3 }
    },
    collision_box = {
        type = 'fixed',
        fixed = { -0.3, -0.5, -0.3, 0.3, -0.3, 0.3 }
    },
    groups = { dig_immediate = 3, attached_node = 1, compost = 100 },
    sounds = default.node_sound_leaves_defaults(),
    on_use = minetest.item_eat(6),
    sunlight_propagates = true
})

-- Beetroot soup
minetest.register_node('x_farming:beetroot_soup', {
    description = S('Beetroot Soup') .. '\n' .. S('Compost chance') .. ': 100%\n'
        .. minetest.colorize(x_farming.colors.brown, S('Hunger') .. ': 6'),
    short_description = S('Beetroot Soup'),
    drawtype = 'mesh',
    mesh = 'x_farming_beetroot_soup.obj',
    tiles = { 'x_farming_beetroot_soup_mesh.png' },
    inventory_image = 'x_farming_beetroot_soup.png',
    wield_image = 'x_farming_beetroot_soup.png',
    paramtype = 'light',
    paramtype2 = 'facedir',
    is_ground_content = false,
    walkable = true,
    selection_box = {
        type = 'fixed',
        fixed = { -0.5, -0.5, -0.5, 0.5, 0.1, 0.5 }
    },
    collision_box = {
        type = 'fixed',
        fixed = { -0.5, -0.5, -0.5, 0.5, -0.1, 0.5 }
    },
    groups = { vessel = 1, dig_immediate = 3, attached_node = 1, compost = 100 },
    on_use = minetest.item_eat(6, 'x_farming:bowl'),
    sounds = default.node_sound_wood_defaults(),
    sunlight_propagates = true
})

-- Fish Stew
minetest.register_node('x_farming:fish_stew', {
    description = S('Fish Stew') .. '\n' .. S('Compost chance') .. ': 100%\n'
        .. minetest.colorize(x_farming.colors.brown, S('Hunger') .. ': 8'),
    short_description = S('Fish Stew'),
    drawtype = 'mesh',
    mesh = 'x_farming_fish_stew.obj',
    tiles = { 'x_farming_fish_stew_mesh.png' },
    inventory_image = 'x_farming_fish_stew.png',
    wield_image = 'x_farming_fish_stew.png',
    paramtype = 'light',
    paramtype2 = 'facedir',
    is_ground_content = false,
    walkable = true,
    selection_box = {
        type = 'fixed',
        fixed = { -0.5, -0.5, -0.5, 0.5, 0.1, 0.5 }
    },
    collision_box = {
        type = 'fixed',
        fixed = { -0.5, -0.5, -0.5, 0.5, -0.1, 0.5 }
    },
    groups = { vessel = 1, dig_immediate = 3, attached_node = 1, compost = 100 },
    on_use = minetest.item_eat(8, 'x_farming:bowl'),
    sounds = default.node_sound_wood_defaults(),
    sunlight_propagates = true
})

-- Cactus brick
minetest.register_node('x_farming:cactus_brick', {
    description = S('Cactus Brick'),
    short_description = S('Cactus Brick'),
    paramtype2 = 'facedir',
    place_param2 = 0,
    tiles = {
        'x_farming_cactus_brick.png^[transformFX',
        'x_farming_cactus_brick.png',
    },
    is_ground_content = false,
    groups = { cracky = 3 },
    sounds = default.node_sound_stone_defaults()
})

if minetest.global_exists('stairs') and minetest.get_modpath('stairs') then
    stairs.register_stair_and_slab(
        'cactus_brick',
        'x_farming:cactus_brick',
        { cracky = 3 },
        { 'x_farming_cactus_brick.png' },
        S('Cactus Brick Stair'),
        S('Cactus Brick Slab'),
        default.node_sound_stone_defaults(),
        false
    )
end

-- Scarecrow
minetest.register_node('x_farming:scarecrow', {
    description = S('Scarecrow'),
    short_description = S('Scarecrow'),
    drawtype = 'mesh',
    mesh = 'x_farming_scarecrow.obj',
    tiles = { 'x_farming_scarecrow_1.png' },
    inventory_image = 'x_farming_scarecrow_1_item.png',
    wield_image = 'x_farming_scarecrow_1_item.png',
    paramtype = 'light',
    sunlight_propagates = true,
    paramtype2 = 'facedir',
    is_ground_content = false,
    walkable = true,
    selection_box = {
        type = 'fixed',
        fixed = { -0.4, -0.5, -0.4, 0.4, 1.5, 0.4 }
    },
    collision_box = {
        type = 'fixed',
        fixed = { -0.4, -0.5, -0.4, 0.4, 1.5, 0.4 }
    },
    groups = { choppy = 1, oddly_breakable_by_hand = 1, flammable = 2 },
    sounds = default.node_sound_wood_defaults(),
})
