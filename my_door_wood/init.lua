local door_wood = { -- color, desc, image
	{"red", "Red Stained", "red"},
	{"grey", "Grey Stained", "grey"},
	{"dark_grey", "Dark Grey Stained", "dark_grey"},
	{"brown", "Brown Stained", "brown"},
	{"white", "White Stained", "white"},
	{"yellow", "Clear Stained", "yellow"},
	{"black", "Black", "black"},
}

for i = 1,#door_wood do
	local color,desc,img = unpack(door_wood[i])

	minetest.register_node("my_door_wood:wood_"..color, {
		description = desc.." Wood",
		drawtype = "normal",
		paramtype = "light",
		tiles = {"mydoors_"..img.."_wood.png"},
		groups = {cracky = 2, choppy = 2},
	})

	-- Crafts

	minetest.register_craft({
		output = "my_door_wood:wood_"..color,
		recipe = {
			{"default:wood", "", ""},
			{"dye:"..color, "", ""},
			{"", "", ""}
		}
	})
end
