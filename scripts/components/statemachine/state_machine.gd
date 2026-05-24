@icon("res://assets/components/StateMachineNode.svg")
class_name StateMachine
extends Component

@export var current_state : State
var states : Dictionary[String, State]

func _ready() -> void:
	for child in self.get_children():
		if child is State:
			states[child.name] = child
			child.transition.connect(_on_child_transition)
		else:
			push_warning("State Machine Contains Incompatible Child Node: ", child)
	
	if current_state == null:
		current_state = self.get_child(0)
	current_state._enter(current_state)

func _on_child_transition(new_state_name : String) -> void:
	var new_state = states.get(new_state_name)
	if new_state == null:
		push_warning("State Does Not Exist: ", new_state_name)
		return
	if new_state != current_state:
		current_state._exit()
		new_state._enter(current_state)
		current_state = new_state

func _process(delta: float) -> void:
	current_state._update(delta)

func _physics_process(delta: float) -> void:
	current_state._physics_update(delta)
