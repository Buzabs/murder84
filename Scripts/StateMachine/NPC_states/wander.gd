extends State


var speed = 200


# Called every frame. 'delta' is the elapsed time since the previous frame.
func physics_process(delta: float) -> void:
	while(true):
		for target in parent.targets:
			if target is Marker2D:
				await get_tree().create_timer(10.0).timeout
				move_towards(target.position)
	


func move_towards(target_position):
	if parent.global_position.distance_to(target_position) > 4.0:
		var direction = parent.global_position.direction_to(target_position)
		
		parent.velocity = direction * speed
	else:
		parent.velocity = Vector2.ZERO	

	parent.move_and_slide()
