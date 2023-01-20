@tool
class_name Tile
extends Node3D

@export
var normal_color: Color = Color("#eeedd5")

@export
var hover_color: Color = Color.GRAY

var material: Material


func _ready():
	var mesh: MeshInstance3D = $Mesh
	material = StandardMaterial3D.new()
	material.albedo_color = normal_color
	mesh.material_override = material


func _process(_delta):
	pass


func _on_area_3d_mouse_entered():
	for neighbor in get_neighbors():
		if neighbor is Tile:
			neighbor.material.albedo_color = normal_color.blend(hover_color)



func _on_area_3d_mouse_exited():
	for neighbor in get_neighbors():
		if neighbor is Tile:
			neighbor.material.albedo_color = normal_color


func _on_area_3d_input_event(_camera, _event, _position, _normal, _shape_idx):
	if _event is InputEventMouseButton:
		print_debug("HEllo")
	pass # Replace with function body.


func get_neighbors():
	var result = []

	var global_basis = global_transform.basis;
	for vector in [global_basis.x, -global_basis.x, global_basis.z, -global_basis.z]:
		var raycast_query = PhysicsRayQueryParameters3D.create(position, position + vector * 0.5)
		raycast_query.collide_with_areas = true
		var raycast_result = get_world_3d().direct_space_state.intersect_ray(raycast_query)
		if not raycast_result.is_empty():
			result.append(raycast_result.collider.get_node("../../"))
		
	return result;
