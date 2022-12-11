extends Tower
var modifier: TileModifier = FireModifier.new()


func _ready():
	tiles_in_range_array = tile_grid.get_tiles_in_radius_manhatan(get_parent().grid_location, 1)


func think():
	for tile in tiles_in_range_array:
		if not tile is PathTile:
			continue
		if tile.enemies.empty():
			continue

		animate();
		tile.get_node("ModifierHandler").register_modifier(modifier)
		return
