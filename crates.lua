-- minetest.register_node('x_farming:crate_carrot_1', {
--     description = 'Carrot Crate Half Empty',
--     short_description = 'Carrot Crate Half Empty',
--     drawtype = 'mesh',
--     mesh = 'x_farming_crate.obj',
--     tiles = {'x_farming_crate_carrot_1.png'},
--     sounds = default.node_sound_wood_defaults(),
--     paramtype2 = 'facedir',
--     place_param2 = 0,
--     is_ground_content = false,
--     groups = {choppy = 2, oddly_breakable_by_hand = 2},
-- })

-- minetest.register_node('x_farming:crate_carrot_2', {
--     description = 'Carrot Crate Half Full',
--     short_description = 'Carrot Crate Half Full',
--     drawtype = 'mesh',
--     mesh = 'x_farming_crate.obj',
--     tiles = {'x_farming_crate_carrot_2.png'},
--     sounds = default.node_sound_wood_defaults(),
--     paramtype2 = 'facedir',
--     place_param2 = 0,
--     is_ground_content = false,
--     groups = {choppy = 2, oddly_breakable_by_hand = 2},
-- })

---Crates
x_farming.register_crate('crate_empty', {
    description = 'Crate Empty',
    tiles = {'x_farming_crate_empty.png'},
    groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
    stack_max = tonumber(minetest.settings:get('default_stack_max')) or 99
})

---crate wheat
x_farming.register_crate('crate_wheat_3', {
    description = 'Wheat Crate',
    tiles = {'x_farming_crate_wheat_3.png'},
    _custom = {
        crate_item = 'farming:wheat'
    }
})

---crate cotton
x_farming.register_crate('crate_cotton_3', {
    description = 'Cotton Crate',
    tiles = {'x_farming_crate_cotton_3.png'},
    _custom = {
        crate_item = 'farming:cotton'
    }
})
