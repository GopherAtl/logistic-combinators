require "config"

local mod_version="0.1.3"

local lcombs={}

---[[
local function print(...)
  return game.player.print(...)
end
--]]

--swap comment to toggle debug prints
--local function debug() end
local debug = print


local function deduceSignalValue(entity,signal,condNum)
  local t=2^31
  local v=0
  condNum=condNum or 1
  local condition=entity.get_circuit_condition(condNum)

  condition.condition.first_signal=signal
  condition.condition.comparator="<"
  while t~=1 do
    condition.condition.constant=v
    entity.set_circuit_condition(condNum,condition)
    t=t/2
    if entity.get_circuit_condition(condNum).fulfilled==true then
      v=v-t
    else
      v=v+t
    end
  end
  condition.condition.constant=v
  entity.set_circuit_condition(condNum,condition)
  if entity.get_circuit_condition(condNum).fulfilled then
    v=v-1
  end
  return v
end

local function onLoad()
  if global["gophers-test"]==nil or global["gophers-test"].version ~= mod_version then
    for _,force in pairs(game.forces) do
      force.reset_recipes()
      force.reset_technologies()

      local techs=force.technologies
      local recipes=force.recipes
      if techs["logistic-robotics"].researched then
        recipes["logistic-combinator"].enabled=true
      end
    end
  end
end


local function onTick(event)
  if event.tick%12==7 then
    for i=1,#lcombs do
      local lc=lcombs[i]
      local params=lc.comb.get_circuit_condition(1).parameters
      for i=1,15 do
        if params[i].signal.name then
          --it's set to something, so deduce it
          local c=deduceSignalValue(lc.inserter,params[i].signal,2)
          if c~=params[i].count then
            params[i].count=c
          end
        end
      end
      lc.comb.set_circuit_condition(1,{parameters=params})
    end
  end

end

local function onPlaceEntity(event)
  local entity=event.created_entity
  if entity.name=="logistic-combinator" then
    local inserter=entity.surface.create_entity{
        name="lcomb-hidden-inserter",
        position=entity.position,
        force=entity.force,
      }

    lcombs[#lcombs+1]={comb=entity, inserter=inserter}
  end

end

local function onRemoveEntity(entity)

end

game.on_init(onLoad)
game.on_load(onLoad)

game.on_event(defines.events.on_built_entity,onPlaceEntity)
game.on_event(defines.events.on_robot_built_entity,onPlaceEntity)

game.on_event(defines.events.on_preplayer_mined_item, function(event) onRemoveEntity(event.entity) end)
game.on_event(defines.events.on_robot_pre_mined, function(event) onRemoveEntity(event.entity) end)
game.on_event(defines.events.on_entity_died, function(event) onRemoveEntity(event.entity) end)

game.on_event(defines.events.on_tick,onTick)