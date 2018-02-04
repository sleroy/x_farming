local minlight = 0
local maxlight = default.LIGHT_MAX

-- POTATO
farming.register_plant("farming_addons:potato", {
	description = "Potato Seed",
	paramtype2 = "meshoptions",
	inventory_image = "farming_addons_potato_seed.png",
	steps = 8,
	minlight = minlight,
	maxlight = maxlight,
	fertility = {"grassland"},
	groups = {flammable = 4},
	place_param2 = 3,
	on_use = minetest.item_eat(2),
})

--
-- Recipes
--
minetest.register_craftitem("farming_addons:bakedpotato", {
	description = "Baked Potato",
	inventory_image = "farming_addons_potato_baked.png",
	on_use = minetest.item_eat(5),
})

minetest.register_craftitem("farming_addons:poisonouspotato", {
	description = "Poisonous Potato",
	inventory_image = "farming_addons_potato_poisonous.png",
	on_use = minetest.item_eat(-5),
})

-- needed for hbhunger
minetest.override_item("farming_addons:potato", {
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "farming_addons:bakedpotato",
	recipe = "farming_addons:potato"
})

-- add poisonous potato to drops
minetest.override_item("farming_addons:potato_8", {
	drop = {
		items = {
			{items = {"farming_addons:potato"}, rarity = 1},
			{items = {"farming_addons:potato"}, rarity = 2},
			{items = {"farming_addons:poisonouspotato"}, rarity = 5},
			{items = {"farming_addons:seed_potato"}, rarity = 1},
			{items = {"farming_addons:seed_potato"}, rarity = 2},
		}
	}
})
