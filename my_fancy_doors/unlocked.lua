local fdoor_list = {   --Number , Description , Inven Image , Image
--	{ "1" , "Fancy Door 1" , "door1" , "door1"},
	{ "2" , "Fancy Door 2" , "door2" , "door2"},	
	{ "3" , "Fancy Door 3" , "door3" , "door3"},	
--	{ "4" , "Fancy Door 4" , "door4" , "door4"},	
--	{ "5" , "Fancy Door 5" , "door5" , "door5"},	
--	{ "6" , "Fancy Door 6" , "door6" , "door6"},	
--	{ "7" , "Fancy Door 7" , "door7" , "door7"},	
--	{ "8" , "Fancy Door 8" , "door8" , "door8"},
}


for i in ipairs(fdoor_list) do
	local num = fdoor_list[i][1]
	local desc = fdoor_list[i][2]
	local inv = fdoor_list[i][3]
	local img = fdoor_list[i][4]


mdoors.register_door("my_fancy_doors:door"..num, {
	description = desc,
	inventory_image = "myfdoors_"..inv.."_inv.png",
	groups = {choppy=2,cracky=2,door=1},
	tiles_bottom = {"myfdoors_"..img.."_bottom.png", "myfdoors_"..img.."_edge.png"},
	tiles_top = {"myfdoors_"..img.."_top.png", "myfdoors_"..img.."_edge.png"},
	only_placer_can_open = false,
})
end

-- Crafts

minetest.register_craft({
	output = "my_fancy_doors:door1 1",
	recipe = {
		{"my_door_wood:wood_yellow", "default:glass", ""},
		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", ""},
		{"my_door_wood:wood_yellow", "default:glass", ""}
	}
})

minetest.register_craft({
	output = "my_fancy_doors:door2 1",
	recipe = {
		{"my_door_wood:wood_yellow", "default:glass", ""},
		{"my_door_wood:wood_yellow", "default:steel_ingot", ""},
		{"my_door_wood:wood_yellow", "default:glass", ""}
	}
})
minetest.register_craft({
	output = "my_fancy_doors:door3 1",
	recipe = {
		{"my_door_wood:wood_white", "default:glass", ""},
		{"my_door_wood:wood_white", "my_door_wood:wood_white", ""},
		{"my_door_wood:wood_white", "default:glass", ""}
	}
})
minetest.register_craft({
	output = "my_fancy_doors:door4 1",
	recipe = {
		{"my_door_wood:wood_red", "my_door_wood:wood_dark_grey", ""},
		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""},
		{"my_door_wood:wood_red", "my_door_wood:wood_dark_grey", ""}
	}
})

