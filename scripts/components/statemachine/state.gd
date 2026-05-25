@icon("res://assets/components/StateNode.svg")
class_name State
extends Component

var state_machine : StateMachine
#var player : PlayerCharacter

signal transition(new_state_name : String)

func _enter(previous_state : State) -> void:
	target = state_machine.target

func _exit() -> void:
	pass

func _update(delta : float) -> void:
	pass

func _physics_update(delta : float) -> void:
	pass
