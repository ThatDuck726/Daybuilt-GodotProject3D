class_name HealthComponent
extends Component

@export var current_health : float = 100
@export var maximum_health : float = 100

signal health_changed
signal died

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
