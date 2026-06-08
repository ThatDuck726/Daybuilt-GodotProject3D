class_name InteractiveComponent
extends Component

# TODO Redo this, not very good

@export var interactive_callable : Callable

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

#----------------#
# Public Methods #
#----------------#

func trigger_interactive() -> void:
	interactive_callable.call()
