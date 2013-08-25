local helper = wesnoth.require "lua/helper.lua"

wml_actions = wesnoth.wml_actions


function wesnoth.wml_actions.get_unit_defense(cfg)
	local filter = wesnoth.get_units(cfg)
	local variable = cfg.variable or "defense"

	for index, unit in ipairs(filter) do
		local terrain = wesnoth.get_terrain ( unit.x, unit.y )
		-- it is WML defense: the lower, the better. Converted to normal defense with 100 -
		local defense = 100 - wesnoth.unit_defense ( unit, terrain )
		wesnoth.set_variable ( string.format ( "%s[%d]", variable, index - 1 ), { id = unit.id, x = unit.x, y = unit.y, terrain = terrain, defense = defense } )
	end
end

