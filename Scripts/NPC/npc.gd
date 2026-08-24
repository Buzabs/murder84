class_name Npc
extends CharacterBody2D

@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D
@onready var sprite: Sprite2D = $Sprite

@export var actions: Dictionary[Marker2D, float]= {}
@export var sprite_dead: Texture
@export var sprite_texture: Texture
@export var npc_name: String

var seen_player: bool = false

func _ready() -> void:
	sprite.texture = sprite_texture
	
	nav_agent.avoidance_enabled = true
	nav_agent.velocity_computed.connect(_on_velocity_computed)
	

func _on_velocity_computed(safe_velocity: Vector2) -> void:
	velocity = safe_velocity
	move_and_slide()
	

func _on_area_of_vision_body_entered(body: Node2D) -> void:
	var player = body as Player
	if player:
		if player.held_item_data != null:
			if player.held_item_data.is_suspicious == true:
				print("SUS!!!!")
		
