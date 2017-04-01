local doors = {
	{"my_sliding_doors:door1a","my_sliding_doors:door1b","my_sliding_doors:door1c","my_sliding_doors:door1d","1","White Right"},
	{"my_sliding_doors:door2a","my_sliding_doors:door2b","my_sliding_doors:door2c","my_sliding_doors:door2d","2","Flower Right"},
	{"my_sliding_doors:door3a","my_sliding_doors:door3b","my_sliding_doors:door3c","my_sliding_doors:door3d","3","Framed Right"},
	}
for i in ipairs (doors) do
local doora = doors[i][1]
local doorb = doors[i][2]
local doorc = doors[i][3]
local doord = doors[i][4]
local num = doors[i][5]
--local des = doors[i][6]

function onplace(itemstack, placer, pointed_thing)
	local pos1 = pointed_thing.above
	local pos2 = {x=pos1.x, y=pos1.y + 1, z=pos1.z}
	if
			not minetest.registered_nodes[minetest.get_node(pos1).name].buildable_to or
			not minetest.registered_nodes[minetest.get_node(pos2).name].buildable_to or
			not placer or not placer:is_player() then
		return
	end

	local pt = pointed_thing.above
	local pt2 = {x=pt.x, y=pt.y, z=pt.z}
		pt2.y = pt2.y+1
	local p2 = minetest.dir_to_facedir(placer:get_look_dir())
	local pt3 = {x=pt.x, y=pt.y, z=pt.z}
	if p2 == 0 then
		pt3.x = pt3.x-1
	elseif p2 == 1 then
		pt3.z = pt3.z+1
	elseif p2 == 2 then
		pt3.x = pt3.x+1
	elseif p2 == 3 then
		pt3.z = pt3.z-1
	end
	if minetest.get_node(pt3).name ~= "air" then
		minetest.chat_send_player(placer:get_player_name(),"Not enough room")
		return
	end
	if minetest.get_node(pt3).name == doora then
		minetest.set_node(pt, {name=doora.."2", param2=p2})
		minetest.set_node(pt2, {name=doorb.."2", param2=p2})
	else
		minetest.set_node(pt, {name=doora.."2", param2=p2})
		minetest.set_node(pt2, {name=doorb.."2", param2=p2})
	end
end

function afterdestruct(pos, oldnode)
	minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z},{name="air"})
end

function rightclick(pos, node, player, itemstack, pointed_thing)
	local a = minetest.get_node({x=pos.x, y=pos.y, z=pos.z-1})
	local b = minetest.get_node({x=pos.x, y=pos.y, z=pos.z+1})
	local c = minetest.get_node({x=pos.x+1, y=pos.y, z=pos.z})
	local d = minetest.get_node({x=pos.x-1, y=pos.y, z=pos.z})

	if node.name == doora.."2" then
		minetest.set_node(pos, {name=doorc.."2", param2=node.param2})
		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z}, {name=doord.."2", param2=node.param2})
	elseif node.name == doorc.."2" then
		minetest.set_node(pos, {name=doora.."2", param2=node.param2})
		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z}, {name=doorb.."2", param2=node.param2})
	end

	if a.name == doora then
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z-1}, {name=doorc, param2=a.param2})
		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z-1}, {name=doord, param2=a.param2})
	end
	if b.name == doora then
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z+1}, {name=doorc, param2=b.param2})
		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z+1}, {name=doord, param2=b.param2})
	end
	if c.name == doora then
		minetest.set_node({x=pos.x+1, y=pos.y, z=pos.z}, {name=doorc, param2=c.param2})
		minetest.set_node({x=pos.x+1,y=pos.y+1,z=pos.z}, {name=doord, param2=c.param2})
	end
	if d.name == doora then
		minetest.set_node({x=pos.x-1, y=pos.y, z=pos.z}, {name=doorc, param2=d.param2})
		minetest.set_node({x=pos.x-1,y=pos.y+1,z=pos.z}, {name=doord, param2=d.param2})
	end

	if a.name == doora.."2" then
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z-1}, {name=doorc.."2", param2=a.param2})
		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z-1}, {name=doord.."2", param2=a.param2})
	end
	if b.name == doora.."2" then
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z+1}, {name=doorc.."2", param2=b.param2})
		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z+1}, {name=doord.."2", param2=b.param2})
	end
	if c.name == doora.."2" then
		minetest.set_node({x=pos.x+1, y=pos.y, z=pos.z}, {name=doorc.."2", param2=c.param2})
		minetest.set_node({x=pos.x+1,y=pos.y+1,z=pos.z}, {name=doord.."2", param2=c.param2})
	end
	if d.name == doora.."2" then
		minetest.set_node({x=pos.x-1, y=pos.y, z=pos.z}, {name=doorc.."2", param2=d.param2})
		minetest.set_node({x=pos.x-1,y=pos.y+1,z=pos.z}, {name=doord.."2", param2=d.param2})
	end
	if a.name == doorc then
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z-1}, {name=doora, param2=a.param2})
		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z-1}, {name=doorb, param2=a.param2})
	end
	if b.name == doorc then
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z+1}, {name=doora, param2=b.param2})
		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z+1}, {name=doorb, param2=b.param2})
	end
	if c.name == doorc then
		minetest.set_node({x=pos.x+1, y=pos.y, z=pos.z}, {name=doora, param2=c.param2})
		minetest.set_node({x=pos.x+1,y=pos.y+1,z=pos.z}, {name=doorb, param2=c.param2})
	end
	if d.name == doorc then
		minetest.set_node({x=pos.x-1, y=pos.y, z=pos.z}, {name=doora, param2=d.param2})
		minetest.set_node({x=pos.x-1,y=pos.y+1,z=pos.z}, {name=doorb, param2=d.param2})
	end

	if a.name == doorc.."2" then
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z-1}, {name=doora.."2", param2=a.param2})
		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z-1}, {name=doorb.."2", param2=a.param2})
	end
	if b.name == doorc.."2" then
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z+1}, {name=doora.."2", param2=b.param2})
		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z+1}, {name=doorb.."2", param2=b.param2})
	end
	if c.name == doorc.."2" then
		minetest.set_node({x=pos.x+1, y=pos.y, z=pos.z}, {name=doora.."2", param2=c.param2})
		minetest.set_node({x=pos.x+1,y=pos.y+1,z=pos.z}, {name=doorb.."2", param2=c.param2})
	end
	if d.name == doorc.."2" then
		minetest.set_node({x=pos.x-1, y=pos.y, z=pos.z}, {name=doora.."2", param2=d.param2})
		minetest.set_node({x=pos.x-1,y=pos.y+1,z=pos.z}, {name=doorb.."2", param2=d.param2})
	end

end

function afterplace(pos, placer, itemstack, pointed_thing)
	   minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z},{name=doord,param2=nodeu.param2})
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
	groups = {cracky = 3},
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, -0.1875, 0.5, 0.5, -0.0625},
			{-0.5, -0.5, -0.1875, -0.375, 0.5, -0.0625},

			{-0.5, -0.5, -0.1875, 0.5, -0.375, -0.0625},
			{-0.5, -0.5, -0.125, 0.5, 0.5, -0.145},

			{-0.625,	-0.5,	-0.0625,	 -0.5,	 0.5,	0.0625},
			{-1.5,		-0.5,	-0.0625,	-1.375,  0.5,	0.0625},

			{-1.5,		-0.5,	-0.0625,	-0.5,   -0.375, 0.0625},
			{-1.5,		-0.5,	 0,		-0.5,	 0.5,	0.02},
		}
	},
	selection_box = {type = "fixed",fixed = {{-1.5, -0.5, -0.0625, -0.5, 1.5, 0.0625},{-0.5, -0.5, -0.0625, 0.5, 1.5, -0.1875}}},

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
	groups = {cracky = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, -0.1875, 0.5, 0.5, -0.0625},
			{-0.5, -0.5, -0.1875, -0.375, 0.5, -0.0625},

			{-0.5, 0.5, -0.1875, 0.5, 0.375, -0.0625},
			{-0.5, -0.5, -0.125, 0.5, 0.5, -0.145},

			{-0.625,	-0.5,	-0.0625,	 -0.5,	 0.5,	0.0625},
			{-1.5,		-0.5,	-0.0625,	-1.375,  0.5,	0.0625},

			{-1.5,		0.5,	-0.0625,	-0.5,   0.375, 0.0625},
			{-1.5,		-0.5,	 0,		-0.5,	 0.5,	0.02},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{0, 0, 0, 0, 0, 0},
		}
	},
})minetest.register_node(doorc.."2", {
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
	groups = {cracky = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.625, -0.5, -0.1875, -0.5, 0.5, -0.0625},
			{-1.5, -0.5, -0.1875, -1.375, 0.5, -0.0625},

			{-1.5, -0.5, -0.1875, -0.5, -0.375, -0.0625},
			{-1.5, -0.5, -0.125, -0.5, 0.5, -0.145},

			{-0.625,	-0.5,	-0.0625,	 -0.5,	 0.5,	0.0625},
			{-1.5,		-0.5,	-0.0625,	-1.375,  0.5,	0.0625},

			{-1.5,		-0.5,	-0.0625,	-0.5,   -0.375, 0.0625},
			{-1.5,		-0.5,	 0,		-0.5,	 0.5,	0.02},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-1.5, -0.5, 0.0625, -0.5, 1.5, -0.1875}
		}
	},
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
	groups = {cracky = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.625, -0.5, -0.1875, -0.5, 0.5, -0.0625},
			{-1.5, -0.5, -0.1875, -1.375, 0.5, -0.0625},

			{-1.5, 0.5, -0.1875, -0.5, 0.375, -0.0625},
			{-1.5, -0.5, -0.125, -0.5, 0.5, -0.145},

			{-0.625,	-0.5,	-0.0625,	 -0.5,	 0.5,	0.0625},
			{-1.5,		-0.5,	-0.0625,	-1.375,  0.5,	0.0625},

			{-1.5,		0.5,	-0.0625,	-0.5,   0.375, 0.0625},
			{-1.5,		-0.5,	 0,		-0.5,	 0.5,	0.02},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{0, 0, 0, 0, 0, 0},
		}
	},
})
end
