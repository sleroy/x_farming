---Empty bag
x_farming.register_bag('bag_empty', {
    description = 'Bag Empty',
    tiles = {'x_farming_bag_empty.png'},
    groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
    stack_max = tonumber(minetest.settings:get('default_stack_max')) or 99
})
