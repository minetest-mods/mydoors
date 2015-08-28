local cdoor_list = {
	{ "1", "Future Door 1" , "future1", "default:stone"},
	{ "2", "Future Door 2" , "future2", "default:cobble"},
	{ "3", "Future Door 3" , "future3", "dye:black"},
}


for i in ipairs(cdoor_list) do
	local num = cdoor_list[i][1]
	local desc = cdoor_list[i][2]
	local img = cdoor_list[i][3]
	local itm = cdoor_list[i][4]


doors.register_door("my_future_doors:door"..num, {
	description = desc,
	inventory_image = "mydoors_"..img.."_inv.png",
	groups = {choppy=2,cracky=2,door=1},
	tiles_bottom = {"mydoors_"..img.."_bottom.png", "mydoors_"..img.."_edge.png"},
	tiles_top = {"mydoors_"..img.."_top.png", "mydoors_"..img.."_edge.png"},
	only_placer_can_open = false,
})


-- Crafts

minetest.register_craft({
	output = "my_future_doors:door"..num.." 1",
	recipe = {
		{"my_door_wood:wood_dark_grey", "my_door_wood:wood_dark_grey", ""},
		{"my_door_wood:wood_dark_grey", itm, ""},
		{"my_door_wood:wood_dark_grey", "my_door_wood:wood_dark_grey", ""}
	}
})
end





