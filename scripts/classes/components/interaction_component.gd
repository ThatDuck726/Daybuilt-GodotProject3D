class_name InteractionComponent
extends Component

@export var is_enabled : bool = true
@export var raycast : RayCast3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

#----------------#
# Public Methods #
#----------------#

# TODO Kind of a bad implementation, but game jam is coming up so I gotta go fast
func trigger_interaction() -> void:
	if !is_enabled:
		if debug: print("Interaction Disabled")
		return
		
	if raycast.is_colliding():
		var collider = raycast.get_collider()
		if debug: print("Got Collider: ", collider)
		
		if !collider:
			if debug: print("No Collider")
			return
		
		for child in collider.get_children():
			if child is InteractiveComponent:
				child.interact()
