local minlight = 13
local maxlight = default.LIGHT_MAX

-- MELON
farming.register_plant("farming_addons:melon", {
	description = "Melon Seed",
	paramtype2 = "meshoptions",
	inventory_image = "farming_addons_melon_seed.png",
	steps = 8,
	minlight = minlight,
	maxlight = maxlight,
	fertility = {"grassland"},
	groups = {flammable = 4},
	place_param2 = 3,
})

-- MELON BLOCK
minetest.register_node("farming_addons:melon_fruit", {
	description = "Melon Fruit",
	tiles = {"farming_addons_melon_fruit_top.png", "farming_addons_melon_fruit_top.png", "farming_addons_melon_fruit_side.png", "farming_addons_melon_fruit_side.png", "farming_addons_melon_fruit_side.png", "farming_addons_melon_fruit_side.png"},
	sounds = default.node_sound_wood_defaults(),
	is_ground_content = false,
	groups = {snappy=3, flammable=4, fall_damage_add_percent=-30},
	drop = {
		max_items = 7,  -- Maximum number of items to drop.
		items = { -- Choose max_items randomly from this list.
			{
				items = {"farming_addons:melon"},  -- Items to drop.
				rarity = 1,  -- Probability of dropping is 1 / rarity.
			},
			{
				items = {"farming_addons:melon"},  -- Items to drop.
				rarity = 2,  -- Probability of dropping is 1 / rarity.
			},
			{
				items = {"farming_addons:melon"},  -- Items to drop.
				rarity = 2,  -- Probability of dropping is 1 / rarity.
			},
			{
				items = {"farming_addons:melon"},  -- Items to drop.
				rarity = 2,  -- Probability of dropping is 1 / rarity.
			},
			{
				items = {"farming_addons:melon"},  -- Items to drop.
				rarity = 3,  -- Probability of dropping is 1 / rarity.
			},
			{
				items = {"farming_addons:melon"},  -- Items to drop.
				rarity = 3,  -- Probability of dropping is 1 / rarity.
			},
			{
				items = {"farming_addons:melon"},  -- Items to drop.
				rarity = 3,  -- Probability of dropping is 1 / rarity.
			},
		},
	},
})

minetest.register_craftitem("farming_addons:golden_melon", {
	description = "Golden Melon - Restores Hearts",
	drawtype = "plantlike",
	tiles = {"farming_addons_golden_melon.png"},
	inventory_image = "farming_addons_golden_melon.png",
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craft({
	output = "farming_addons:golden_melon",
	recipe = {
		{"default:gold_lump", "default:gold_lump", "default:gold_lump"},
		{"default:gold_lump", "farming_addons:melon", "default:gold_lump"},
		{"default:gold_lump", "default:gold_lump", "default:gold_lump"}
	},
})

minetest.register_craft({
	output = "farming_addons:melon_fruit",
	recipe = {
		{"farming_addons:melon", "farming_addons:melon", "farming_addons:melon"},
		{"farming_addons:melon", "farming_addons:melon", "farming_addons:melon"},
		{"farming_addons:melon", "farming_addons:melon", "farming_addons:melon"}
	},
})

minetest.override_item("farming_addons:melon", {
	on_use = minetest.item_eat(2),
})

local function grow_melon(pos, elapsed)
	local node = minetest.get_node(pos)
	local random_pos = false
	local spawn_positions = {}
	local right = minetest.get_node({x=pos.x+1, y=pos.y, z=pos.z})
	local front = minetest.get_node({x=pos.x, y=pos.y, z=pos.z+1})
	local left = minetest.get_node({x=pos.x-1, y=pos.y, z=pos.z})
	local back = minetest.get_node({x=pos.x, y=pos.y, z=pos.z-1})

	if right.name == "farming_addons:melon_fruit"
	or front.name == "farming_addons:melon_fruit"
	or left.name == "farming_addons:melon_fruit"
	or back.name == "farming_addons:melon_fruit" then
		return
	end

	-- make sure that at least one side of the plant has space to put melon
	if right.name == "air" then
		table.insert(spawn_positions, {x=pos.x+1, y=pos.y, z=pos.z})
	end
	if front.name == "air" then
		table.insert(spawn_positions, {x=pos.x, y=pos.y, z=pos.z+1})
	end
	if left.name == "air" then
		table.insert(spawn_positions, {x=pos.x-1, y=pos.y, z=pos.z})
	end
	if back.name == "air" then
		table.insert(spawn_positions, {x=pos.x, y=pos.y, z=pos.z-1})
	end

	if #spawn_positions < 1 then
		-- plant is closed from all sides
		return false
	else
		-- pick random from the open sides
		local pick_random

		if #spawn_positions == 1 then
			pick_random = #spawn_positions
		else
			pick_random = math.random(1,#spawn_positions)
		end
		
		for k, v in pairs (spawn_positions) do
			if k == pick_random then
				random_pos = v
			end
		end
	end

	-- check light
	local light = minetest.get_node_light(pos)
	if not light or light < minlight or light > maxlight then
		return
	end

	if random_pos then
		-- spawn melon
		minetest.set_node(random_pos, {name="farming_addons:melon_fruit"})
	end

end

minetest.register_abm({
	label = "melon_growing_abm",
	nodenames = {"farming_addons:melon_8"},
	neighbors = {"air"},
	interval = 300,
	chance = 2,
	catch_up = true,
	action = grow_melon
})

minetest.log("action", "[Mod] farming_addons loaded")
