require "config"

local mod_version="0.1.3"

local lcombs={}

logistic_polling_rate=math.min(logistic_polling_rate,60)

local polling_cycles = math.floor(60/logistic_polling_rate)

---[[
local function print(...)
  return game.player.print(...)
end
--]]

--swap comment to toggle debug prints
--local function debug() end
local debug = print

local function onLoad()
  if global.logistic_combinators==nil or global.logistic_combinators.version ~= mod_version then
    --unlock if needed
    for _,force in pairs(game.forces) do
      force.reset_recipes()
      force.reset_technologies()

      local techs=force.technologies
      local recipes=force.recipes
      if techs["logistic-robotics"].researched then
        recipes["logistic-combinator"].enabled=true
      end
    end

    global.logistic_combinators={lcombs={},version=mod_version}

  end

  lcombs=global.logistic_combinators.lcombs
end

local function onSave()
  global.logistic_combinators={lcombs=lcombs, version=mod_version}
end


local function onTick(event)
  if event.tick%polling_cycles == polling_cycles-1 then
    local toRemove = {}
    for i,lc in pairs(lcombs) do
      local lc=lcombs[i]
      if lc.comb.valid then
        local logisticsNetwork = lc.comb.surface.find_logistic_network_by_position(lc.comb.position, lc.comb.force.name)
        local params=lc.comb.get_circuit_condition(1).parameters
        for i=1,15 do
          if params[i].signal.name and params[i].signal.type=="item" then
            local c = logisticsNetwork and logisticsNetwork.get_item_count(params[i].signal.name) or 0
            if c~=params[i].count then
              params[i].count=c
            end
          elseif params[i].count~=0 then
            params[i].count=0
          end
        end
        lc.comb.set_circuit_condition(1,{parameters=params})
      else
        table.insert(toRemove, i)
      end
    end
    for _, k in pairs(toRemove) do
      table.remove(lcombs, k)
    end
  end

end

local function onPlaceEntity(event)
  local entity=event.created_entity
  if entity.name=="logistic-combinator" then
    table.insert(lcombs,{comb=entity})
  end
end

local function onRemoveEntity(entity)
  local r = false
  for k,v in pairs(lcombs) do
    if v.comb==entity then
      if v.inserter and v.inserter.valid then
        v.inserter.clear_items_inside()
        v.inserter.destroy()
      end
      r = k
      break
    end
  end
  if r then
    table.remove(lcombs, r)
  end
end

game.on_init(onLoad)
game.on_load(onLoad)

game.on_save(onSave)

game.on_event(defines.events.on_built_entity,onPlaceEntity)
game.on_event(defines.events.on_robot_built_entity,onPlaceEntity)

game.on_event(defines.events.on_preplayer_mined_item, function(event) onRemoveEntity(event.entity) end)
game.on_event(defines.events.on_robot_pre_mined, function(event) onRemoveEntity(event.entity) end)
game.on_event(defines.events.on_entity_died, function(event) onRemoveEntity(event.entity) end)

game.on_event(defines.events.on_tick,onTick)
