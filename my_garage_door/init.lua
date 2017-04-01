
minetest.register_node("my_garage_door:garage_door", {
	description = "Garage Door",
	tiles = {
		"default_snow.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-1.5, -0.5, -0.125, 1.5, 0.5, -0.0625},
			{-1.5, -0.5, -0.1875, 1.5, -0.3125, -0.0625},
			{-1.5, -0.25, -0.1875, 1.5, -0.0624999, -0.0625},
			{-1.5, 0, -0.1875, 1.5, 0.1875, -0.0625},
			{-1.5, 0.25, -0.1875, 1.5, 0.4375, -0.0625},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-1.5, -0.5, -0.1875, 1.5, 1.5, -0.0625},
		}
	},
	on_place = function(itemstack, placer, pointed_thing)
	local p = pointed_thing.above
	local p2 = minetest.dir_to_facedir(placer:get_look_dir())
print(p2)
		minetest.set_node(p, {name = "my_garage_door:garage_door",param2 = p2})
		minetest.set_node({x=p.x,y=p.y+1,z=p.z}, {name = "my_garage_door:garage_door_top",param2 = p2})
	end,
	after_destruct = function(pos, oldnode)
		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z},{name = "air"})
	end,

	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
	local p2 = node.param2 --minetest.dir_to_facedir(player:get_look_dir())
	local t1 = {x=pos.x,y=pos.y+1,z=pos.z}
	local t2 = {x=pos.x,y=pos.y+1,z=pos.z}
		if p2 == 0 then
		t1 = {x=pos.x,y=pos.y+1,z=pos.z+1}
		t2 = {x=pos.x,y=pos.y+1,z=pos.z+2}
		elseif p2 == 1 then
		t1 = {x=pos.x+1,y=pos.y+1,z=pos.z}
		t2 = {x=pos.x+2,y=pos.y+1,z=pos.z}
		elseif p2 == 2 then
		t1 = {x=pos.x,y=pos.y+1,z=pos.z-1}
		t2 = {x=pos.x,y=pos.y+1,z=pos.z-2}
		elseif p2 == 3 then
		t1 = {x=pos.x-1,y=pos.y+1,z=pos.z}
		t2 = {x=pos.x-2,y=pos.y+1,z=pos.z}
		end
			minetest.set_node(t1,{name="my_garage_door:garage_door_open",param2=p2})
			minetest.set_node(t2,{name="my_garage_door:garage_door_open2",param2=p2})
			minetest.set_node(pos,{name="air"})
			minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z},{name="air"})
		--end
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
	node_box = {
		type = "fixed",
		fixed = {
			{-1.5, -0.5, -0.125, 1.5, 0.5, -0.0625},
			{-1.5, -0.5, -0.1875, 1.5, -0.3125, -0.0625},
			{-1.5, -0.25, -0.1875, 1.5, -0.0624999, -0.0625},
			{-1.5, 0, -0.1875, 1.5, 0.1875, -0.0625},
			{-1.5, 0.25, -0.1875, 1.5, 0.4375, -0.0625},
		}
	},
	selection_box = {type = "fixed",fixed = {{0, 0, 0, 0, 0, 0},}},
})
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
	node_box = {
		type = "fixed",
		fixed = {
			{-1.5, 0.4375, -0.5, 1.5, 0.375, 0.5},
			{-1.5, 0.375, 0.3125, 1.5, 0.5, 0.5},
			{-1.5, 0.375, 0.0625, 1.5, 0.5, 0.25},
			{-1.5, 0.375, -0.1875, 1.5, 0.5, 0},
			{-1.5, 0.375, -0.4375, 1.5, 0.5, -0.25},
		}
	},
	selection_box = {type = "fixed",fixed = {{-1.5, 0.375, -0.5, 1.5, 0.5, 1.5},}},

	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
	local p2 = node.param2 --minetest.dir_to_facedir(player:get_look_dir())
	local t1 = {x=pos.x,y=pos.y+1,z=pos.z}
	local t2 = {x=pos.x,y=pos.y+1,z=pos.z}
	local t3
		if p2 == 0 then
		t1 = {x=pos.x,y=pos.y,z=pos.z-1}
		t2 = {x=pos.x,y=pos.y-1,z=pos.z-1}
		t3 = {x=pos.x,y=pos.y,z=pos.z+1}
		elseif p2 == 1 then
		t1 = {x=pos.x-1,y=pos.y,z=pos.z}
		t2 = {x=pos.x-1,y=pos.y-1,z=pos.z}
		t3 = {x=pos.x+1,y=pos.y,z=pos.z}
		elseif p2 == 2 then
		t1 = {x=pos.x,y=pos.y,z=pos.z+1}
		t2 = {x=pos.x,y=pos.y-1,z=pos.z+1}
		t3 = {x=pos.x,y=pos.y,z=pos.z-1}
		elseif p2 == 3 then
		t1 = {x=pos.x+1,y=pos.y,z=pos.z}
		t2 = {x=pos.x+1,y=pos.y-1,z=pos.z}
		t3 = {x=pos.x-1,y=pos.y,z=pos.z}
		end
			minetest.set_node(t1,{name="my_garage_door:garage_door_top",param2=p2})
			minetest.set_node(t2,{name="my_garage_door:garage_door",param2=p2})
			minetest.set_node(pos,{name="air"})
			minetest.set_node(t3,{name="air"})
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
	node_box = {
		type = "fixed",
		fixed = {
			{-1.5, 0.4375, -0.5, 1.5, 0.375, 0.5},
			{-1.5, 0.375, 0.3125, 1.5, 0.5, 0.5},
			{-1.5, 0.375, 0.0625, 1.5, 0.5, 0.25},
			{-1.5, 0.375, -0.1875, 1.5, 0.5, 0},
			{-1.5, 0.375, -0.4375, 1.5, 0.5, -0.25},
		}
	},
	selection_box = {type = "fixed",fixed = {{0, 0, 0, 0, 0, 0},}},

})
