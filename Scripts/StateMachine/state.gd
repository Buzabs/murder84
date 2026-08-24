class_name State
extends Node

var parent: CharacterBody2D
var state_machine: StateMachine

func enter(previous_state: State) -> void:
	pass
	
func exit() -> void:
	pass
	
func process(delta: float) -> void:
	pass
	
func physics_process(delta: float) -> void:
	pass
