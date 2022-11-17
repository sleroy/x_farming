-- Authors of source code
-- ----------------------
-- Originally by Vanessa Ezekowitz (LGPLv2.1+)
-- Modified by Perttu Ahola <celeron55@gmail.com> (LGPLv2.1+)
-- Various Minetest developers and contributors (LGPLv2.1+)

local S = minetest.get_translator(minetest.get_current_modname())

minetest.register_node('x_farming:glass_bottle', {
    description = S('Empty Glass Bottle'),
    drawtype = 'plantlike',
    tiles = { 'x_farming_vessels_glass_bottle.png' },
    inventory_image = 'x_farming_vessels_glass_bottle.png',
    wield_image = 'x_farming_vessels_glass_bottle.png',
    paramtype = 'light',
    is_ground_content = false,
    walkable = false,
    selection_box = {
        type = 'fixed',
        fixed = { -0.25, -0.5, -0.25, 0.25, 0.3, 0.25 }
    },
    groups = { vessel = 1, dig_immediate = 3, attached_node = 1 },
    sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
    output = 'x_farming:glass_bottle 10',
    recipe = {
        { 'default:glass', '', 'default:glass' },
        { 'default:glass', '', 'default:glass' },
        { '', 'default:glass', '' }
    }
})
