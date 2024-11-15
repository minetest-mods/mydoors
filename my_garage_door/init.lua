local rotate_disallow = rawget(_G, "screwdriver") and screwdriver.disallow or nil

local function buildable_to(pos)
	local node = minetest.get_node(pos).name
	if minetest.registered_nodes[node] then -- The checked node is maybe an unknown node
		return minetest.registered_nodes[node].buildable_to
	end
	return false
end

local nodebox_closed = {
	type = "fixed",
	fixed = {
		{-1.5, -0.5,  -0.125,  1.5,  0.5,       -0.0625},
		{-1.5, -0.5,  -0.1875, 1.5, -0.3125,    -0.0625},
		{-1.5, -0.25, -0.1875, 1.5, -0.0624999, -0.0625},
		{-1.5,  0,    -0.1875, 1.5,  0.1875,    -0.0625},
		{-1.5,  0.25, -0.1875, 1.5,  0.4375,    -0.0625},
	}
}

minetest.register_node("my_garage_door:garage_door", {
	description = "Garage Door",
	tiles = {
		"default_snow.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=3},
	node_box = table.copy(nodebox_closed),
	selection_box = {
		type = "fixed",
		fixed = {
			{-1.5, -0.5, -0.1875, 1.5, 1.5, -0.0625},
		}
	},
	on_rotate = rotate_disallow,
	on_place = function(itemstack, placer, pointed_thing)
		local pos1 = pointed_thing.above
		local pos2 = vector.add(pos1, {x=0,y=1,z=0})

		if not placer or not placer:is_player() then
			return
		end

		if not buildable_to(pos1) or
		   not buildable_to(pos2) then
			minetest.chat_send_player(placer:get_player_name(), "Not enough room")
			return
		end

		local player_name = placer:get_player_name()
		if minetest.is_protected(pos1, player_name) then
			minetest.record_protection_violation(pos1, player_name)
			return
		end
		if minetest.is_protected(pos2, player_name) then
			minetest.record_protection_violation(pos2, player_name)
			return
		end

		local p2 = minetest.dir_to_facedir(placer:get_look_dir())
		minetest.set_node(pos1, {name = "my_garage_door:garage_door",     param2 = p2})
		minetest.set_node(pos2, {name = "my_garage_door:garage_door_top", param2 = p2})

		if not (minetest.settings:get_bool("creative_mode") or minetest.check_player_privs(placer:get_player_name(), {creative = true})) then
			itemstack:take_item()
		end
		return itemstack
	end,
	after_destruct = function(pos, oldnode)
		minetest.set_node(vector.add(pos, {x=0,y=1,z=0}), {name = "air"})
	end,

	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		local p2 = node.param2
		local dir = minetest.facedir_to_dir(p2)
		local above = vector.add(pos, {x=0,y=1,z=0})

		local t1 = vector.add(above, dir)
		local t2 = vector.add(t1, dir)

		if not player or not player:is_player() then
			return
		end

		if not buildable_to(t1) or
		   not buildable_to(t2) then
			minetest.chat_send_player(player:get_player_name(), "Not enough room to open")
			return
		end

		local player_name = player:get_player_name()
		if minetest.is_protected(t1, player_name) then
			minetest.record_protection_violation(t1, player_name)
			return
		end
		if minetest.is_protected(t2, player_name) then
			minetest.record_protection_violation(t2, player_name)
			return
		end

		minetest.set_node(t1, {name="my_garage_door:garage_door_open",  param2=p2})
		minetest.set_node(t2, {name="my_garage_door:garage_door_open2", param2=p2})
		minetest.set_node(pos,   {name="air"})
		minetest.set_node(above, {name="air"})
	end,
})
minetest.register_node("my_garage_door:garage_door_top", {
	tiles = {
		"default_snow.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2= "facedir",
	drop = "",
	diggable = false,
	pointable = false,
	groups = {cracky=3},
	node_box = table.copy(nodebox_closed),
	selection_box = {type = "fixed",fixed = {{0, 0, 0, 0, 0, 0},}},
	on_rotate = rotate_disallow,
})

local nodebox_open = {
	type = "fixed",
	fixed = {
		{-1.5, 0.4375, -0.5,    1.5, 0.375, 0.5},
		{-1.5, 0.375,   0.3125, 1.5, 0.5,   0.5},
		{-1.5, 0.375,   0.0625, 1.5, 0.5,   0.25},
		{-1.5, 0.375,  -0.1875, 1.5, 0.5,   0},
		{-1.5, 0.375,  -0.4375, 1.5, 0.5,  -0.25},
	}
}

minetest.register_node("my_garage_door:garage_door_open", {
	tiles = {
		"default_snow.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2= "facedir",
	drop = "my_garage_door:garage_door",
	diggable = false,
	groups = {cracky=3},
	node_box = table.copy(nodebox_open),
	selection_box = {type = "fixed",fixed = {{-1.5, 0.375, -0.5, 1.5, 0.5, 1.5},}},
	on_rotate = rotate_disallow,
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		local p2 = node.param2
		local dir = minetest.facedir_to_dir((p2+2)%4)

		local t1 = vector.add(pos, dir)
		local t2 = vector.subtract(t1, {x=0,y=1,z=0})

		if not player or not player:is_player() then
			return
		end

		if not buildable_to(t1) or
		   not buildable_to(t2) then
			minetest.chat_send_player(player:get_player_name(), "Not enough room to close")
			return
		end

		local player_name = player:get_player_name()
		if minetest.is_protected(t1, player_name) then
			minetest.record_protection_violation(t1, player_name)
			return
		end
		if minetest.is_protected(t2, player_name) then
			minetest.record_protection_violation(t2, player_name)
			return
		end

		local t3 = vector.subtract(pos, dir)

		minetest.set_node(t1, {name="my_garage_door:garage_door_top", param2=p2})
		minetest.set_node(t2, {name="my_garage_door:garage_door",     param2=p2})
		minetest.set_node(pos, {name="air"})
		minetest.set_node(t3,  {name="air"})
	end,
})
minetest.register_node("my_garage_door:garage_door_open2", {
	tiles = {
		"default_snow.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2= "facedir",
	drop = "",
	diggable = false,
	pointable = false,
	groups = {cracky=3},
	node_box = table.copy(nodebox_open),
	selection_box = {type = "fixed",fixed = {{0, 0, 0, 0, 0, 0},}},
	on_rotate = rotate_disallow,
})

-- craft
if minetest.get_modpath("basic_materials") then
	minetest.register_craft({
		output = "my_garage_door:garage_door",
		recipe = {
			{"basic_materials:steel_bar", "", "basic_materials:steel_bar"},
			{"basic_materials:plastic_sheet", "basic_materials:plastic_sheet", "basic_materials:plastic_sheet"},
			{"basic_materials:plastic_sheet", "basic_materials:plastic_sheet", "basic_materials:plastic_sheet"}
		}
	})
end