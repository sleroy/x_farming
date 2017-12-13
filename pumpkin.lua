local minlight = 13
local maxlight = default.LIGHT_MAX

local function pumpkin_on_construct(pos)
	for i = 1,2 do
		if minetest.get_node({x=pos.x,y=pos.y-i,z=pos.z}).name ~= "default:snowblock" then
			return
		end
	end
	
	--if 3 snow block are placed, this will make snowman
	
	for i = 0,2 do
		minetest.remove_node({x=pos.x,y=pos.y-i,z=pos.z})
	end

	minetest.add_entity({x=pos.x,y=pos.y-1,z=pos.z}, "mobs_npc:snow_golem")
end

-- PUMPKIN
farming.register_plant("farming_addons:pumpkin", {
	description = "Pumpkin Seed",
	inventory_image = "farming_addons_pumpkin_seed.png",
	steps = 8,
	minlight = minlight,
	maxlight = maxlight,
	fertility = {"grassland"},
	groups = {flammable = 4},
	place_param2 = 3,
})

-- PUMPKIN FRUIT - HARVEST
minetest.register_node("farming_addons:pumpkin_fruit", {
	description = "Pumpkin Fruit",
	tiles = {"farming_addons_pumpkin_fruit_top.png", "farming_addons_pumpkin_fruit_top.png", "farming_addons_pumpkin_fruit_side.png", "farming_addons_pumpkin_fruit_side.png", "farming_addons_pumpkin_fruit_side.png", "farming_addons_pumpkin_fruit_side_off.png"},
	paramtype2 = "facedir",
	sounds = default.node_sound_wood_defaults(),
	is_ground_content = false,
	groups = {snappy=3, flammable=4, fall_damage_add_percent=-30},
		drop = {
		max_items = 4,  -- Maximum number of items to drop.
		items = { -- Choose max_items randomly from this list.
			{
				items = {"farming_addons:pumpkin"},  -- Items to drop.
				rarity = 1,  -- Probability of dropping is 1 / rarity.
			},
			{
				items = {"farming_addons:pumpkin"},  -- Items to drop.
				rarity = 2,  -- Probability of dropping is 1 / rarity.
			}
		},
	},
})

-- PUMPKIN BLOCK - HARVEST from crops
minetest.register_node("farming_addons:pumpkin_block", {
	description = "Pumpkin Block",
	tiles = {"farming_addons_pumpkin_fruit_top.png", "farming_addons_pumpkin_fruit_top.png", "farming_addons_pumpkin_fruit_side.png", "farming_addons_pumpkin_fruit_side.png", "farming_addons_pumpkin_fruit_side.png", "farming_addons_pumpkin_fruit_side_off.png"},
	paramtype2 = "facedir",
	sounds = default.node_sound_wood_defaults(),
	is_ground_content = false,
	groups = {snappy=3, flammable=4, fall_damage_add_percent=-30},
	on_construct = pumpkin_on_construct
})

-- PUMPKIN LANTERN -- from recipe
minetest.register_node("farming_addons:pumpkin_lantern", {
	description = "Pumpkin Lantern",
	tiles = {"farming_addons_pumpkin_fruit_top.png", "farming_addons_pumpkin_fruit_top.png", "farming_addons_pumpkin_fruit_side.png", "farming_addons_pumpkin_fruit_side.png", "farming_addons_pumpkin_fruit_side.png", "farming_addons_pumpkin_fruit_side_on.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	sounds = default.node_sound_wood_defaults(),
	is_ground_content = false,
	light_source = 12,
	drop = "farming_addons:pumpkin_lantern",
	groups = {snappy=3, flammable=4, fall_damage_add_percent=-30},
	on_construct = pumpkin_on_construct
})

-- pumpkin lantern recipe
minetest.register_craft({
	output = "farming_addons:pumpkin_lantern",
	recipe = {
		{"", "", ""},
		{"", "farming_addons:pumpkin_block", ""},
		{"", "default:torch", ""}
	},
})

-- crafted item from recipe
minetest.register_craftitem("farming_addons:pumpkin_pie", {
	description = "Pumpkin Pie",
	inventory_image = "farming_addons_pumpkin_pie.png",
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2},
	on_use = minetest.item_eat(6),
	sounds = default.node_sound_leaves_defaults()
})

-- pumpkin pie crafting recipe
minetest.register_craft({
	output = "farming_addons:pumpkin_pie",
	recipe = {
		{"", "", ""},
		{"farming_addons:pumpkin_block", "farming:flour", ""},
		{"", "mobs:egg", ""}
	}
})

-- needed for hbhunger
minetest.override_item("farming_addons:pumpkin_pie", {
	on_use = minetest.item_eat(6),
})

-- drop blocks instead of items
minetest.register_alias_force("farming_addons:pumpkin", "farming_addons:pumpkin_block")

-- drops pumpkin seeds
for i = 1, 5 do
	minetest.override_item("default:dry_grass_"..i, {drop = {
		max_items = 1,
		items = {
			{items = {"farming_addons:seed_pumpkin"}, rarity = 6},
			{items = {"default:dry_grass_1"}},
		}
	}})
end

-- pumpkin as fuel (better than cactus)
minetest.register_craft({
	type = "fuel",
	recipe = "farming_addons:pumpkin_block",
	burntime = 20,
})

minetest.register_craft({
	type = "fuel",
	recipe = "farming_addons:pumpkin_lantern",
	burntime = 20,
})

local function grow_pumpkin(pos, elapsed)
	local node = minetest.get_node(pos)
	local random_pos = false
	local spawn_positions = {}
	local right_pos = {x=pos.x+1, y=pos.y, z=pos.z}
	local front_pos = {x=pos.x, y=pos.y, z=pos.z+1}
	local left_pos = {x=pos.x-1, y=pos.y, z=pos.z}
	local back_pos = {x=pos.x, y=pos.y, z=pos.z-1}
	local right = minetest.get_node(right_pos)
	local front = minetest.get_node(front_pos)
	local left = minetest.get_node(left_pos)
	local back = minetest.get_node(back_pos)

	if right.name == "farming_addons:pumpkin_fruit"
	or front.name == "farming_addons:pumpkin_fruit"
	or left.name == "farming_addons:pumpkin_fruit"
	or back.name == "farming_addons:pumpkin_fruit" then
		return
	end

	-- make sure that at least one side of the plant has space to put pumpkin
	if right.name == "air" then
		table.insert(spawn_positions, right_pos)
	end
	if front.name == "air" then
		table.insert(spawn_positions, front_pos)
	end
	if left.name == "air" then
		table.insert(spawn_positions, left_pos)
	end
	if back.name == "air" then
		table.insert(spawn_positions, back_pos)
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
		-- spawn pumpkin
		minetest.set_node(random_pos, {name="farming_addons:pumpkin_fruit"})
	end

end

minetest.register_abm({
	label = "pumpkin_growing_abm",
	nodenames = {"farming_addons:pumpkin_8"},
	neighbors = {"air"},
	interval = 900,
	chance = 2,
	catch_up = true,
	action = grow_pumpkin
})
