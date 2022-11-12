farming = minetest.global_exists('farming') and farming --[[@as MtgFarming]]

local S = minetest.get_translator(minetest.get_current_modname())
local minlight = 13
local maxlight = default.LIGHT_MAX

---beetroot
farming.register_plant('x_farming:beetroot', {
    description = S('Beetroot Seed'),
    paramtype2 = 'meshoptions',
    inventory_image = 'x_farming_beetroot_seed.png',
    steps = 8,
    minlight = minlight,
    maxlight = maxlight,
    fertility = { 'grassland' },
    groups = { flammable = 4 },
    place_param2 = 3,
    on_use = minetest.item_eat(3),
})

---needed
minetest.override_item('x_farming:beetroot', {
    description = S('Beetroot') .. '\n' .. minetest.colorize(x_farming.colors.brown, S('Hunger') .. ': 3'),
    on_use = minetest.item_eat(3),
})

minetest.register_decoration({
    name = 'x_farming:beetroot_8',
    deco_type = 'simple',
    place_on = { 'default:silver_sand' },
    sidelen = 16,
    noise_params = {
        offset = -0.1,
        scale = 0.1,
        spread = { x = 50, y = 50, z = 50 },
        seed = 4242,
        octaves = 3,
        persist = 0.7
    },
    biomes = { 'cold_desert' },
    y_max = 31000,
    y_min = 1,
    decoration = 'x_farming:beetroot_8',
    param2 = 3,
})

---crate
x_farming.register_crate('crate_beetroot_3', {
    description = S('Beetroot Crate'),
    tiles = { 'x_farming_crate_beetroot_3.png' },
    _custom = {
        crate_item = 'x_farming:beetroot'
    }
})
