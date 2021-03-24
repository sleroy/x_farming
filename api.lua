-- main class
x_farming = {
	hbhunger = minetest.get_modpath("hbhunger"),
	colors = {
		brown = "#DEB887",
		red = "#FF8080",
		green = "#98E698"
	}
}
MINLIGHT = 13
MAXLIGHT = default.LIGHT_MAX

-- how often node timers for plants will tick, +/- some random value
function x_farming.tick(pos)
	minetest.get_node_timer(pos):start(math.random(498, 1287))
end

-- how often a growth failure tick is retried (e.g. too dark)
function x_farming.tick_short(pos)
	minetest.get_node_timer(pos):start(math.random(332, 858))
end

-- just shorthand for minetest metadata handling
function x_farming.meta_get_str(key, pos)
	local meta = minetest.get_meta(pos)
	return meta:get_string(key)
end

-- just shorthand for minetest metadata handling
function x_farming.meta_set_str(key, value, pos)
	local meta = minetest.get_meta(pos)
	meta:set_string(key, value)
end

-- grow blocks next to the plant
function x_farming.grow_block(pos, elapsed)
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
	local def = minetest.registered_nodes[node.name]

	local children = {}

	-- look for fruits around the stem
	if (right.name == def.next_plant) then
		children.right = right_pos
	end
	if (front.name == def.next_plant) then
		children.front = front_pos
	end
	if (left.name == def.next_plant) then
		children.left = left_pos
	end
	if (back.name == def.next_plant) then
		children.back = back_pos
	end

	-- check if the fruit belongs to this stem
	for side,child_pos in pairs(children) do
		-- print(side, minetest.pos_to_string(child_pos))

		local parent_pos_from_child = x_farming.meta_get_str("parent", child_pos)

		-- disable timer for fully grown plant - fruit for this stem already exists
		if minetest.pos_to_string(pos) == parent_pos_from_child then
			return
		end
	end

	-- make sure that at least one side of the plant has space to put fruit
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

	-- plant is closed from all sides
	if #spawn_positions < 1 then
		x_farming.tick_short(pos)
		return
	else
		-- pick random from the open sides
		local pick_random

		if #spawn_positions == 1 then
			pick_random = #spawn_positions
		else
			pick_random = math.random(1, #spawn_positions)
		end

		for k, v in pairs (spawn_positions) do
			if k == pick_random then
				random_pos = v
			end
		end
	end

	-- check light
	local light = minetest.get_node_light(pos)
	if not light or light < MINLIGHT or light > MAXLIGHT then
		x_farming.tick_short(pos)
		return
	end

	-- spawn block
	if random_pos then
		minetest.set_node(random_pos, {name = def.next_plant})
		x_farming.meta_set_str("parent", minetest.pos_to_string(pos), random_pos)
	end
	return
end

function x_farming.grow_kiwi_tree(pos)
	local path = minetest.get_modpath("x_farming") ..
		"/schematics/kiwi_tree_from_sapling.mts"
	minetest.place_schematic({x = pos.x - 2, y = pos.y, z = pos.z - 2},
		path, "random", nil, false)
end

-- Grow sapling

function x_farming.grow_sapling(pos)
	if not default.can_grow(pos) then
		-- try again 5 min later
		minetest.get_node_timer(pos):start(300)
		return
	end

	local node = minetest.get_node(pos)
	if node.name == "x_farming:kiwi_sapling" then
		minetest.log("action", "A sapling grows into a tree at "..
		minetest.pos_to_string(pos))
		x_farming.grow_kiwi_tree(pos)
	end
end