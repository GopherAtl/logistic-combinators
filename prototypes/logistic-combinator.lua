data:extend( {
  {
    type = "item",
    name = "logistic-combinator",
    icon = "__logistic-combinators__/graphics/logistic-combinator.png",
    flags = {"goes-to-quickbar"},
    subgroup = "circuit-network",
    place_result="logistic-combinator",
    order = "b[combinators]-d[logistic-combinator]",
    stack_size = 50,
  },
  {
    type = "recipe",
    name = "logistic-combinator",
    enabled = "false",
    ingredients =
    {
      {"copper-cable", 5},
      {"electronic-circuit",5},
      {"advanced-circuit", 1},
    },
    result="logistic-combinator",
  },
  {
    type = "constant-combinator",
    name = "logistic-combinator",
    icon = "__logistic-combinators__/graphics/logistic-combinator.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "logistic-combinator"},
    max_health = 50,
    corpse = "small-remnants",

    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},

    item_slot_count = 15,

    sprite =
    {
      filename = "__logistic-combinators__/graphics/logistic-combinator.png",
      width = 45,
      height = 40,
      shift = {0.15, 0},
    },
    circuit_wire_connection_point =
    {
      shadow =
      {
        red = {0.828125, 0.328125},
        green = {0.828125, -0.078125},
      },
      wire =
      {
        red = {0.515625, -0.078125},
        green = {0.515625, -0.484375},
      }
    },
    circuit_wire_max_distance = 7.5
  },

   {
     type = "inserter",
     name = "lcomb-hidden-inserter",
     icon = "__logistic-combinators__/graphics/nil.png",
     flags = {"placeable-neutral", "player-creation","not-on-map"},
     minable = {hardness = 0.2, mining_time = 0.5, result = "logistic-combinator"},
     max_health = 40,
     corpse = "small-remnants",
     order = "z[zebra]",
     resistances =
     {
       {
         type = "fire",
         percent = 90
       }
     },
     collision_box = {{-0, -0}, {0, 0}},
     selection_box = {{-0, -0}, {0, 0}},
     pickup_position = {0, -1},
     insert_position = {0, 1.2},
     energy_per_movement = 7000,
     energy_per_rotation = 7000,
     energy_source =
     {
       type = "burner",
       usage_priority = "secondary-input",
       drain = "0.0kW",
       effectivity=1,
       fuel_inventory_size=1,
     },
     extension_speed = 0.07,
     rotation_speed = 0.04,
     fast_replaceable_group = "inserter",
     filter_count = 5,
     hand_base_picture =
     {
       filename = "__logistic-combinators__/graphics/nil.png",
       priority = "extra-high",
       width = 1,
       height = 1
     },
     hand_closed_picture =
     {
       filename = "__logistic-combinators__/graphics/nil.png",
       priority = "extra-high",
       width = 1,
       height = 1
     },
     hand_open_picture =
     {
       filename = "__logistic-combinators__/graphics/nil.png",
       priority = "extra-high",
       width = 1,
       height = 1
     },
     hand_base_shadow =
     {
       filename = "__logistic-combinators__/graphics/nil.png",
       priority = "extra-high",
       width = 1,
       height = 1
     },
     hand_closed_shadow =
     {
       filename = "__logistic-combinators__/graphics/nil.png",
       priority = "extra-high",
       width = 1,
       height = 1
     },
     hand_open_shadow =
     {
       filename = "__logistic-combinators__/graphics/nil.png",
       priority = "extra-high",
       width = 1,
       height = 1
     },
     platform_picture =
     {
       sheet=
       {
         filename="__logistic-combinators__/graphics/nil.png",
         priority = "extra-high",
         width = 1,
         height = 1
       }
     },
     programmable = true,
     rotation_speed = 0.035,
     uses_arm_movement = "basic-inserter",

     circuit_wire_connection_point =
     {
       shadow =
       {
         red = {0, 0},
         green = {0, 0}
       },
       wire =
       {
         red = {0, 0},
         green = {0, 0}
       }
     },
     circuit_wire_max_distance = 7.5,
     uses_arm_movement = "basic-inserter"
  },

})

table.insert(data.raw["technology"]["logistic-robotics"].effects,{type="unlock-recipe",recipe="logistic-combinator"})