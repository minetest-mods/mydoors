local fdoor_list = {   --Number , Description , Inven Image , Image
	{ "1" , "Fancy Door 1" , "door1" , "door1"},
--	{ "2" , "Fancy Door 2" , "door2" , "door2"},	
--	{ "3" , "Fancy Door 3" , "door3" , "door3"},
}


for i in ipairs(fdoor_list) do
	local num = fdoor_list[i][1]
	local desc = fdoor_list[i][2]
	local inv = fdoor_list[i][3]
	local img = fdoor_list[i][4]


doors.register_door("my_fancy_doors:door"..num.."_locked", {
	description = desc.." Locked",
	inventory_image = "myfdoors_"..inv.."_inv.png",
	groups = {choppy=2,cracky=2,door=1},
	tiles_bottom = {"myfdoors_"..img.."_bottom.png", "myfdoors_"..img.."_edge.png"},
	tiles_top = {"myfdoors_"..img.."_top.png", "myfdoors_"..img.."_edge.png"},
	only_placer_can_open = true,
})
end

-- Crafts

minetest.register_craft({
	output = "my_fancy_doors:door1_locked 1",
	recipe = {
		{"my_door_wood:wood_yellow", "default:glass", ""},
		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", "default:steel_ingot"},
		{"my_door_wood:wood_yellow", "default:glass", ""}
	}
})

minetest.register_craft({
	output = "my_fancy_doors:door2_locked 1",
	recipe = {
		{"my_door_wood:wood_yellow", "default:glass", ""},
		{"my_door_wood:wood_yellow", "default:steel_ingot", "default:steel_ingot"},
		{"my_door_wood:wood_yellow", "default:glass", ""}
	}
})
minetest.register_craft({
	output = "my_fancy_doors:door3_locked 1",
	recipe = {
		{"my_door_wood:wood_white", "default:glass", ""},
		{"my_door_wood:wood_white", "my_door_wood:wood_white", "default:steel_ingot"},
		{"my_door_wood:wood_white", "default:glass", ""}
	}
})

