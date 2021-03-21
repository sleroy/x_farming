-- COFFEE
farming.register_plant("x_farming:coffee", {
	description = "Coffee Seed",
	paramtype2 = "meshoptions",
	inventory_image = "x_farming_coffee_seed.png",
	steps = 5,
	minlight = 13,
	maxlight = default.LIGHT_MAX,
	fertility = {"grassland"},
	groups = {flammable = 4},
	place_param2 = 3,
})

-- cold cup of coffee
minetest.register_node("x_farming:coffee_cup", {
	description = "Cold Cup of Coffee" .. "\n" .. minetest.colorize(x_farming.colors.brown, "Hunger: 4"),
	drawtype = "plantlike",
	tiles = {"x_farming_coffee_cup.png"},
	inventory_image = "x_farming_coffee_cup.png",
	wield_image = "x_farming_coffee_cup.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.25, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	on_use = minetest.item_eat(4, "vessels:drinking_glass"),
	sounds = default.node_sound_glass_defaults(),
})

-- hot cup of coffee
local coffee_cup_hot_desc = "Hot Cup of Coffee" .. "\n" .. minetest.colorize(x_farming.colors.brown, "Hunger: 6")

if x_farming.hbhunger ~= nil then
	coffee_cup_hot_desc = coffee_cup_hot_desc .. "\n" .. minetest.colorize(x_farming.colors.red, "Heal: 4")
end

minetest.register_node("x_farming:coffee_cup_hot", {
	description = coffee_cup_hot_desc,
	drawtype = "plantlike",
	tiles = {"x_farming_coffee_cup_hot.png"},
	inventory_image = "x_farming_coffee_cup_hot.png",
	wield_image = "x_farming_coffee_cup_hot.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.25, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	on_use = minetest.item_eat(6, "vessels:drinking_glass"),
	sounds = default.node_sound_glass_defaults(),
})
