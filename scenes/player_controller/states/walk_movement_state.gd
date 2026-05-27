extends State

@export_category("Player Movement")
@export var speed : float = 8
@export var acceleration : float = .5
@export var deceleration : float = .8

func _enter(previous_state : State) -> void:
	super._enter(previous_state)

func _exit() -> void:
	pass

func _update(delta : float) -> void:
	target.update_gravity(delta)
	target.update_input(speed, acceleration, deceleration)
	target.update_velocity()

func _physics_update(delta : float) -> void:
	if !target.velocity:
		transition.emit("IdleMovementState")
		return
