extends TileModifier
class_name FireModifier


func _init():
	color_modifier = Color.red
	color_modifier.a = 0.7


func register_callback(_tile: Tile, _tile_grid):
	if _tile.get_node("ModifierHandler").has(WaterModifier):
		_tile.get_node("ModifierHandler").remove_modifiers(WaterModifier)
		_tile.get_node("ModifierHandler").unregister_modifier(self)

	yield(_tile.get_tree().create_timer(0.5), "timeout")
	_tile.get_node("ModifierHandler").unregister_modifier(self)


func get_damage():
	return 50
