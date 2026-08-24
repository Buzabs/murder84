extends State

@export var walk_state: State

func enter(previous_state: State) -> void:
	parent.velocity = Vector2.ZERO
	
func physics_process(delta: float) -> void:
	var direction := Input.get_vector("Left", "Right", "Up", "Down")
	if direction != Vector2.ZERO:
		state_machine.transition_to(walk_state)
		return
	
