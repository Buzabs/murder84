class_name WanderState
extends State

var speed = 200
var current_target: Vector2
var wandering_started := false

func enter(previous_state: State) -> void:
	current_target = parent.global_position
	if not wandering_started:
		wandering_started = true
		_wander_loop()

func _wander_loop() -> void:
	while true:
		for marker in parent.actions:
				current_target = marker.position
				await get_tree().create_timer(parent.actions[marker]).timeout
				

func physics_process(delta: float) -> void:
	move_towards(current_target)
	


func move_towards(target_position):
	if parent.global_position.distance_to(target_position) > 4.0:
		var direction = parent.global_position.direction_to(target_position)
		parent.velocity = direction * speed
	else:
		parent.velocity = Vector2.ZERO	

	parent.move_and_slide()
