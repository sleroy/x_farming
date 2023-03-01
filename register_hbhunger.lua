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

-- name, hunger_change, replace_with_item, poisen, heal, sound

-- beetroot
hbhunger.register_food('x_farming:beetroot', 3)
hbhunger.register_food('x_farming:beetroot_soup', 6, 'x_farming:bowl')

-- carrot
hbhunger.register_food('x_farming:carrot', 3)
hbhunger.register_food('x_farming:carrot_golden', 10, nil, nil, 10)

-- coffee
hbhunger.register_food('x_farming:coffee_cup_hot', 6, nil, nil, 4)

-- corn
hbhunger.register_food('x_farming:corn_pop', 1)
hbhunger.register_food('x_farming:corn_popcorn', 5)

-- melon
hbhunger.register_food('x_farming:melon', 2)
hbhunger.register_food('x_farming:golden_melon', 10, '', nil, 10)

-- potato
hbhunger.register_food('x_farming:potato', 2)
hbhunger.register_food('x_farming:bakedpotato', 6)
hbhunger.register_food('x_farming:poisonouspotato', -6, nil, 5)

-- pumpkin
hbhunger.register_food('x_farming:pumpkin_pie', 6)

-- fish stew
hbhunger.register_food('x_farming:fish_stew', 8, 'x_farming:bowl')

-- cocoa
hbhunger.register_food('x_farming:cookie', 2)
hbhunger.register_food('x_farming:chocolate', 3)

-- kiwi
hbhunger.register_food('x_farming:kiwi_fruit', 2)

-- Dragon fruit
hbhunger.register_food('x_farming:cactus_fruit_item', 2)

-- Strawberry
hbhunger.register_food('x_farming:strawberry', 2)

-- Pine Nut Roasted
hbhunger.register_food('x_farming:pine_nut_roasted', 2)

-- Donuts
hbhunger.register_food('x_farming:donut', 3)
hbhunger.register_food('x_farming:donut_chocolate', 4)

--  Fries
hbhunger.register_food('x_farming:fries', 6)
