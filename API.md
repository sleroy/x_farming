# [Mod] X Farming [x_farming] API

## Types

`BonemealTreeDef`

```typescript
{
    // sapling name
    name: string
    // 1 out of `chance`, e.g. 2 = 50% chance
    chance: number
    // grow tree from sapling
    grow_tree: function(pos: Vector): void
}
```

## Class `x_farming.x_bonemeal`

### Other mods can register new tree growth from sapling using bonemeal.

Method

`register_tree_defs(self: x_bonemeal, defs: BonemealTreeDef[]): void`

example

```lua
 x_farming.x_bonemeal:register_tree_defs({
    {
        name = 'everness:coral_tree_sapling',
        chance = 3,
        grow_tree = function(pos)
            minetest.place_schematic(
                { x = pos.x - 19, y = pos.y, z = pos.z - 19 },
                minetest.get_modpath('mymod') .. '/schematics/mymod_mytree_from_sapling.mts',
                'random',
                nil,
                false
            )
        end
    }
})
```

