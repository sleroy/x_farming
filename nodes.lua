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

-- Hog Stew
minetest.register_node('x_farming:hog_stew', {
    description = S('Hog Stew') .. '\n' .. S('Compost chance') .. ': 100%\n'
        .. minetest.colorize(x_farming.colors.brown, S('Hunger') .. ': 8'),
    short_description = S('Hog Stew'),
    drawtype = 'mesh',
    mesh = 'x_farming_hog_stew.obj',
    tiles = { 'x_farming_hog_stew_mesh.png' },
    inventory_image = 'x_farming_hog_stew.png',
    wield_image = 'x_farming_hog_stew.png',
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
