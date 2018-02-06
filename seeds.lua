--
-- Seeds
--

-- obsidian wart
minetest.override_item("flowers:mushroom_red", {drop = {
  max_items = 1,
  items = {
    {items = {"farming_addons:seed_obsidian_wart"}, rarity = 5},
    {items = {"flowers:mushroom_red"}},
  }
}})

-- beetroot
-- carrot
-- coffee
-- corn
-- melon
-- potato
-- pumpkin
for i = 1, 5 do
  minetest.override_item("default:dry_grass_"..i, {drop = {
    max_items = 1,
    items = {
      {items = {"farming_addons:seed_pumpkin"}, rarity = 6},
      {items = {"farming_addons:seed_beetroot"}, rarity = 6},
      {items = {"default:dry_grass_1"}},
    }
  }})
end

for i = 1, 5 do
  minetest.override_item("default:grass_"..i, {drop = {
    max_items = 1,
    items = {
      {items = {'farming:seed_wheat'},rarity = 5},
      {items = {'default:grass_1'}},
    }
  }})
end

minetest.override_item("default:junglegrass", {drop = {
  max_items = 1,
  items = {
    {items = {'farming:seed_cotton'},rarity = 8},
    {items = {'default:junglegrass'}},
  }
}})
