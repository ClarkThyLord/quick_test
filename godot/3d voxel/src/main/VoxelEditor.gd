extends GridMap

export (int) var raycast_length = 100

func _ready():
	pass

func _process(delta):
	if Input.is_action_pressed("left_m"):
		var from = get_viewport().get_camera().project_ray_origin(get_viewport().get_mouse_position())
		var to = from + get_viewport().get_camera().project_ray_normal(get_viewport().get_mouse_position()) * raycast_length
		
		var space_state = get_world().get_direct_space_state()
		var result = space_state.intersect_ray(from, to, [get_viewport().get_camera()])
		
		print(result)
		
		if result.has('position'):
			var position = world_to_map(result.position)
			
			print(position)
			
			set_cell_item(position.x, position.y, position.z, 0)
