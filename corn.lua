
local S = minetest.get_translator(minetest.get_current_modname())

-- CORN
farming.register_plant('x_farming:corn', {
    description = S('Corn Seed') .. '\n' .. S('Compost chance') .. ': 30%',
    short_description = S('Corn Seed'),
    paramtype2 = 'meshoptions',
    inventory_image = 'x_farming_corn_seed.png',
    steps = 10,
    minlight = 13,
    maxlight = default.LIGHT_MAX,
    fertility = { 'grassland' },
    groups = { flammable = 4 },
    place_param2 = 3,
})

-- needed
minetest.override_item('x_farming:corn', {
    description = S('Corn') .. '\n' .. S('Compost chance') .. ': 50%',
    short_description = S('Corn'),
    groups = { compost = 50 }
})

minetest.override_item('x_farming:corn_6', {
    visual_scale = 2.0,
    selection_box = {
        type = 'fixed',
        fixed = { -0.25, -0.5, -0.25, 0.25, 0.6, 0.25 }
    }
})

minetest.override_item('x_farming:corn_7', {
    visual_scale = 2.0,
    selection_box = {
        type = 'fixed',
        fixed = { -0.25, -0.5, -0.25, 0.25, 0.6, 0.25 }
    }
})

minetest.override_item('x_farming:corn_8', {
    visual_scale = 2.0,
    selection_box = {
        type = 'fixed',
        fixed = { -0.25, -0.5, -0.25, 0.25, 0.6, 0.25 }
    }
})

minetest.override_item('x_farming:corn_9', {
    visual_scale = 2.0,
    selection_box = {
        type = 'fixed',
        fixed = { -0.25, -0.5, -0.25, 0.25, 0.6, 0.25 }
    }
})

minetest.override_item('x_farming:corn_10', {
    visual_scale = 2.0,
    selection_box = {
        type = 'fixed',
        fixed = { -0.25, -0.5, -0.25, 0.25, 0.6, 0.25 }
    }
})

-- popcorn
minetest.register_node('x_farming:corn_popcorn', {
    description = S('Popcorn') .. '\n' .. S('Compost chance') .. ': 65%\n'
        .. minetest.colorize(x_farming.colors.brown, S('Hunger') .. ': 5'),
    short_description = S('Popcorn'),
    drawtype = 'mesh',
    mesh = 'x_farming_corn_popcorn.obj',
    tiles = { 'x_farming_corn_popcorn_mesh.png' },
    inventory_image = 'x_farming_corn_popcorn.png',
    wield_image = 'x_farming_corn_popcorn.png',
    paramtype = 'light',
    is_ground_content = false,
    walkable = true,
    selection_box = {
        type = 'fixed',
        fixed = { -0.3, -0.5, -0.3, 0.3, 0.4, 0.3 }
    },
    collision_box = {
        type = 'fixed',
        fixed = { -0.3, -0.5, -0.3, 0.3, 0.25, 0.3 }
    },
    groups = { dig_immediate = 3, attached_node = 1, compost = 65 },
    sounds = default.node_sound_leaves_defaults(),
    on_use = minetest.item_eat(5),
    sunlight_propagates = true
})

minetest.register_decoration({
    name = 'x_farming:corn_10',
    deco_type = 'simple',
    place_on = { 'default:sand' },
    sidelen = 16,
    noise_params = {
        offset = -0.1,
        scale = 0.1,
        spread = { x = 50, y = 50, z = 50 },
        seed = 4242,
        octaves = 3,
        persist = 0.7
    },
    biomes = { 'sandstone_desert' },
    y_max = 31000,
    y_min = 1,
    decoration = 'x_farming:corn_10',
    param2 = 3,
})

---crate
x_farming.register_crate('crate_corn_3', {
    description = S('Corn Crate'),
    short_description = S('Corn Crate'),
    tiles = { 'x_farming_crate_corn_3.png' },
    _custom = {
        crate_item = 'x_farming:corn'
    }
})
