local minlight = 13
local maxlight = default.LIGHT_MAX

-- carrot
farming.register_plant("x_farming:carrot", {
	description = "Planting Carrot",
	paramtype2 = "meshoptions",
	inventory_image = "x_farming_carrot_seed.png",
	steps = 8,
	minlight = minlight,
	maxlight = maxlight,
	fertility = {"grassland"},
	groups = {flammable = 4},
	place_param2 = 3,
	on_use = minetest.item_eat(3),
})

-- needed
minetest.override_item("x_farming:carrot", {
	description = "Carrot" .. "\n" .. minetest.colorize(x_farming.colors.brown, "Hunger: 3"),
	on_use = minetest.item_eat(3),
})
