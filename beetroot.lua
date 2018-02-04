local minlight = 0
local maxlight = default.LIGHT_MAX

-- beetroot
farming.register_plant("farming_addons:beetroot", {
	description = "Beetroot Seed",
	paramtype2 = "meshoptions",
	inventory_image = "farming_addons_beetroot_seed.png",
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

-- needed for hbhunger
minetest.override_item("farming_addons:beetroot", {
	on_use = minetest.item_eat(2),
})

-- Beetroot Soup
-- minetest.register_craft({
-- 	type = "cooking",
-- 	cooktime = 10,
-- 	output = "farming_addons:bakedbeetroot",
-- 	recipe = "farming_addons:beetroot"
-- })
