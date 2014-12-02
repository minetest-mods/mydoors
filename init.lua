local door_list = {   --Number , Description , Inven Image , Image , Is Locked
	{ "1" , "Locked Circle" , "door1", "door1" , "true"},
	{ "2" , "Wood Circle" , "door2" , "door2" , "false"},	
	{ "3" , "Wood Glass" , "door3" , "door3" , "false"},
	{ "4" , "Wood" , "door4" , "door4" , "false"},
	{ "5", "White" , "door5" , "door5" , "false"},
	{ "6", "Medevil 1" , "door6" , "door6" , "true"},
	{ "7", "Medevil 2" , "door7" , "door7" , "true"},
	{ "8", "Medevil 3" , "door8" , "door8" , "true"},
}


for i in ipairs(door_list) do
	local num = door_list[i][1]
	local desc = door_list[i][2]
	local inv = door_list[i][3]
	local img = door_list[i][4]
	local lock = door_list[i][5]


doors.register_door("mydoors:door"..num.."_locked", {
	description = desc.." Door",
	inventory_image = inv.."_inv.png",
	groups = {choppy=2,cracky=2,door=1},
	tiles_bottom = {img.."_bottom.png", img.."_edge.png"},
	tiles_top = {img.."_top.png", img.."_edge.png"},
	only_placer_can_open = lock,
})

--[[

--Unlocked Door

doors.register_door("mydoors:door"..num.."_unlocked", {
	description = desc.." Door Unlocked",
	inventory_image = inv.."_inv.png",
	groups = {choppy=2,cracky=2,door=1},
	tiles_bottom = {img.."_bottom.png", img.."_edge.png"},
	tiles_top = {img.."_top.png", img.."_edge.png"},
	only_placer_can_open = false,
})


--Crafts

--Locked
minetest.register_craft({
	output = "bat_blocks:bat_door",
	recipe = {
		{"bat_blocks:bat_color_black", "default:tree"},
		{"default:tree", "bat_blocks:bat_rod_black"},
		{"bat_blocks:bat_color_black", "default:tree"}
	}
})

--Unlocked
minetest.register_craft({
	output = "bat_blocks:bat_door_unlocked",
	recipe = {
		{"bat_blocks:bat_color_black", "default:tree"},
		{"default:tree", "bat_blocks:bat_color_black"},
		{"bat_blocks:bat_color_black", "default:tree"}
	}
})


----trapdoor----

local function update_node(pos, node) 
	minetest.set_node(pos, node)
end

local function punch(pos)
	local meta = minetest.get_meta(pos)
	local state = meta:get_int("state")
	local me = minetest.get_node(pos)
	local tmp_node
	local tmp_node2
	oben = {x=pos.x, y=pos.y, z=pos.z}
		if state == 1 then
			state = 0
			tmp_node = {name="bat_blocks:bat_trapdoor", param1=me.param1, param2=me.param2}
		else
			state = 1
			tmp_node = {name="bat_blocks:bat_trapdoor_open", param1=me.param1, param2=me.param2}
		end
		update_node(pos, tmp_node)
		meta:set_int("state", state)
end
minetest.register_node("bat_blocks:bat_trapdoor", {
	description = "Trapdoor",
	inventory_image = "bat_trapdoor.png",
	drawtype = "nodebox",
	tiles = {"bat_trapdoor.png", "bat_trapdoor.png",  "bat_trap_side.png",  "bat_trap_side.png", "bat_trap_side.png", "bat_trap_side.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=2,door=1},
	sounds = default.node_sound_wood_defaults(),
	drop = "bat_blocks:bat_trapdoor",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5}
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5}
	},

	on_punch = function(pos, node, clicker)
		punch(pos)
	end,
})

minetest.register_node("bat_blocks:bat_trapdoor_open", {
	drawtype = "nodebox",
	tiles = {"bat_trap_side.png", "bat_trap_side.png",  "bat_trap_side.png",  "bat_trap_side.png", "bat_trapdoor.png", "bat_trapdoor.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	pointable = true,
	stack_max = 0,
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=2,door=1},
	climbable = true,
	sounds = default.node_sound_wood_defaults(),
	drop = "bat_blocks:bat_trapdoor",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	},
	on_punch = function(pos, node, clicker)
		punch(pos)
	end,
})

minetest.register_craft({
	output = 'bat_blocks:bat_trapdoor 2',
	recipe = {
		{'bat_blocks:bat_color_black', 'bat_blocks:bat_rod_black', ''},
		{'bat_blocks:bat_color_black', 'bat_blocks:bat_rod_black', ''},
		{'', '', ''},
	}
})
--]]
end
