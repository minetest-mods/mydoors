local cdoor_list = {   --Number , Description , Inven Image , Image
	{"Castle Door 1" , "door1"},
	{"Castle Door 2" , "door2"},
	{"Castle Door 3" , "door3"},
	{"Castle Door 4" , "door4"},
	{"Castle Door 5" , "door5"},
	{"Castle Door 6" , "door6"},
	{"Castle Door 7" , "door7"},
	{"Castle Door 8" , "door8"},
	{"Castle Door 9" , "door9"},
	{"Castle Door 10" , "door10"},
	{"Castle Door 11" , "door11"},
	{"Castle Door 12" , "door12"},
	{"Castle Door 13" , "door13"},
}

local function add_door(desc, img)
	doors.register_door("my_castle_doors:"..img, {
		description = desc,
		inventory_image = "mydoors_"..img.."_inv.png",
		groups = {choppy=2,cracky=2,door=1},
		tiles = {{name="mydoors_"..img..".png", backface_culling = true}},
		protected = false,
	})
end

for _,cdoor in ipairs(cdoor_list) do
	add_door(unpack(cdoor))
end


-- Crafts

minetest.register_craft({
	output = "my_castle_doors:door1 1",
	recipe = {
		{"default:steel_ingot", "default:glass", ""},
		{"my_door_wood:wood_dark_grey", "my_door_wood:wood_dark_grey", ""},
		{"my_door_wood:wood_dark_grey", "default:steel_ingot", ""}
	}
})

minetest.register_craft({
	output = "my_castle_doors:door2 1",
	recipe = {
		{"default:steel_ingot", "default:glass", ""},
		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""},
		{"my_door_wood:wood_red", "default:steel_ingot", ""}
	}
})
minetest.register_craft({
	output = "my_castle_doors:door3 1",
	recipe = {
		{"my_door_wood:wood_yellow", "default:steel_ingot", ""},
		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", ""},
		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", ""}
	}
})
minetest.register_craft({
	output = "my_castle_doors:door4 1",
	recipe = {
		{"my_door_wood:wood_brown", "my_door_wood:wood_brown", ""},
		{"my_door_wood:wood_brown", "default:steel_ingot", ""},
		{"my_door_wood:wood_brown", "my_door_wood:wood_brown", ""}
	}
})
minetest.register_craft({
	output = "my_castle_doors:door5 1",
	recipe = {
		{"my_door_wood:wood_yellow", "default:steel_ingot", ""},
		{"my_door_wood:wood_white", "my_door_wood:wood_yellow", ""},
		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", ""}
	}
})
minetest.register_craft({
	output = "my_castle_doors:door6 1",
	recipe = {
		{"my_door_wood:wood_grey", "my_door_wood:wood_grey", ""},
		{"my_door_wood:wood_grey", "default:steel_ingot", ""},
		{"my_door_wood:wood_grey", "my_door_wood:wood_grey", ""}
	}
})
minetest.register_craft({
	output = "my_castle_doors:door7 1",
	recipe = {
		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""},
		{"my_door_wood:wood_red", "default:steel_ingot", ""},
		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""}
	}
})
minetest.register_craft({
	output = "my_castle_doors:door8 1",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", ""},
		{"my_door_wood:wood_dark_grey", "my_door_wood:wood_dark_grey", ""},
		{"default:steel_ingot", "default:steel_ingot", ""}
	}
})
minetest.register_craft({
	output = "my_castle_doors:door9 1",
	recipe = {
		{"default:steel_ingot", "my_door_wood:wood_yellow", ""},
		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", ""},
		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", ""}
	}
})
minetest.register_craft({
	output = "my_castle_doors:door10 1",
	recipe = {
		{"my_door_wood:wood_red", "default:steel_ingot", ""},
		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""},
		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""}
	}
})
minetest.register_craft({
	output = "my_castle_doors:door11 1",
	recipe = {
		{"my_door_wood:wood_brown", "default:steel_ingot", ""},
		{"my_door_wood:wood_brown", "my_door_wood:wood_brown", ""},
		{"my_door_wood:wood_brown", "my_door_wood:wood_brown", ""}
	}
})
minetest.register_craft({
	output = "my_castle_doors:door12 1",
	recipe = {
		{"my_door_wood:wood_brown", "default:steel_ingot", ""},
		{"my_door_wood:wood_grey", "my_door_wood:wood_brown", ""},
		{"my_door_wood:wood_brown", "my_door_wood:wood_brown", ""}
	}
})
minetest.register_craft({
	output = "my_castle_doors:door13 1",
	recipe = {
		{"my_door_wood:wood_brown", "my_door_wood:wood_brown", "default:steel_ingot"},
		{"my_door_wood:wood_brown", "my_door_wood:wood_brown", ""},
		{"my_door_wood:wood_brown", "my_door_wood:wood_brown", "default:steel_ingot"}
	}
})
