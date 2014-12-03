local door_list = {   --Number , Description , Inven Image , Image , Is Locked
	{ "1" , "Locked Circle" , "door1", "door1" , "true"},
--	{ "2" , "Wood Circle" , "door2" , "door2" , "false"},	
--	{ "3" , "Wood Glass" , "door3" , "door3" , "false"},
	{ "4" , "Wood Glass 2" , "door4" , "door4" , "false"},
	{ "5", "White" , "door5" , "door5" , "false"},
--	{ "6", "Medevil 1" , "door6" , "door6" , "true"},
--	{ "7", "Medevil 2" , "door7" , "door7" , "true"},
--	{ "8", "Medevil 3" , "door8" , "door8" , "true"},
}

for i in ipairs(door_list) do
	local num = door_list[i][1]
	local desc = door_list[i][2]
	local inv = door_list[i][3]
	local img = door_list[i][4]
	local lock = door_list[i][5]



doors.register_door("mydoors:door"..num.."_unlocked", {
	description = desc.." Door Unlocked",
	inventory_image = inv.."_inv.png",
	groups = {choppy=2,cracky=2,door=1},
	tiles_bottom = {img.."_bottom.png", img.."_edge.png"},
	tiles_top = {img.."_top.png", img.."_edge.png"},
	only_placer_can_open = false,
})
end

-- Crafts

minetest.register_craft({
	output = "mydoors:door1_unlocked 1",
	recipe = {
		{"default:steel_ingot", "default:glass", ""},
		{"mydoors:wood_dark_grey", "mydoors:wood_dark_grey", ""},
		{"mydoors:wood_dark_grey", "default:steel_ingot", ""}
	}
})

minetest.register_craft({
	output = "mydoors:door2_unlocked 1",
	recipe = {
		{"default:steel_ingot", "default:glass", ""},
		{"mydoors:wood_red", "mydoors:wood_red", ""},
		{"mydoors:wood_red", "default:steel_ingot", ""}
	}
})
minetest.register_craft({
	output = "mydoors:door3_unlocked 1",
	recipe = {
		{"mydoors:wood_clear", "default:glass", ""},
		{"mydoors:wood_clear", "mydoors:wood_clear", ""},
		{"mydoors:wood_clear", "default:glass", ""}
	}
})
minetest.register_craft({
	output = "mydoors:door4_unlocked 1",
	recipe = {
		{"default:glass", "mydoors:wood_clear", ""},
		{"mydoors:wood_clear", "mydoors:wood_clear", ""},
		{"default:glass", "mydoors:wood_clear", ""}
	}
})
minetest.register_craft({
	output = "mydoors:door5_unlocked 1",
	recipe = {
		{"mydoors:wood_white", "default:glass", ""},
		{"mydoors:wood_white", "mydoors:wood_white", ""},
		{"mydoors:wood_white", "default:glass", ""}
	}
})
minetest.register_craft({
	output = "mydoors:door6_unlocked 1",
	recipe = {
		{"mydoors:wood_grey", "mydoors:wood_grey", ""},
		{"mydoors:wood_grey", "default:steel_ingot", ""},
		{"mydoors:wood_grey", "mydoors:wood_grey", ""}
	}
})
minetest.register_craft({
	output = "mydoors:door7_unlocked 1",
	recipe = {
		{"mydoors:wood_red", "mydoors:wood_red", ""},
		{"mydoors:wood_red", "default:steel_ingot", ""},
		{"mydoors:wood_red", "mydoors:wood_red", ""}
	}
})
minetest.register_craft({
	output = "mydoors:door8_unlocked 1",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", ""},
		{"mydoors:wood_dark_grey", "mydoors:wood_dark_grey", ""},
		{"default:steel_ingot", "default:steel_ingot", ""}
	}
})
