extends State

@export var wander_state: State

func enter(previous_state: State) -> void:
	for child in parent.get_children():
		if child is Sprite2D:
			child.texture = parent.sprite_dead
	
	
