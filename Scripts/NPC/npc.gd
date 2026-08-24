class_name Npc
extends CharacterBody2D

@export var actions: Dictionary[Marker2D, float]= {}
@export var sprite_dead: Texture

@export var nav_agent: NavigationAgent2D

@export var npc_name: String

func _ready() -> void:
	nav_agent.avoidance_enabled = true
	nav_agent.velocity_computed.connect(_on_velocity_computed)

func _on_velocity_computed(safe_velocity: Vector2) -> void:
	velocity = safe_velocity
	move_and_slide()
	

func _on_area_of_vision_body_entered(body: Node2D) -> void:
	print("Uh oh! Stop doing naughty stuff!")
