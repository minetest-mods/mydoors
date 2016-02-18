local mdoor_list = {   --Number , Description , Inven Image , Image
--	{ "1" , "Misc Door 1" , "door1" , "door1"},
--	{ "2" , "Misc Door 2" , "door2" , "door2"},	
	{ "3" , "Misc Door 3" , "door3" , "door3"},
	{ "4" , "Misc Door 4" , "door4" , "door4"},
--	{ "5" , "Misc Door 5" , "door5" , "door5"},
	{ "6" , "Misc Door 6" , "door6" , "door6"},
}


for i in ipairs(mdoor_list) do
	local num = mdoor_list[i][1]
	local desc = mdoor_list[i][2]
	local inv = mdoor_list[i][3]
	local img = mdoor_list[i][4]


mdoors.register_door("my_misc_doors:door"..num.."_locked", {
	description = desc.." Locked",
	inventory_image = "mymdoors_"..inv.."_inv.png",
	groups = {choppy=2,cracky=2,door=1},
	tiles_bottom = {"mymdoors_"..img.."_bottom.png", "mymdoors_"..img.."_edge.png"},
	tiles_top = {"mymdoors_"..img.."_top.png", "mymdoors_"..img.."_edge.png"},
	only_placer_can_open = true,
})
end

-- Crafts

minetest.register_craft({
	output = "my_misc_doors:door1_locked 1",
	recipe = {
		{"my_door_wood:wood_white", "my_door_wood:wood_white", ""},
		{"my_door_wood:wood_white", "my_door_wood:wood_white", "default:steel_ingot"},
		{"my_door_wood:wood_white", "my_door_wood:wood_white", ""}
	}
})

minetest.register_craft({
	output = "my_misc_doors:door2_locked 1",
	recipe = {
		{"my_door_wood:wood_grey", "my_door_wood:wood_grey", ""},
		{"my_door_wood:wood_grey", "my_door_wood:wood_grey", "default:steel_ingot"},
		{"my_door_wood:wood_grey", "my_door_wood:wood_grey", ""}
	}
})
minetest.register_craft({
	output = "my_misc_doors:door3_locked 1",
	recipe = {
		{"default:stone", "default:stone", ""},
		{"default:stone", "default:stone", "default:steel_ingot"},
		{"default:stone", "default:stone", ""}
	}
})
minetest.register_craft({
	output = "my_misc_doors:door4_locked 1",
	recipe = {
		{"default:cobble", "default:cobble", ""},
		{"default:cobble", "default:cobble", "default:steel_ingot"},
		{"default:cobble", "default:cobble", ""}
	}
})
minetest.register_craft({
	output = "my_misc_doors:door5_locked 1",
	recipe = {
		{"my_door_wood:wood_white", "wool:red", ""},
		{"my_door_wood:wood_white", "my_door_wood:wood_white", "default:steel_ingot"},
		{"my_door_wood:wood_white", "wool:red", ""}
	}
})
minetest.register_craft({
	output = "my_misc_doors:door6_locked 1",
	recipe = {
		{"default:steel_ingot", "default:iron_lump", ""},
		{"default:steel_ingot", "default:iron_lump", "default:steel_ingot"},
		{"default:steel_ingot", "default:iron_lump", ""}
	}
})



