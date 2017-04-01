local doors = {
	{"my_sliding_doors:door1a","my_sliding_doors:door1b","my_sliding_doors:door1c","my_sliding_doors:door1d","1","White"},
	{"my_sliding_doors:door2a","my_sliding_doors:door2b","my_sliding_doors:door2c","my_sliding_doors:door2d","2","Flower"},
	{"my_sliding_doors:door3a","my_sliding_doors:door3b","my_sliding_doors:door3c","my_sliding_doors:door3d","3","Framed"},
	}
for i in ipairs (doors) do
local doora = doors[i][1]
local doorb = doors[i][2]
local doorc = doors[i][3]
local doord = doors[i][4]
local num = doors[i][5]
local des = doors[i][6]

function onplace(itemstack, placer, pointed_thing)

	local pos1 = pointed_thing.above
	local pos = pos1
	local pos2 = minetest.find_node_near(pos1, 1, {doora})
	local par = minetest.dir_to_facedir(placer:get_look_dir())
	local par2 = par + 2

		if par2 == 4 then par2 = 0 end
		if par2 == 5 then par2 = 1 end
		if pos2 == nil then
			minetest.set_node(pos, {name=doora,param2=par})
			minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z}, {name=doorb,param2=par})
		else
			minetest.set_node(pos, {name=doora.."2",param2=par2})
			minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z}, {name=doorb.."2",param2=par2})
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
		if node.name == doora then
		minetest.set_node(pos, {name=doorc, param2=node.param2})
		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z}, {name=doord, param2=node.param2})
		elseif node.name == doorc then
		minetest.set_node(pos, {name=doora, param2=node.param2})
		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z}, {name=doorb, param2=node.param2})
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

minetest.register_node(doora, {
	description = des.." Sliding Door",
	inventory_image = "myjdoors_door"..num.."a_inv.png",
	wield_image = "myjdoors_door"..num.."a_inv.png",
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
	groups = {cracky = 3},
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0.1875, 0.5, 0.5, 0.0625},
			{-0.5, -0.5, 0.1875, -0.375, 0.5, 0.0625},

			{-0.5, -0.5, 0.1875, 0.5, -0.375, 0.0625},
			{-0.5, -0.5, 0.125, 0.5, 0.5, 0.145},

			{-0.625,	-0.5,	-0.0625,	 -0.5,	 0.5,	0.0625},
			{-1.5,		-0.5,	-0.0625,	-1.375,  0.5,	0.0625},

			{-1.5,		-0.5,	-0.0625,	-0.5,   -0.375, 0.0625},
			{-1.5,		-0.5,	 0,		-0.5,	 0.5,	0.02},
		}
	},
	selection_box = {type = "fixed",fixed = {{-1.5, -0.5, -0.0625, -0.5, 1.5, 0.0625},{-0.5, -0.5, 0.0625, 0.5, 1.5, 0.1875}}},

on_place = onplace,

after_destruct = afterdestruct,

on_rightclick = rightclick,
})
minetest.register_node(doorb, {
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
			{0.375, -0.5, 0.1875, 0.5, 0.5, 0.0625},
			{-0.5, -0.5, 0.1875, -0.375, 0.5, 0.0625},

			{-0.5, 0.5, 0.1875, 0.5, 0.375, 0.0625},
			{-0.5, -0.5, 0.125, 0.5, 0.5, 0.145},

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
})minetest.register_node(doorc, {
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
			{-0.625, -0.5, 0.1875, -0.5, 0.5, 0.0625},
			{-1.5, -0.5, 0.1875, -1.375, 0.5, 0.0625},

			{-1.5, -0.5, 0.1875, -0.5, -0.375, 0.0625},
			{-1.5, -0.5, 0.125, -0.5, 0.5, 0.145},

			{-0.625,	-0.5,	-0.0625,	 -0.5,	 0.5,	0.0625},
			{-1.5,		-0.5,	-0.0625,	-1.375,  0.5,	0.0625},

			{-1.5,		-0.5,	-0.0625,	-0.5,   -0.375, 0.0625},
			{-1.5,		-0.5,	 0,		-0.5,	 0.5,	0.02},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-1.5, -0.5, -0.0625, -0.5, 1.5, 0.1875}
		}
	},
after_place_node = afterplace,
after_destruct = afterdestruct,
on_rightclick = rightclick,
})
minetest.register_node(doord, {
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
			{-0.625, -0.5, 0.1875, -0.5, 0.5, 0.0625},
			{-1.5, -0.5, 0.1875, -1.375, 0.5, 0.0625},

			{-1.5, 0.5, 0.1875, -0.5, 0.375, 0.0625},
			{-1.5, -0.5, 0.125, -0.5, 0.5, 0.145},

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
minetest.register_node("my_sliding_doors:jpanel"..num, {
	description = des.." Panel",
	inventory_image = "myjdoors_panel"..num.."_inv.png",
	wield_image = "myjdoors_panel"..num.."_inv.png",
	tiles = {
		"myjdoors_door"..num.."a_edge.png",
		"myjdoors_door"..num.."a_edge.png",
		"myjdoors_door"..num.."a_edge.png",
		"myjdoors_door"..num.."a_edge.png",
		"myjdoors_door"..num.."a_bottom.png",
		"myjdoors_door"..num.."a_bottom.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	groups = {cracky = 3},
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, -0.0625, 0.5, 0.5, 0.0625},
			{-0.5, -0.5, -0.0625, -0.375, 0.5, 0.0625},
			{-0.5, -0.5, -0.0625, 0.5, -0.375, 0.0625},
			{-0.4375, -0.5, 0, 0.4375, 0.5, 0.02},
		}
	},
	selection_box = {type = "fixed",fixed = {{-0.5, -0.5, -0.0625, 0.5, 1.5, 0.0625}}},
	collision_box = {type = "fixed",fixed = {{-0.5, -0.5, -0.0625, 0.5, 1.5, 0.0625}}},

	on_place = function(itemstack, placer, pointed_thing)
	local p2 = minetest.dir_to_facedir(placer:get_look_dir())
	local pos = pointed_thing.above
	local na = minetest.get_node({x=pos.x,y=pos.y+1,z=pos.z})
	if na.name == "air" then
		minetest.set_node(pos,{name = "my_sliding_doors:jpanel"..num, param2 = p2})
		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z},{name = "my_sliding_doors:jpanel_top"..num, param2 = p2})
	else
		return
	end
	end,
	on_destruct = function(pos)
		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z},{name="air"})
	end,
})
minetest.register_node("my_sliding_doors:jpanel_top"..num, {
	tiles = {
		"myjdoors_door"..num.."a_edge.png",
		"myjdoors_door"..num.."a_edge.png",
		"myjdoors_door"..num.."a_edge.png",
		"myjdoors_door"..num.."a_edge.png",
		"myjdoors_door"..num.."a_top.png",
		"myjdoors_door"..num.."a_top.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	drop = "",
	groups = {cracky = 3},
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, -0.0625, 0.5, 0.5, 0.0625},
			{-0.5, -0.5, -0.0625, -0.375, 0.5, 0.0625},
			{-0.5, 0.5, -0.0625, 0.5, 0.375, 0.0625},
			{-0.4375, -0.5, 0, 0.4375, 0.5, 0.02},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{0, 0, 0, 0, 0, 0}
		}
	},
})
minetest.register_node("my_sliding_doors:jpanel_corner_"..num, {
	description = des.." Panel Corner",
	inventory_image = "myjdoors_panel"..num.."_corner_inv.png",
	wield_image = "myjdoors_panel"..num.."_corner_inv.png",
	tiles = {
		"myjdoors_door"..num.."a_edge.png",
		"myjdoors_door"..num.."a_edge.png",
		"myjdoors_door"..num.."a_bottom.png",
		"myjdoors_door"..num.."a_bottom.png",
		"myjdoors_door"..num.."a_bottom.png",
		"myjdoors_door"..num.."a_bottom.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	groups = {cracky = 3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.5, 0.0625001, 0.5, -0.375},
			{-0.5, -0.5, -0.0625, -0.375, 0.5, 0.0625},
			{-0.5, -0.5, -0.0625, 0.0624999, -0.375, 0.0625},
			{-0.5, -0.5, 0, 0, 0.5, 0.02},
			{-0.0625, -0.5, -0.5, 0.0625, -0.375, 0.0625},
			{0.02, -0.5, -0.5, 0, 0.5, 0},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.5, 0.0625, 1.5, 0},
			{-0.5, -0.5, -0.0625, 0, 1.5, 0.0625},
		}
	},
	on_place = function(itemstack, placer, pointed_thing)
	local p2 = minetest.dir_to_facedir(placer:get_look_dir())
	local pos = pointed_thing.above
	local na = minetest.get_node({x=pos.x,y=pos.y+1,z=pos.z})
	if na.name == "air" then
		minetest.set_node(pos,{name = "my_sliding_doors:jpanel_corner_"..num, param2 = p2})
		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z},{name = "my_sliding_doors:jpanel_corner_top"..num, param2 = p2})
	else
		return
	end
	end,
	on_destruct = function(pos)
		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z},{name="air"})
	end,
})
minetest.register_node("my_sliding_doors:jpanel_corner_top"..num, {
	tiles = {
		"myjdoors_door"..num.."a_edge.png",
		"myjdoors_door"..num.."a_edge.png",
		"myjdoors_door"..num.."a_top.png",
		"myjdoors_door"..num.."a_top.png",
		"myjdoors_door"..num.."a_top.png",
		"myjdoors_door"..num.."a_top.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	drop = "",
	groups = {cracky = 3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.5, 0.0625001, 0.5, -0.375},
			{-0.5, -0.5, -0.0625, -0.375, 0.5, 0.0625},
			{-0.5, 0.375, -0.0625, 0.0625, 0.5, 0.0625},
			{-0.5, -0.5, 0, 0, 0.5, 0.02},
			{-0.0625, 0.375, -0.5, 0.0625, 0.5, 0.0625},
			{0.02, -0.5, -0.5, 0, 0.5, 0},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{0, 0, 0, 0, 0, 0}
		}
	},
})
end
