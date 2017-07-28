-- CORN
farming.register_plant("farming_addons:corn", {
	description = "corn Seed",
	paramtype2 = "meshoptions",
	inventory_image = "farming_addons_corn_seed.png",
	steps = 10,
	minlight = 13,
	maxlight = default.LIGHT_MAX,
	fertility = {"grassland"},
	groups = {flammable = 4},
	place_param2 = 3,
})

minetest.override_item("farming_addons:corn_6", {
	visual_scale = 2.0,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.6, 0.25}
	}
})

minetest.override_item("farming_addons:corn_7", {
	visual_scale = 2.0,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.6, 0.25}
	}
})

minetest.override_item("farming_addons:corn_8", {
	visual_scale = 2.0,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.6, 0.25}
	}
})

minetest.override_item("farming_addons:corn_9", {
	visual_scale = 2.0,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.6, 0.25}
	}
})

minetest.override_item("farming_addons:corn_10", {
	visual_scale = 2.0,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.6, 0.25}
	}
})

-- CRAFTING
minetest.register_craftitem("farming_addons:corn_pop", {
	description = "Popped corn",
	inventory_image = "farming_addons_corn_pop.png",
	on_use = minetest.item_eat(1),
})

minetest.register_craft( {
	type = "cooking",
	cooktime = 10,
	output = "farming_addons:corn_pop",
	recipe = "farming_addons:corn"
})

minetest.register_craft( {
	output = "farming_addons:corn_popcorn",
	recipe = {
		{"farming_addons:corn_pop", "farming_addons:corn_pop","farming_addons:corn_pop"},
		{"default:paper", "","default:paper"},
		{"default:paper", "default:paper","default:paper"},
	},
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty"}}
})

-- popcorn
minetest.register_node("farming_addons:corn_popcorn", {
	description = "Popcorn",
	drawtype = "plantlike",
	tiles = {"farming_addons_corn_popcorn.png"},
	inventory_image = "farming_addons_corn_popcorn.png",
	wield_image = "farming_addons_corn_popcorn.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.25, 0.25}
	},
	groups = {dig_immediate = 3, attached_node = 1},
	on_use = minetest.item_eat(3),
	sounds = default.node_sound_leaves_defaults(),
})