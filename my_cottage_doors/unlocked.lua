local cdoor_list = {   --Number , Description , Inven Image , Image
--	{ "1", "Cottage Door 1" , "door1", "door1"},
	{ "2", "Cottage Door 2" , "door2" , "door2"},	
}


for i in ipairs(cdoor_list) do
	local num = cdoor_list[i][1]
	local desc = cdoor_list[i][2]
	local inv = cdoor_list[i][3]
	local img = cdoor_list[i][4]
	local lock = cdoor_list[i][5]


mdoors.register_door("my_cottage_doors:door"..num, {
	description = desc.." Locked",
	inventory_image = "mycdoors_"..inv.."_inv.png",
	groups = {choppy=2,cracky=2,door=1},
	tiles_bottom = {"mycdoors_"..img.."_bottom.png", "mycdoors_"..img.."_edge.png"},
	tiles_top = {"mycdoors_"..img.."_top.png", "mycdoors_"..img.."_edge.png"},
	only_placer_can_open = false,
})
end

-- Crafts

minetest.register_craft({
	output = "my_cottage_doors:door1 1",
	recipe = {
		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", "default:steel_ingot"},
		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", ""},
		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", "default:steel_ingot"}
	}
})

minetest.register_craft({
	output = "my_cottage_doors:door2 1",
	recipe = {
		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""},
		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""},
		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""}
	}
})




