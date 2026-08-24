extends State

@export var wander_state: State
@onready var area_of_vision = $"../../AreaOfVision"

func enter(previous_state: State) -> void:
	for child in parent.get_children():
		if child is Sprite2D:
			child.texture = parent.sprite_dead
	
	area_of_vision.visible = false
	area_of_vision.set_deferred("monitoring", false)
	parent.nav_agent.set_physics_process(false)
	parent.nav_agent.avoidance_enabled = false
