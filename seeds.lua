--
-- Seeds
--

-- obsidian wart
minetest.override_item("flowers:mushroom_red", {drop = {
  max_items = 1,
  items = {
    {items = {"x_farming:seed_obsidian_wart"}, rarity = 5},
    {items = {"flowers:mushroom_red"}},
  }
}})

-- beetroot
-- pumpkin
for i = 1, 5 do
  minetest.override_item("default:dry_grass_"..i, {drop = {
    max_items = 1,
    items = {
      {items = {"x_farming:seed_pumpkin"}, rarity = 6},
      {items = {"x_farming:seed_beetroot"}, rarity = 6},
      {items = {"default:dry_grass_1"}},
    }
  }})
end

-- carrot
-- wheat
for i = 1, 5 do
  minetest.override_item("default:grass_"..i, {drop = {
    max_items = 1,
    items = {
      {items = {"farming:seed_wheat"},rarity = 5},
      {items = {"x_farming:seed_carrot"}, rarity = 6},
      {items = {"default:grass_1"}},
    }
  }})
end

-- potato
-- cotton
minetest.override_item("default:junglegrass", {drop = {
  max_items = 1,
  items = {
    {items = {"farming:seed_cotton"},rarity = 8},
    {items = {"x_farming:seed_potato"}, rarity = 6},
    {items = {"default:junglegrass"}},
  }
}})

-- coffee
minetest.override_item("default:bush_stem", {drop = {
  max_items = 1,
  items = {
    {items = {"x_farming:seed_coffee"}, rarity = 6},
    {items = {"default:bush_stem"}},
  }
}})

-- corn
-- melon
minetest.override_item("default:dry_shrub", {drop = {
  max_items = 1,
  items = {
    {items = {"x_farming:seed_corn"},rarity = 6},
    {items = {"x_farming:seed_melon"}, rarity = 6},
    {items = {"default:dry_shrub"}},
  }
}})

-- cocoa bean
minetest.override_item("default:bush_leaves", {drop = {
  max_items = 1,
  items = {
    {items = {"x_farming:cocoa_bean"}, rarity = 6},
    {items = {"default:bush_sapling"}, rarity = 5},
    {items = {"default:bush_leaves"}}
  }
}})
