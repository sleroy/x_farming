local minlight = 13
local maxlight = default.LIGHT_MAX

-- POTATO
farming.register_plant("x_farming:potato", {
	description = "Planting Potato",
	paramtype2 = "meshoptions",
	inventory_image = "x_farming_potato_seed.png",
	steps = 8,
	minlight = minlight,
	maxlight = maxlight,
	fertility = {"grassland"},
	groups = {flammable = 4},
	place_param2 = 3,
	on_use = minetest.item_eat(2),
})

-- needed
minetest.override_item("x_farming:potato", {
	on_use = minetest.item_eat(2),
})

-- add poisonous potato to drops
minetest.override_item("x_farming:potato_8", {
	drop = {
		items = {
			{items = {"x_farming:potato"}, rarity = 1},
			{items = {"x_farming:potato"}, rarity = 2},
			{items = {"x_farming:poisonouspotato"}, rarity = 5},
			{items = {"x_farming:seed_potato"}, rarity = 1},
			{items = {"x_farming:seed_potato"}, rarity = 2},
		}
	}
})

if minetest.get_modpath("hbhunger") ~= nil then
	hbhunger.register_food("x_farming:poisonouspotato", 1, "", 5)
end