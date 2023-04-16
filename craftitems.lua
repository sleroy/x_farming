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

--
-- Craft items
--

local S = minetest.get_translator(minetest.get_current_modname())

minetest.register_craftitem('x_farming:flour', {
    description = S('Barley Flour'),
    inventory_image = 'x_farming_flour.png',
    groups = { food_flour = 1, flammable = 1 },
})

minetest.register_craftitem('x_farming:bread', {
    description = S('Barley Bread'),
    inventory_image = 'x_farming_bread.png',
    on_use = minetest.item_eat(5),
    groups = { food_bread = 1, flammable = 2 },
})

minetest.register_craftitem('x_farming:string', {
    description = S('Cotton String'),
    inventory_image = 'x_farming_string.png',
    groups = { flammable = 2 },
})
