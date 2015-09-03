local doorcolors = {"white","red","black","brown","grey","dark_grey","yellow"}
for i = 1,#doorcolors do
local col = doorcolors[i]

minetest.register_node("my_saloon_doors:door1a_"..col, {
	description = "Door 1a",
	tiles = {
		"mydoors_"..col.."_wood.png",
		"mydoors_"..col.."_wood.png",
		"mydoors_"..col.."_wood.png",
		"mydoors_"..col.."_wood.png",
		"mydoors_"..col.."_wood.png",
		"mydoors_"..col.."_wood.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky = 3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.1875, -0.0625, 0, 0.75, 0.0625},
			{-0.5, 0.75, -0.0625, -0.0625, 0.8125, 0.0625},
			{-0.5, 0.8125, -0.0625, -0.125, 0.875, 0.0625},
			{-0.5, 0.875, -0.0625, -0.1875, 0.9375, 0.0625},
			{-0.5, 0.9375, -0.0625, -0.3125, 1, 0.0625},
			{-0, -0.1875, -0.0625, 0.5, 0.75, 0.0625},
			{0.0625, 0.75, -0.0625, 0.5, 0.8125, 0.0625},
			{0.125, 0.8125, -0.0625, 0.5, 0.875, 0.0625},
			{0.1875, 0.875, -0.0625, 0.5, 0.9375, 0.0625},
			{0.3125, 0.9375, -0.0625, 0.5, 1, 0.0625},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.1875, -0.0625, 0.5, 1, 0.0625},
--			{-0.5, 0.75, -0.0625, -0.0625, 0.8125, 0.0625},
--			{-0.5, 0.8125, -0.0625, -0.125, 0.875, 0.0625},
--			{-0.5, 0.875, -0.0625, -0.1875, 0.9375, 0.0625},
--			{-0.5, 0.9375, -0.0625, -0.3125, 1, 0.0625},
--			{-0, -0.1875, -0.0625, 0.5, 0.75, 0.0625},
--			{0.0625, 0.75, -0.0625, 0.5, 0.8125, 0.0625},
--			{0.125, 0.8125, -0.0625, 0.5, 0.875, 0.0625},
--			{0.1875, 0.875, -0.0625, 0.5, 0.9375, 0.0625},
--			{0.3125, 0.9375, -0.0625, 0.5, 1, 0.0625},
		}
	},

on_place = function(itemstack, placer, pointed_thing)
	local pos1 = pointed_thing.above
	local pos2 = {x=pos1.x, y=pos1.y, z=pos1.z}
	      pos2.y = pos2.y+1
	if
	not minetest.registered_nodes[minetest.get_node(pos1).name].buildable_to or
	not minetest.registered_nodes[minetest.get_node(pos2).name].buildable_to or
	not placer or
	not placer:is_player() then
	return 
	end
        return minetest.item_place(itemstack, placer, pointed_thing)
end,
on_rightclick = function(pos, node, player, itemstack, pointed_thing)

	local timer = minetest.get_node_timer(pos)
	local par1 = node.param2
	local par2 = minetest.dir_to_facedir(player:get_look_dir())
		if par1 + par2 == 1 or
		   par1 + par2 == 3 or
		   par1 + par2 == 5 then
			par2 = par1
		end
	if node.name == "my_saloon_doors:door1a_"..col then
	   minetest.set_node(pos,{name="my_saloon_doors:door1b_"..col,param2=par2})
	   timer:start(3)
	end
end,
})
minetest.register_node("my_saloon_doors:door1b_"..col, {
	tiles = {
		"mydoors_"..col.."_wood.png",
		"mydoors_"..col.."_wood.png",
		"mydoors_"..col.."_wood.png",
		"mydoors_"..col.."_wood.png",
		"mydoors_"..col.."_wood.png",
		"mydoors_"..col.."_wood.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.1875, -0.0625, -0.375, 0.75, 0.5},
			{-0.5, 0.75, -0.0625, -0.375, 0.8125, 0.4375},
			{-0.5, 0.8125, -0.0625, -0.375, 0.875, 0.375},
			{-0.5, 0.875, -0.0625, -0.375, 0.9375, 0.3125},
			{-0.5, 0.9375, -0.0625, -0.375, 1, 0.1875},
			{0.375, -0.1875, -0.0625, 0.5, 0.75, 0.5},
			{0.375, 0.75, -0.0625, 0.5, 0.8125, 0.4375},
			{0.375, 0.8125, -0.0625, 0.5, 0.875, 0.375},
			{0.375, 0.875, -0.0625, 0.5, 0.9375, 0.3125},
			{0.375, 0.9375, -0.0625, 0.5, 1, 0.1875},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{0, 0, 0, 0, 0, 0},
		}
	},

on_timer = function(pos, elapsed)
	local node = minetest.get_node(pos)
	   minetest.set_node(pos,{name="my_saloon_doors:door1a_"..col,param2=node.param2})
--	   minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z},{name="my_saloon_doors:door1b_"..col,param2=node.param2})
end,
})

end
