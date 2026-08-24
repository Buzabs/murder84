extends State

@export var idle_state: State

@export var speed = 200

func get_input():
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	parent.velocity = input_direction * speed

func physics_process(_delta):
	get_input()
	parent.move_and_slide()
