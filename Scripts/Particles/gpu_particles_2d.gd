extends GPUParticles2D

func _ready() -> void:
	lifetime = randf_range(0, 2)
	emitting = true
	finished.connect(queue_free)
