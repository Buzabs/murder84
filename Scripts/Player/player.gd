class_name Player
extends CharacterBody2D

@export var speed = 400

@export var hand: Marker2D 

var held_item_data: ItemData = null
var held_item_node: Node2D = null

func get_input():
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = input_direction * speed

func _physics_process(_delta):
	get_input()
	move_and_slide()

func add_to_inventory(item: ItemData) -> void:
	if held_item_node:
		held_item_node.queue_free()
		
	held_item_data = item
	
	if item.item_scene:
		var new_item = item.item_scene.instantiate()
		hand.add_child(new_item)
		held_item_node = new_item
