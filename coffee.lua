-- COFFEE
farming.register_plant("farming_addons:coffee", {
	description = "Coffee Seed",
	paramtype2 = "meshoptions",
	inventory_image = "farming_addons_coffee_seed.png",
	steps = 5,
	minlight = 13,
	maxlight = default.LIGHT_MAX,
	fertility = {"grassland"},
	groups = {flammable = 4},
	place_param2 = 3,
})

-- cold cup of coffee
minetest.register_node("farming_addons:coffee_cup", {
	description = "Cold Cup of Coffee",
	drawtype = "plantlike",
	tiles = {"farming_coffee_cup.png"},
	inventory_image = "farming_coffee_cup.png",
	wield_image = "farming_coffee_cup.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.25, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	on_use = minetest.item_eat(2, "vessels:drinking_glass"),
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft( {
	output = "farming_addons:coffee_cup",
	recipe = {
		{"vessels:drinking_glass", "farming_addons:coffee","bucket:bucket_water"},
	},
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty"}}
})

minetest.register_craft({
	type = "cooking",
	cooktime = 5,
	output = "farming_addons:coffee_cup_hot",
	recipe = "farming_addons:coffee_cup"
})

-- hot cup of coffee
minetest.register_node("farming_addons:coffee_cup_hot", {
	description = "Hot Cup of Coffee",
	drawtype = "plantlike",
	tiles = {"farming_coffee_cup_hot.png"},
	inventory_image = "farming_coffee_cup_hot.png",
	wield_image = "farming_coffee_cup_hot.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.25, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	on_use = minetest.item_eat(3, "vessels:drinking_glass"),
	sounds = default.node_sound_glass_defaults(),
})

-- coffee definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_coffee_1.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	drop = "",
	selection_box = farming.select,
	groups = {
		snappy = 3, flammable = 2, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1, growing = 1
	},
	sounds = default.node_sound_leaves_defaults()
}
