local mdoor_list = {   --Number , Description , Inven Image , Image
	{"Misc Door 1" , "door1"},
	{"Misc Door 2" , "door2"},
	{"Misc Door 3" , "door3"},
	{"Misc Door 4" , "door4"},
	{"Misc Door 5" , "door5"},
}

local function add_door(desc, img)
	doors.register_door("my_misc_doors:"..img.."_locked", {
		description = desc.." Locked",
		inventory_image = "mymdoors_"..img.."_inv.png",
		groups = {choppy=2,cracky=2,door=1},
		tiles = {{name="mymdoors_"..img..".png", backface_culling = true }},
		protected = true,
	})
end

for _,mdoor in ipairs(mdoor_list) do
	add_door(unpack(mdoor))
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
