-- MELON
farming.register_plant("x_farming:melon", {
	description = "Melon Seed",
	inventory_image = "x_farming_melon_seed.png",
	steps = 8,
	minlight = MINLIGHT,
	maxlight = MAXLIGHT,
	fertility = {"grassland"},
	groups = {flammable = 4},
	place_param2 = 3,
})

-- needed
minetest.override_item("x_farming:melon", {
	on_use = minetest.item_eat(2),
	wield_image = "x_farming_melon.png^[transformR90",
})

-- MELON FRUIT - HARVEST
minetest.register_node("x_farming:melon_fruit", {
	description = "Melon Fruit",
	tiles = {"x_farming_melon_fruit_top.png", "x_farming_melon_fruit_top.png", "x_farming_melon_fruit_side.png", "x_farming_melon_fruit_side.png", "x_farming_melon_fruit_side.png", "x_farming_melon_fruit_side.png"},
	sounds = default.node_sound_wood_defaults(),
	is_ground_content = false,
	groups = {snappy=3, flammable=4, fall_damage_add_percent=-30},
	drop = {
		max_items = 7,  -- Maximum number of items to drop.
		items = { -- Choose max_items randomly from this list.
			{
				items = {"x_farming:melon"},  -- Items to drop.
				rarity = 1,  -- Probability of dropping is 1 / rarity.
			},
			{
				items = {"x_farming:melon"},  -- Items to drop.
				rarity = 2,  -- Probability of dropping is 1 / rarity.
			},
			{
				items = {"x_farming:melon"},  -- Items to drop.
				rarity = 2,  -- Probability of dropping is 1 / rarity.
			},
			{
				items = {"x_farming:melon"},  -- Items to drop.
				rarity = 2,  -- Probability of dropping is 1 / rarity.
			},
			{
				items = {"x_farming:melon"},  -- Items to drop.
				rarity = 3,  -- Probability of dropping is 1 / rarity.
			},
			{
				items = {"x_farming:melon"},  -- Items to drop.
				rarity = 3,  -- Probability of dropping is 1 / rarity.
			},
			{
				items = {"x_farming:melon"},  -- Items to drop.
				rarity = 3,  -- Probability of dropping is 1 / rarity.
			},
		},
	},
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		local parent = oldmetadata.fields.parent
		local parent_pos_from_child = minetest.string_to_pos(parent)
		local parent_node = nil

		-- make sure we have position
		if parent_pos_from_child
			and parent_pos_from_child ~= nil then

			parent_node = minetest.get_node(parent_pos_from_child)
		end

		-- tick parent if parent stem still exists
		if parent_node
			and parent_node ~= nil
			and parent_node.name == "x_farming:melon_8" then

			x_farming.tick(parent_pos_from_child)
		end
	end
})

-- MELON BLOCK - HARVEST from crops
minetest.register_node("x_farming:melon_block", {
	description = "Melon Block",
	tiles = {"x_farming_melon_fruit_top.png", "x_farming_melon_fruit_top.png", "x_farming_melon_fruit_side.png", "x_farming_melon_fruit_side.png", "x_farming_melon_fruit_side.png", "x_farming_melon_fruit_side.png"},
	sounds = default.node_sound_wood_defaults(),
	is_ground_content = false,
	groups = {snappy=3, flammable=4, fall_damage_add_percent=-30}
})

-- take over the growth from minetest_game farming from here
minetest.override_item("x_farming:melon_8", {
	next_plant = "x_farming:melon_fruit",
	on_timer = x_farming.grow_block
})

-- replacement LBM for pre-nodetimer plants
minetest.register_lbm({
	name = "x_farming:start_nodetimer_melon",
	nodenames = {"x_farming:melon_8"},
	action = function(pos, node)
		x_farming.tick_short(pos)
	end,
})
