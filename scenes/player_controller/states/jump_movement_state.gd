extends State

@export var speed : float = 8
@export var acceleration : float = .5
@export var deceleration : float = .8

@export var jump_velocity : float = 4.5

func _enter(previous_state : State) -> void:
	super._enter(previous_state)
	target.velocity.y += jump_velocity

func _exit() -> void:
	pass

func _update(delta : float) -> void:
	target.update_gravity(delta)
	target.update_input(speed, acceleration, deceleration)
	target.update_velocity()

func _physics_update(delta : float) -> void:
	if target.is_on_floor():
		transition.emit("IdleMovementState")
		return
