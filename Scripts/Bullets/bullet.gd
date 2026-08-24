class_name Bullet
extends Node2D

@onready var particle_scene = preload("res://Particles/gpu_particles_2d.tscn")
@export var speed: int
@export var lifespan: int

func _ready() -> void:
	rotation = randf_range(-1,1)

func _process(delta: float) -> void:
	position += Vector2.RIGHT.rotated(rotation) * speed
	lifespan -= 1
	if lifespan <= 0:
		var particles = particle_scene.instantiate() as GPUParticles2D
		particles.global_position = global_position
		get_tree().current_scene.add_child(particles)
		queue_free()
