local rotate_disallow = rawget(_G, "screwdriver") and screwdriver.disallow

local doors = {
	{"my_sliding_doors:door1a","my_sliding_doors:door1b","my_sliding_doors:door1c","my_sliding_doors:door1d","1","White Right"},
	{"my_sliding_doors:door2a","my_sliding_doors:door2b","my_sliding_doors:door2c","my_sliding_doors:door2d","2","Flower Right"},
	{"my_sliding_doors:door3a","my_sliding_doors:door3b","my_sliding_doors:door3c","my_sliding_doors:door3d","3","Framed Right"},
}

local function add_door(doora, doorb, doorc, doord, num)
	local function onplace(itemstack, placer, pointed_thing)
		local pos1 = pointed_thing.above
		local pos2 = vector.add(pos1, {x=0,y=1,z=0})

		if not placer or not placer:is_player() then
			return
		end

		if not minetest.registered_nodes[minetest.get_node(pos1).name].buildable_to or
		   not minetest.registered_nodes[minetest.get_node(pos2).name].buildable_to then
			minetest.chat_send_player(placer:get_player_name(), "Not enough room")
			return
		end

		local p2 = minetest.dir_to_facedir(placer:get_look_dir())
		local pos3 = vector.add(pos1, minetest.facedir_to_dir((p2-1)%4))

		local player_name = placer:get_player_name()
		if minetest.is_protected(pos1, player_name) then
			minetest.record_protection_violation(pos1, player_name)
			return
		end
		if minetest.is_protected(pos2, player_name) then
			minetest.record_protection_violation(pos2, player_name)
			return
		end
		if minetest.is_protected(pos3, player_name) then
			minetest.record_protection_violation(pos3, player_name)
			return
		end

		if minetest.get_node(pos3).name ~= "air" then
			minetest.chat_send_player(placer:get_player_name(), "Not enough room")
			return
		end
		if minetest.get_node(pos3).name == doora then
			minetest.set_node(pos1, {name=doora.."2", param2=p2})
			minetest.set_node(pos2, {name=doorb.."2", param2=p2})
		else
			minetest.set_node(pos1, {name=doora.."2", param2=p2})
			minetest.set_node(pos2, {name=doorb.."2", param2=p2})
		end

		if not (minetest.settings:get_bool("creative_mode") or minetest.check_player_privs(placer:get_player_name(), {creative = true})) then
			itemstack:take_item()
		end
		return itemstack
	end

	local function afterdestruct(pos, oldnode)
		minetest.set_node(vector.add(pos, {x=0,y=1,z=0}), {name="air"})
	end

	local function rightclick(pos, node, player, itemstack, pointed_thing)
		if node.name == doora.."2" then
			minetest.set_node(pos, {name=doorc.."2", param2=node.param2})
			minetest.set_node(vector.add(pos, {x=0,y=1,z=0}), {name=doord.."2", param2=node.param2})
		elseif node.name == doorc.."2" then
			minetest.set_node(pos, {name=doora.."2", param2=node.param2})
			minetest.set_node(vector.add(pos, {x=0,y=1,z=0}), {name=doorb.."2", param2=node.param2})
		end

		-- Open neighbouring doors
		for i=0,3 do
			local dir = minetest.facedir_to_dir(i)
			local neighbour_pos = vector.add(pos, dir)
			local neighbour_above = vector.add(neighbour_pos, {x=0,y=1,z=0})
			local neighbour = minetest.get_node(neighbour_pos)
			if neighbour.name == doora then
				minetest.set_node(neighbour_pos,   {name=doorc, param2=neighbour.param2})
				minetest.set_node(neighbour_above, {name=doord, param2=neighbour.param2})
			elseif neighbour.name == doora.."2" then
				minetest.set_node(neighbour_pos,   {name=doorc.."2", param2=neighbour.param2})
				minetest.set_node(neighbour_above, {name=doord.."2", param2=neighbour.param2})
			elseif neighbour.name == doorc then
				minetest.set_node(neighbour_pos,   {name=doora, param2=neighbour.param2})
				minetest.set_node(neighbour_above, {name=doorb, param2=neighbour.param2})
			elseif neighbour.name == doorc.."2" then
				minetest.set_node(neighbour_pos,   {name=doora.."2", param2=neighbour.param2})
				minetest.set_node(neighbour_above, {name=doorb.."2", param2=neighbour.param2})
			end
		end
	end

	local function afterplace(pos, placer, itemstack, pointed_thing)
		local node = minetest.get_node(pos)
		minetest.set_node(vector.add(pos, {x=0,y=1,z=0}), {name=doord,param2=node.param2})
	end


	minetest.register_node(doora.."2", {
		tiles = {
			"myjdoors_door"..num.."a_edge.png",
			"myjdoors_door"..num.."a_edge.png",
			"myjdoors_door"..num.."a_edge.png",
			"myjdoors_door"..num.."a_edge.png",
			"myjdoors_door"..num.."a_bottom.png^[transformFX",
			"myjdoors_door"..num.."a_bottom.png"
		},
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		drop = doora,
		sunlight_propagates = true,
		groups = {choppy = 3, cracky = 3},
		node_box = {
			type = "fixed",
			fixed = {
				{ 0.375, -0.5, -0.1875,   0.5,   0.5,   -0.0625},
				{-0.5,   -0.5, -0.1875,  -0.375, 0.5,   -0.0625},

				{-0.5,   -0.5, -0.1875,   0.5,  -0.375, -0.0625},
				{-0.5,   -0.5, -0.125,    0.5,   0.5,   -0.145},

				{-0.625, -0.5, -0.0625,  -0.5,   0.5,    0.0625},
				{-1.5,   -0.5, -0.0625,  -1.375, 0.5,    0.0625},

				{-1.5,   -0.5, -0.0625,  -0.5,  -0.375,  0.0625},
				{-1.5,   -0.5,  0,       -0.5,   0.5,    0.02},
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-1.5, -0.5, -0.0625, -0.5, 1.5,  0.0625},
				{-0.5, -0.5, -0.0625,  0.5, 1.5, -0.1875}
			}
		},
		on_rotate = rotate_disallow,
		on_place = onplace,
		after_destruct = afterdestruct,
		on_rightclick = rightclick,
	})
	minetest.register_node(doorb.."2", {
		tiles = {
			"myjdoors_door"..num.."a_edge.png",
			"myjdoors_door"..num.."a_edge.png",
			"myjdoors_door"..num.."a_edge.png",
			"myjdoors_door"..num.."a_edge.png",
			"myjdoors_door"..num.."a_top.png^[transformFX",
			"myjdoors_door"..num.."a_top.png"
		},
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		sunlight_propagates = true,
		groups = {choppy = 1, cracky = 1},
		node_box = {
			type = "fixed",
			fixed = {
				{ 0.375, -0.5, -0.1875,  0.5,   0.5,   -0.0625},
				{-0.5,   -0.5, -0.1875, -0.375, 0.5,   -0.0625},

				{-0.5,    0.5, -0.1875,  0.5,   0.375, -0.0625},
				{-0.5,   -0.5, -0.125,   0.5,   0.5,   -0.145},

				{-0.625, -0.5, -0.0625, -0.5,   0.5,    0.0625},
				{-1.5,   -0.5, -0.0625, -1.375, 0.5,    0.0625},

				{-1.5,    0.5, -0.0625, -0.5,   0.375,  0.0625},
				{-1.5,   -0.5,  0,      -0.5,   0.5,    0.02},
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{0, 0, 0, 0, 0, 0},
			}
		},
		on_rotate = rotate_disallow,
	})
	minetest.register_node(doorc.."2", {
		tiles = {
			"myjdoors_door"..num.."a_edge.png",
			"myjdoors_door"..num.."a_edge.png",
			"myjdoors_door"..num.."a_edge.png",
			"myjdoors_door"..num.."a_edge.png",
			"myjdoors_door"..num.."a_bottom.png^[transformFX",
			"myjdoors_door"..num.."a_bottom.png"
		},
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		sunlight_propagates = true,
		drop = doora,
		groups = {choppy = 1, cracky = 1},
		node_box = {
			type = "fixed",
			fixed = {
				{-0.625, -0.5, -0.1875, -0.5,   0.5,   -0.0625},
				{-1.5,   -0.5, -0.1875, -1.375, 0.5,   -0.0625},

				{-1.5,   -0.5, -0.1875, -0.5,  -0.375, -0.0625},
				{-1.5,   -0.5, -0.125,  -0.5,   0.5,   -0.145},

				{-0.625, -0.5, -0.0625, -0.5,   0.5,    0.0625},
				{-1.5,   -0.5, -0.0625, -1.375, 0.5,    0.0625},

				{-1.5,   -0.5, -0.0625, -0.5,  -0.375,  0.0625},
				{-1.5,   -0.5,  0,      -0.5,   0.5,    0.02},
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-1.5, -0.5, 0.0625, -0.5, 1.5, -0.1875}
			}
		},
		on_rotate = rotate_disallow,
		after_place_node = afterplace,
		after_destruct = afterdestruct,
		on_rightclick = rightclick,
	})
	minetest.register_node(doord.."2", {
		tiles = {
			"myjdoors_door"..num.."a_edge.png",
			"myjdoors_door"..num.."a_edge.png",
			"myjdoors_door"..num.."a_edge.png",
			"myjdoors_door"..num.."a_edge.png",
			"myjdoors_door"..num.."a_top.png^[transformFX",
			"myjdoors_door"..num.."a_top.png"
		},
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		sunlight_propagates = true,
		groups = {choppy = 1, cracky = 1},
		node_box = {
			type = "fixed",
			fixed = {
				{-0.625, -0.5, -0.1875, -0.5,   0.5,   -0.0625},
				{-1.5,   -0.5, -0.1875, -1.375, 0.5,   -0.0625},

				{-1.5,    0.5, -0.1875, -0.5,   0.375, -0.0625},
				{-1.5,   -0.5, -0.125,  -0.5,   0.5,   -0.145},

				{-0.625, -0.5, -0.0625, -0.5,   0.5,   0.0625},
				{-1.5,   -0.5, -0.0625, -1.375, 0.5,   0.0625},

				{-1.5,    0.5, -0.0625, -0.5,   0.375, 0.0625},
				{-1.5,   -0.5,  0,      -0.5,   0.5,   0.02},
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{0, 0, 0, 0, 0, 0},
			}
		},
		on_rotate = rotate_disallow,
	})
end

for _,door in ipairs(doors) do
	add_door(unpack(door))
end
