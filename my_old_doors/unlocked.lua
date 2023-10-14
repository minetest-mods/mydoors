local cdoor_list = {   --Number , Description , Inven Image , Image
	{ "1", "Old Door 1" , "old1"},
	{ "2", "Old Door 2" , "old2"},
	{ "3", "Old Door 3" , "old3"},
	{ "4", "Old Door 4" , "old4"},
}

local function add_door(num, desc, img)
	mydoors.register_door("my_old_doors:door"..num, {
		description = desc,
		inventory_image = "mydoors_"..img.."_inv.png",
		groups = {choppy=2,cracky=2,door=1},
		tiles = {{ name = "mydoors_"..img..".png", backface_culling = true }},
		protected = false,
	})
end

for _,cdoor in ipairs(cdoor_list) do
	add_door(unpack(cdoor))
end


-- Crafts

minetest.register_craft({
	output = "my_old_doors:door1 1",
	recipe = {
		{"default:glass", "my_door_wood:wood_yellow", ""},
		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", ""},
		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", ""}
	}
})
minetest.register_craft({
	output = "my_old_doors:door2 1",
	recipe = {
		{"default:glass", "my_door_wood:wood_red", ""},
		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""},
		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""}
	}
})
minetest.register_craft({
	output = "my_old_doors:door3 1",
	recipe = {
		{"default:glass", "my_door_wood:wood_grey", ""},
		{"my_door_wood:wood_grey", "my_door_wood:wood_grey", ""},
		{"my_door_wood:wood_grey", "my_door_wood:wood_grey", ""}
	}
})
minetest.register_craft({
	output = "my_old_doors:door4 1",
	recipe = {
		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""},
		{"my_door_wood:wood_red", "dye:black", ""},
		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""}
	}
})
