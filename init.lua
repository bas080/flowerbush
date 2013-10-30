local flowers_list = {
	{ "Rose",		"rose"},
	{ "Tulip",		"tulip"},
	{ "Yellow Dandelion",	"dandelion_yellow"},
	{ "White Dandelion",	"dandelion_white"},
	{ "Blue Geranium",	"geranium"},
	{ "Viola",		"viola"},
	{ "Cotton Plant",	"cotton"},
}

for i in ipairs(flowers_list) do
  local flowerdesc = flowers_list[i][1]
  local flower     = flowers_list[i][2]
  minetest.register_node("flowerbush:flower_"..flower, {
    description = flowerdesc.." bush",
    drawtype = "plantlike",
    tiles = { "flowerbush_"..flower..".png" },
    inventory_image = "flowerbush_"..flower..".png",
    wield_image = "flowerbush_"..flower..".png",
    sunlight_propagates = true,
    paramtype = "light",
    walkable = false,
    groups = { snappy = 3,flammable=2, flower=1 },
    sounds = default.node_sound_leaves_defaults(),
    selection_box = {
      type = "fixed",
      fixed = { -0.15, -0.5, -0.15, 0.15, 0.2, 0.15 },
    },
  })
  --print('"flowers:flower_'..flower..'",')
end

minetest.register_abm({
  nodenames = {"flowers:flower_rose","flowers:flower_tulip","flowers:flower_dandelion_yellow","flowers:flower_dandelion_white","flowers:flower_viola"},
  interval = 500,
  chance = 4,
  action = function(pos, node, active_object_count, active_object_count_wider)
    local flower = string.sub( tostring(node.name), 9)
    minetest.set_node(pos,{name="flowerbush:"..flower})
  end
})


