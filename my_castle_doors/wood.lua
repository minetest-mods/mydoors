minetest.register_node("my_castle_doors:wood_red", {
	description = "Red Stained Wood",
	drawtype = "normal",
	paramtype = "light",
	tiles = {"mydoors_red_wood.png"},
	paramtype = "light",
	groups = {cracky = 2, choppy = 2},

})
minetest.register_node("my_castle_doors:wood_grey", {
	description = "Grey Stained Wood",
	drawtype = "normal",
	paramtype = "light",
	tiles = {"mydoors_grey_wood.png"},
	paramtype = "light",
	groups = {cracky = 2, choppy = 2},

})
minetest.register_node("my_castle_doors:wood_dark_grey", {
	description = "Dark Grey Stained Wood",
	drawtype = "normal",
	paramtype = "light",
	tiles = {"mydoors_dark_grey_wood.png"},
	paramtype = "light",
	groups = {cracky = 2, choppy = 2},

})
minetest.register_node("my_castle_doors:wood_brown", {
	description = "Brown Stained Wood",
	drawtype = "normal",
	paramtype = "light",
	tiles = {"mydoors_brown_wood.png"},
	paramtype = "light",
	groups = {cracky = 2, choppy = 2},

})
minetest.register_node("my_castle_doors:wood_white", {
	description = "White Stained Wood",
	drawtype = "normal",
	paramtype = "light",
	tiles = {"mydoors_white_wood.png"},
	paramtype = "light",
	groups = {cracky = 2, choppy = 2},

})
minetest.register_node("my_castle_doors:wood_clear", {
	description = "Clear Stained Wood",
	drawtype = "normal",
	paramtype = "light",
	tiles = {"mydoors_clear_wood.png"},
	paramtype = "light",
	groups = {cracky = 2, choppy = 2},

})

-- Crafts

minetest.register_craft({
	output = "my_castle_doors:wood_red 1",
	recipe = {
		{"default:wood", "", ""},
		{"dye:red", "", ""},
		{"", "", ""}
	}
})
minetest.register_craft({
	output = "my_castle_doors:wood_grey 1",
	recipe = {
		{"default:wood", "", ""},
		{"dye:grey", "", ""},
		{"", "", ""}
	}
})
minetest.register_craft({
	output = "my_castle_doors:wood_dark_grey 1",
	recipe = {
		{"default:wood", "", ""},
		{"dye:dark_grey", "", ""},
		{"", "", ""}
	}
})
minetest.register_craft({
	output = "my_castle_doors:wood_brown 1",
	recipe = {
		{"default:wood", "", ""},
		{"dye:brown", "", ""},
		{"", "", ""}
	}
})
minetest.register_craft({
	output = "my_castle_doors:wood_white 1",
	recipe = {
		{"default:wood", "", ""},
		{"dye:white", "", ""},
		{"", "", ""}
	}
})
minetest.register_craft({
	output = "my_castle_doors:wood_clear 1",
	recipe = {
		{"default:wood", "", ""},
		{"default:glass", "", ""},
		{"", "", ""}
	}
})
