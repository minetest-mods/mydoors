local cdoor_list = {   --Number , Description , Inven Image , Image
--	{ "1" , "Castle Door 1" , "door1", "door1"},
--	{ "2" , "Castle Door 2" , "door2" , "door2"},
	{ "3", "Castle Door 3" , "door3" , "door3"},
	{ "4", "Castle Door 4" , "door4" , "door4"},
	{ "5", "Castle Door 5" , "door5" , "door5"},
--	{ "6", "Castle Door 6" , "door6" , "door6"},
--	{ "7", "Castle Door 7" , "door7" , "door7"},
--	{ "8", "Castle Door 8" , "door8" , "door8"},
	{ "9", "Castle Door 9" , "door9" , "door9"},
	{ "10", "Castle Door 10" , "door10" , "door10"},
	{ "11", "Castle Door 11" , "door11" , "door11"},
	{ "12", "Castle Door 12" , "door12" , "door12"},
	{ "13", "Castle Door 13" , "door13" , "door13"},
}

local cdoor_groups = {choppy=2,cracky=2,door=1}


for i = 1,#cdoor_list do
	local num,desc,inv,img = unpack(cdoor_list[i])

	doors.register_door("my_castle_doors:door"..num, {
		description = desc,
		inventory_image = "mydoors_"..inv.."_inv.png",
		groups = cdoor_groups,
		tiles_bottom = {"mydoors_"..img.."_bottom.png", "mydoors_"..img.."_edge.png"},
		tiles_top = {"mydoors_"..img.."_top.png", "mydoors_"..img.."_edge.png"},
		only_placer_can_open = false,
	})
end

-- Crafts

minetest.register_craft({
	output = "my_castle_doors:door1",
	recipe = {
		{"default:steel_ingot", "default:glass", ""},
		{"my_door_wood:wood_dark_grey", "my_door_wood:wood_dark_grey", ""},
		{"my_door_wood:wood_dark_grey", "default:steel_ingot", ""}
	}
})

minetest.register_craft({
	output = "my_castle_doors:door2",
	recipe = {
		{"default:steel_ingot", "default:glass", ""},
		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""},
		{"my_door_wood:wood_red", "default:steel_ingot", ""}
	}
})
minetest.register_craft({
	output = "my_castle_doors:door3",
	recipe = {
		{"my_door_wood:wood_yellow", "default:steel_ingot", ""},
		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", ""},
		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", ""}
	}
})
minetest.register_craft({
	output = "my_castle_doors:door4",
	recipe = {
		{"my_door_wood:wood_brown", "default:steel_ingot", ""},
		{"my_door_wood:wood_brown", "my_door_wood:wood_brown", ""},
		{"my_door_wood:wood_brown", "my_door_wood:wood_brown", ""}
	}
})
minetest.register_craft({
	output = "my_castle_doors:door5",
	recipe = {
		{"my_door_wood:wood_yellow", "default:steel_ingot", ""},
		{"my_door_wood:wood_white", "my_door_wood:wood_yellow", ""},
		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", ""}
	}
})
minetest.register_craft({
	output = "my_castle_doors:door6",
	recipe = {
		{"my_door_wood:wood_grey", "my_door_wood:wood_grey", ""},
		{"my_door_wood:wood_grey", "default:steel_ingot", ""},
		{"my_door_wood:wood_grey", "my_door_wood:wood_grey", ""}
	}
})
minetest.register_craft({
	output = "my_castle_doors:door7",
	recipe = {
		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""},
		{"my_door_wood:wood_red", "default:steel_ingot", ""},
		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""}
	}
})
minetest.register_craft({
	output = "my_castle_doors:door8",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", ""},
		{"my_door_wood:wood_dark_grey", "my_door_wood:wood_dark_grey", ""},
		{"default:steel_ingot", "default:steel_ingot", ""}
	}
})
minetest.register_craft({
	output = "my_castle_doors:door9",
	recipe = {
		{"default:steel_ingot", "my_door_wood:wood_yellow", ""},
		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", ""},
		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", ""}
	}
})
minetest.register_craft({
	output = "my_castle_doors:door10",
	recipe = {
		{"my_door_wood:wood_red", "default:steel_ingot", ""},
		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""},
		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""}
	}
})
minetest.register_craft({
	output = "my_castle_doors:door11",
	recipe = {
		{"my_door_wood:wood_brown", "default:steel_ingot", ""},
		{"my_door_wood:wood_brown", "my_door_wood:wood_brown", ""},
		{"my_door_wood:wood_brown", "my_door_wood:wood_brown", ""}
	}
})
minetest.register_craft({
	output = "my_castle_doors:door12",
	recipe = {
		{"my_door_wood:wood_brown", "default:steel_ingot", ""},
		{"my_door_wood:wood_grey", "my_door_wood:wood_brown", ""},
		{"my_door_wood:wood_brown", "my_door_wood:wood_brown", ""}
	}
})
minetest.register_craft({
	output = "my_castle_doors:door13",
	recipe = {
		{"my_door_wood:wood_brown", "my_door_wood:wood_brown", "default:steel_ingot"},
		{"my_door_wood:wood_brown", "my_door_wood:wood_brown", ""},
		{"my_door_wood:wood_brown", "my_door_wood:wood_brown", "default:steel_ingot"}
	}
})
