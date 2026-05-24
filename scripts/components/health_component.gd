class_name HealthComponent
extends Component

@export var current_health : float = 100.0
@export var maximum_health : float = 100.0

@export var is_dead : bool = false

signal health_changed(new_health : float)
signal died

func change_current_health(amount : float) -> void:
	if is_dead: return
	
	current_health += amount
	if current_health < 0.0:
		set_current_health(0)
		return
	health_changed.emit(current_health)
	
	if current_health == 0.0:
		died.emit()

func set_current_health(new_health : float) -> void:
	if is_dead: return
	current_health = new_health
	if current_health < 0.0:
		set_current_health(0)
		return
	health_changed.emit(current_health)
	
	if current_health == 0.0:
		died.emit()

func _ready() -> void:
	died.connect(_on_died)

func _on_died() -> void:
	is_dead = true
	current_health = 0.0
