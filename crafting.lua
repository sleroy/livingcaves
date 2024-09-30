local S = minetest.get_translator("livingcaves")

-- bucket

minetest.register_craft({
	output = "livingcaves:bucket_empty 1",
	recipe = {
		{ "livingcaves:stalagmitelarge", "",               "livingcaves:stalagmitelarge" },
		{ "",                            "mcl_core:stick", "" },
	}
})

-- root wood
minetest.register_node("livingcaves:root_wood", {
	description = S("Root Woven"),
	tiles = { "livingcaves_rootdirt_woven.png" },
	paramtype = "light",
	drawtype = "allfaces_optional",
	is_ground_content = false,
	groups = { wood = 1, snappy = 3, flammable = 2 },
	sounds = mcl_sounds.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "livingcaves:root_wood 4",
	recipe = { { "livingcaves:rootdirt" } }
})

minetest.register_craft({
	output = "livingcaves:root_wood 4",
	recipe = { { "livingcaves:rootdirt2" } }
})

mcl_stairs.register_stair_and_slab(
	"livingcaves_rootdirt_woven",
	"livingcaves:root_wood",
	{ choppy = 2, oddly_breakable_by_hand = 1, flammable = 3 },
	{ "livingcaves_rootdirt_woven.png" },
	S("Root Stair"),
	S("Root Slab"),
	mcl_sounds.node_sound_wood_defaults()
)

mcl_stairs.register_stair_and_slab(
	"livingcaves_root_dirt",
	"livingcaves:rootdirt",
	{ choppy = 2, oddly_breakable_by_hand = 1, flammable = 3 },
	{ "livingcaves_rootdirt.png", "livingcaves_rootdirt.png", "livingcaves_rootdirt.png" },
	S("Root Dirt Stair"),
	S("Root Dirt Slab"),
	mcl_sounds.node_sound_wood_defaults()
)

mcl_fences.register_fence_and_fence_gate_def(
	"livingcaves:gate_root_wood",
	{
		description = S("Root Fence Gate"),
		texture = "livingcaves_rootdirt_fencewood.png",
		material = "livingcaves:root_wood",
		groups = { choppy = 3, oddly_breakable_by_hand = 2, flammable = 3 },
		sounds = mcl_sounds.node_sound_wood_defaults()
	}
)


mcl_fences.register_fence_def(
	"livingcaves:fence_root_wood",
	{
		description = S("Root Fence"),
		texture = "livingcaves_rootdirt_fencewood.png",
		inventory_image =
		"default_fence_overlay.png^livingcaves_rootdirt_fencewood.png^default_fence_overlay.png^[makealpha:255,126,126",
		wield_image =
		"default_fence_overlay.png^livingcaves_rootdirt_fencewood.png^default_fence_overlay.png^[makealpha:255,126,126",
		material = "livingcaves:root_wood",
		groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
		sounds = mcl_sounds.node_sound_wood_defaults()
	}
)

-- default.register_fence_rail(
--   "livingcaves:fence_rail_root_wood",
--   {
--     description = S("Root Fence Rail"),
--     texture = "livingcaves_rootdirt_fencewood.png",
--     inventory_image = "default_fence_rail_overlay.png^livingcaves_rootdirt_fencewood.png^" ..
--       "default_fence_rail_overlay.png^[makealpha:255,126,126",
--     wield_image = "default_fence_rail_overlay.png^livingcaves_rootdirt_fencewood.png^" ..
--       "default_fence_rail_overlay.png^[makealpha:255,126,126",
--     material = "livingcaves:root_wood",
--     groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
--     sounds = mcl_sounds.node_sound_wood_defaults()
--   }
-- )

mcl_doors:register_door("door_livingcaves_root", {
	tiles_bottom = { "livingcaves_door_rootdirt.png", "livingcaves_door_rootdirt.png" },
	tiles_top = { "livingcaves_door_rootdirt.png", "livingcaves_door_rootdirt.png" },
	description = S "Root Door",
	inventory_image = "livingcaves_door_rootdirt_inv.png",
	_mcl_hardness = 5,
	_mcl_blast_resistance = 5,
	sounds = mcl_sounds.node_sound_metal_defaults(),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",


	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "livingcaves:root_wood", "livingcaves:root_wood", "livingcaves:root_wood" },
		{ "mcl_core:stick",        "mcl_core:stick",        "mcl_core:stick" },
		{ "livingcaves:root_wood", "livingcaves:root_wood", "livingcaves:root_wood" },
	}
})


mcl_doors:register_trapdoor("livingcaves:root_trapdoor", {
	description = S("Root Trapdoor"),
	inventory_image = "livingcaves_roottrapdoor.png",
	wield_image = "livingcaves_roottrapdoor.png",
	tile_front = "livingcaves_roottrapdoor.png",
	tile_side = "livingcaves_root_trapdoor_side.png",
	gain_open = 0.06,
	gain_close = 0.13,
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, door = 1 },
})

minetest.register_craft({
	output = "livingcaves:root_trapdoor",
	recipe = {
		{ "livingcaves:root_wood", "livingcaves:root_wood", "livingcaves:root_wood" },
		{ "livingcaves:root_wood", "livingcaves:root_wood", "livingcaves:root_wood" },
		{ "",                      "",                      "" },
	}
})

minetest.register_node("livingcaves:root_lamp", {
	description = S("Root Mushroom Lamp"),
	light_source = 9,
	drawtype = "torchlike",
	inventory_image = "livingcaves_rootlamp.png",
	wield_image = "livingcaves_rootlamp.png",
	paramtype2 = "wallmounted",
	walkable = false,
	groups = { dig_immediate = 3, attached_node = 1 },
	tiles = {
		{
			name = "livingcaves_rootlamp2.png",
		},
		{
			name = "livingcaves_rootlamp3.png",
		},
		{
			name = "livingcaves_rootlamp.png",
		}
	},
	selection_box = {
		type = "wallmounted",
		wall_top = { -0.25, -0.3, -0.25, 0.25, 0.5, 0.25 },
		wall_bottom = { -0.25, -0.5, -0.25, 0.25, 0.1, 0.25 },
		wall_side = { -0.5, -0.35, -0.15, -0.15, 0.4, 0.15 }
	}
})

minetest.register_craft({
	output = "livingcaves:root_lamp",
	recipe = {
		{ "livingcaves:rootcave_hangingroot", "livingcaves:glowshroom_top", "livingcaves:glowshroom" },
		{ "",                                 "",                           "" },
	}
})

minetest.register_craft({
	output = "livingcaves:root_lamp",
	recipe = {
		{ "livingcaves:rootcave_hangingroot2", "livingcaves:glowshroom_top", "livingcaves:glowshroom" },
		{ "",                                  "",                           "" },
	}
})

--- ice

mcl_walls.register_wall(":livingcaves:icebrick_wall", S "Ice Brick Wall", {"livingcaves_icecbricks.png"},"livingcaves_icecbricks.png",
	"livingcaves:icebrick_wall", mcl_sounds.node_sound_stone_defaults())

mcl_stairs.register_stair_and_slab(
	"livingcaves_icecbricks",
	"livingcaves:icebrick",
	{ cracky = 1, oddly_breakable_by_hand = 0, flammable = 0 },
	{ "livingcaves_icecbricks.png" },
	S("Ice Brick Stair"),
	S("Ice Brick Slab"),
	mcl_sounds.node_sound_ice_defaults()
)

minetest.register_node("livingcaves:icebrick", {
	description = S("Ice Brick"),
	tiles = { "livingcaves_icecbricks.png" },
	is_ground_content = false,
	groups = { cracky = 3, stone = 2 },
	sounds = mcl_sounds.node_sound_ice_defaults(),
})

minetest.register_craft({
	output = "livingcaves:icebrick",
	type = "shapeless",
	recipe =
	{ "livingcaves:icecave_ice", "livingcaves:icecave_ice" }


})

minetest.register_craft({
	output = "livingcaves:icebrick",
	type = "shapeless",
	recipe =
	{ "livingcaves:icecave_ice2", "livingcaves:icecave_ice2" }


})

minetest.register_craft({
	output = "livingcaves:icebrick_wall",
	type = "shapeless",
	recipe =
	{ "livingcaves:icebrick" }


})

mcl_fences.register_fence_def(
	"livingcaves:fence_ice",
	{
		description = S("Ice Fence"),
		texture = "livingcaves_ice_fencewood.png",
		inventory_image =
		"default_fence_overlay.png^livingcaves_ice_fencewood.png^default_fence_overlay.png^[makealpha:255,126,126",
		wield_image =
		"default_fence_overlay.png^livingcaves_ice_fencewood.png^default_fence_overlay.png^[makealpha:255,126,126",
		material = "livingcaves:icebrick",
		groups = { cracky = 3, stone = 2 },
		sounds = mcl_sounds.node_sound_ice_defaults(),
	}
)

-- default.register_fence_rail(
--   "livingcaves:fence_rail_ice",
--   {
--     description = S("Ice Fence Rail"),
--     texture = "livingcaves_ice_fencewood.png",
--     inventory_image = "default_fence_rail_overlay.png^livingcaves_ice_fencewood.png^" ..
--       "default_fence_rail_overlay.png^[makealpha:255,126,126",
--     wield_image = "default_fence_rail_overlay.png^livingcaves_ice_fencewood.png^" ..
--       "default_fence_rail_overlay.png^[makealpha:255,126,126",
--     material = "livingcaves:icebrick",
-- 	groups = {cracky = 3, stone = 2},
-- 	sounds = mcl_sounds.node_sound_ice_defaults(),
--   }
-- )

mcl_doors:register_door("door_livingcaves_ice", {
	tiles_bottom = { "livingcaves_door_ice.png", "livingcaves_door_ice.png" },
	tiles_top = { "livingcaves_door_ice.png", "livingcaves_door_ice.png" },
	description = S "Ice Door",
	inventory_image = "livingcaves_door_ice_inv.png",
	groups = { cracky = 3, stone = 2 },
	sounds = mcl_sounds.node_sound_metal_defaults(),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	recipe = {
		{ "livingcaves:icebrick",           "livingcaves:icebrick",           "livingcaves:icebrick" },
		{ "livingcaves:icestalagmite",      "livingcaves:icestalagmite",      "livingcaves:icestalagmite" },
		{ "livingcaves:icestalagmitelarge", "livingcaves:icestalagmitelarge", "livingcaves:icestalagmitelarge" },
	}
})

mcl_doors:register_trapdoor("livingcaves:ice_trapdoor", {
	description = S("Ice Trapdoor"),
	inventory_image = "livingcaves_icetrapdoor.png",
	wield_image = "livingcaves_icetrapdoor.png",
	tile_front = "livingcaves_icetrapdoor.png",
	tile_side = "livingcaves_icetrapdoor_side.png",
	gain_open = 0.06,
	gain_close = 0.13,
	sounds = mcl_sounds.node_sound_metal_defaults(),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	groups = { cracky = 3, stone = 2, door = 1 },
})

minetest.register_craft({
	output = "livingcaves:ice_trapdoor",
	recipe = {
		{ "livingcaves:icestalagmite", "livingcaves:icestalagmite", "livingcaves:icestalagmite" },
		{ "livingcaves:icestalagmite", "livingcaves:icestalagmite", "livingcaves:icestalagmite" },
		{ "",                          "",                          "" },
	}
})

--- dripstone

mcl_walls.register_wall(":livingcaves:dripstonebrick_wall", S "Dripstone Brick Wall",
	{"livingcaves_dripstonecave_bricks.png"},"livingcaves_dripstonecave_bricks.png",
	"livingcaves:dripstonebrick_wall", mcl_sounds.node_sound_stone_defaults())

mcl_stairs.register_stair_and_slab(
	"livingcaves_dripstonecave_bricks",
	"livingcaves:dripstonebrick",
	{ cracky = 1, oddly_breakable_by_hand = 0, flammable = 0 },
	{ "livingcaves_dripstonecave_bricks.png" },
	S("Dripstone Brick Stair"),
	S("Dripstone Brick Slab"),
	mcl_sounds.node_sound_stone_defaults()
)

minetest.register_node("livingcaves:dripstonebrick", {
	description = S("Dripstone Bricks"),
	tiles = { "livingcaves_dripstonecave_bricks.png" },
	is_ground_content = false,
	groups = { cracky = 3, stone = 2 },
	sounds = mcl_sounds.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "livingcaves:dripstonebrick",
	type = "shapeless",
	recipe =
	{ "livingcaves:dripstonecave_bottom", "livingcaves:dripstonecave_bottom" }


})

minetest.register_craft({
	output = "livingcaves:dripstonebrick",
	type = "shapeless",
	recipe =
	{ "livingcaves:dripstonecave_bottom2", "livingcaves:dripstonecave_bottom2" }


})

minetest.register_craft({
	output = "livingcaves:dripstonebrick_wall",
	type = "shapeless",
	recipe =
	{ "livingcaves:dripstonebrick" }


})

mcl_doors:register_door("door_livingcaves_dripstone", {
	tiles_bottom = { "livingcaves_door_dripstone.png", "livingcaves_door_dripstone.png" },
	tiles_top = { "livingcaves_door_dripstone.png", "livingcaves_door_ice.png" },
	description = S "Dripstone Door",
	inventory_image = "livingcaves_door_dripstone_inv.png",
	groups = { cracky = 3, stone = 2 },
	sounds = mcl_sounds.node_sound_metal_defaults(),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	recipe = {
		{ "livingcaves:dripstonebrick",  "livingcaves:dripstonebrick",  "livingcaves:dripstonebrick" },
		{ "livingcaves:stalagmite",      "livingcaves:stalagmite",      "livingcaves:stalagmite" },
		{ "livingcaves:stalagmitelarge", "livingcaves:stalagmitelarge", "livingcaves:stalagmitelarge" },
	}
})

mcl_doors:register_trapdoor("livingcaves:dripstone_trapdoor", {
	description = S("Dripstone Trapdoor"),
	inventory_image = "livingcaves_dripstonetrapdoor.png",
	wield_image = "livingcaves_dripstonetrapdoor.png",
	tile_front = "livingcaves_dripstonetrapdoor.png",
	tile_side = "livingcaves_dripstonetrapdoor_side.png",
	gain_open = 0.06,
	gain_close = 0.13,
	sounds = mcl_sounds.node_sound_metal_defaults(),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	groups = { cracky = 3, stone = 2, door = 1 },
})

minetest.register_craft({
	output = "livingcaves:dripstone_trapdoor",
	recipe = {
		{ "livingcaves:stalagmite", "livingcaves:stalagmite", "livingcaves:stalagmite" },
		{ "livingcaves:stalagmite", "livingcaves:stalagmite", "livingcaves:stalagmite" },
		{ "",                       "",                       "" },
	}
})

--- mushroom

mcl_walls.register_wall(":livingcaves:mossybrick_wall", S "Mossy Brick Wall", {"livingcaves_mushcave_mossybricks.png"},"livingcaves_mushcave_mossybricks.png",
	"livingcaves:mossybrick_wall", mcl_sounds.node_sound_stone_defaults())

mcl_stairs.register_stair_and_slab(
	"livingcaves_mushcave_mossybricks",
	"livingcaves:mushcave_mossybricks",
	{ cracky = 1, oddly_breakable_by_hand = 0, flammable = 0 },
	{ "livingcaves_mushcave_mossybricks.png" },
	S("Mossy Stone Brick Stair"),
	S("Mossy Stone Brick Slab"),
	mcl_sounds.node_sound_stone_defaults()
)

minetest.register_node("livingcaves:mushcave_mossybricks", {
	description = S("Mushcave Mossy Bricks"),
	tiles = { "livingcaves_mushcave_mossybricks.png" },
	is_ground_content = false,
	groups = { cracky = 3, stone = 2 },
	sounds = mcl_sounds.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "livingcaves:mushcave_mossybricks",
	type = "shapeless",
	recipe =
	{ "livingcaves:mushcave_bottom", "livingcaves:mushcave_bottom" }


})

minetest.register_craft({
	output = "livingcaves:mossybrick_wall",
	type = "shapeless",
	recipe =
	{ "livingcaves:mushcave_mossybricks" }


})

--- coocking





minetest.register_node("livingcaves:healingsoup", {
	description = S("Healing Soup"),
	drawtype = "plantlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	wield_image = "livingcaves_healingsoup_inv.png",
	inventory_image = "livingcaves_healingsoup_inv.png",
	tiles = {
		{
			name = "livingcaves_healingsoup.png",
			animation = { type = "vertical_frames", length = 2 }
		}
	},
	selection_box = {
		type = "fixed",
		fixed = { -4 / 16, -0.5, -4 / 16, 4 / 16, 0.0, 4 / 16 },
	},
	groups = { drink = 1, food = 1, snappy = 3, flammable = 2 },
	on_use = minetest.item_eat(5),
	sounds = mcl_sounds.node_sound_metal_defaults(),
})


minetest.register_craft({
	output = "livingcaves:healingsoup",
	type = "shapeless",
	recipe =
	{ "livingcaves:lichen", "livingcaves:glowshroom_top", "livingcaves:mushroom_edible", "livingcaves:bucket_cavewater" }


})

--- spider web to string

minetest.register_craft({
	output = "mcl_farming:string",
	type = "shapeless",
	recipe =
	{ "livingcaves:spiderweb9", "livingcaves:spiderweb9" }

})

minetest.register_craft({
	output = "mcl_farming:string",
	type = "shapeless",
	recipe =
	{ "livingcaves:spiderweb8", "livingcaves:spiderweb8" }

})

minetest.register_craft({
	output = "mcl_farming:string",
	type = "shapeless",
	recipe =
	{ "livingcaves:spiderweb7", "livingcaves:spiderweb7" }

})

minetest.register_craft({
	output = "mcl_farming:string",
	type = "shapeless",
	recipe =
	{ "livingcaves:spiderweb6", "livingcaves:spiderweb6" }

})

minetest.register_craft({
	output = "mcl_farming:string",
	type = "shapeless",
	recipe =
	{ "livingcaves:spiderweb5", "livingcaves:spiderweb5" }

})

minetest.register_craft({
	output = "mcl_farming:string",
	type = "shapeless",
	recipe =
	{ "livingcaves:spiderweb4", "livingcaves:spiderweb4" }

})

minetest.register_craft({
	output = "mcl_farming:string",
	type = "shapeless",
	recipe =
	{ "livingcaves:spiderweb3", "livingcaves:spiderweb3" }

})

minetest.register_craft({
	output = "mcl_farming:string",
	type = "shapeless",
	recipe =
	{ "livingcaves:spiderweb2", "livingcaves:spiderweb2" }

})

minetest.register_craft({
	output = "mcl_farming:string",
	type = "shapeless",
	recipe =
	{ "livingcaves:spiderweb", "livingcaves:spiderweb" }


})
