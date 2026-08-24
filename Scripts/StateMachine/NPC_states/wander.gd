class_name WanderState
extends State

@export var dead_state: State

var speed = 50
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
		parent.nav_agent.target_position = target_position
		var next = parent.nav_agent.get_next_path_position()
		var direction = parent.global_position.direction_to(next)
		parent.nav_agent.velocity = direction * speed
	else:
		parent.nav_agent.velocity = Vector2.ZERO	

	parent.move_and_slide()


func _on_attack_detection_body_entered(body: Node2D) -> void:
	if body is Bullet:
		state_machine.transition_to(dead_state)


func _on_attack_detection_area_entered(area: Area2D) -> void:
	if area.get_parent() is Bullet:
		state_machine.transition_to(dead_state)
