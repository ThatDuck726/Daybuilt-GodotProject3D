extends State

func _enter(previous_state : State) -> void:
	super._enter(previous_state)

func _exit() -> void:
	pass

func _update(delta : float) -> void:
	pass

func _physics_update(delta : float) -> void:
	if !target.is_on_floor():
		transition.emit("JumpMovementState")
		return
	if target.velocity:
		transition.emit("WalkMovementState")
		return
