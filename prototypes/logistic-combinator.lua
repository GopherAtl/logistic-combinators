data:extend( {
  {
    type = "item",
    name = "logistic-combinator",
    icon = "__logistic-combinators__/graphics/lcomb_icon.png",
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

    sprites =
    {
      north =
      {
        filename = "__logistic-combinators__/graphics/logistic-combinator.png",
        x = 158,
        width = 79,
        height = 63,
        frame_count = 1,
        shift = {0.140625, 0.140625}
      },
      east =
      {
        filename = "__logistic-combinators__/graphics/logistic-combinator.png",
        width = 79,
        height = 63,
        frame_count = 1,
        shift = {0.140625, 0.140625}
      },
      south =
      {
        filename = "__logistic-combinators__/graphics/logistic-combinator.png",
        x = 237,
        width = 79,
        height = 63,
        frame_count = 1,
        shift = {0.140625, 0.140625}
      },
      west =
      {
        filename = "__logistic-combinators__/graphics/logistic-combinator.png",
        x = 79,
        width = 79,
        height = 63,
        frame_count = 1,
        shift = {0.140625, 0.140625}
      }
    },
    
    activity_led_sprites =
    {
      north =
      {
        filename = "__base__/graphics/entity/combinator/activity-leds/combinator-led-constant-north.png",
        width = 11,
        height = 10,
        frame_count = 1,
        shift = {0.296875, -0.40625},
      },
      east =
      {
        filename = "__base__/graphics/entity/combinator/activity-leds/combinator-led-constant-east.png",
        width = 14,
        height = 12,
        frame_count = 1,
        shift = {0.25, -0.03125},
      },
      south =
      {
        filename = "__base__/graphics/entity/combinator/activity-leds/combinator-led-constant-south.png",
        width = 11,
        height = 11,
        frame_count = 1,
        shift = {-0.296875, -0.078125},
      },
      west =
      {
        filename = "__base__/graphics/entity/combinator/activity-leds/combinator-led-constant-west.png",
        width = 12,
        height = 12,
        frame_count = 1,
        shift = {-0.21875, -0.46875},
      }
    },

    activity_led_light =
    {
      intensity = 0.8,
      size = 1,
    },

    activity_led_light_offsets =
    {
      {0.296875, -0.40625},
      {0.25, -0.03125},
      {-0.296875, -0.078125},
      {-0.21875, -0.46875}
    },

    circuit_wire_connection_points =
    {
      {
        shadow =
        {
          red = {0.15625, -0.28125},
          green = {0.65625, -0.25}
        },
        wire =
        {
          red = {-0.28125, -0.5625},
          green = {0.21875, -0.5625},
        }
      },
      {
        shadow =
        {
          red = {0.75, -0.15625},
          green = {0.75, 0.25},
        },
        wire =
        {
          red = {0.46875, -0.5},
          green = {0.46875, -0.09375},
        }
      },
      {
        shadow =
        {
          red = {0.75, 0.5625},
          green = {0.21875, 0.5625}
        },
        wire =
        {
          red = {0.28125, 0.15625},
          green = {-0.21875, 0.15625}
        }
      },
      {
        shadow =
        {
          red = {-0.03125, 0.28125},
          green = {-0.03125, -0.125},
        },
        wire =
        {
          red = {-0.46875, 0},
          green = {-0.46875, -0.40625},
        }
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