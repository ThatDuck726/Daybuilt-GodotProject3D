class_name ResourceComponent
extends Component

@export_category("Resource Init")
@export var resource_name : String = "Resource"
@export var maximum_resource_quantity : float = 100.0

@export_category("Passive Regeneration")
@export var does_passive_regen : bool = false
@export var does_passive_regen_cooldown : bool = false
@export var passive_regen_rate : float
@export var passive_regen_cooldown : float

signal current_resource_quantity_changed(old_quantity : float, new_quantity : float)
signal maximum_resource_quantity_changed(old_quantity : float, new_quantity : float)

signal current_resource_quantity_depleted

var _current_resource_quantity : float
var _regen_timer : float = 0.0

func _ready() -> void:
	_current_resource_quantity = maximum_resource_quantity

func _process(delta: float) -> void:
	if !does_passive_regen: return
	
	if _regen_timer > 0.0:
		_regen_timer -= delta
		return
	
	var _previous_resource_quantity := _current_resource_quantity
	_current_resource_quantity = minf(_current_resource_quantity + passive_regen_rate * delta, maximum_resource_quantity)

#
# Public Methods
#

func change_resource_quantity(_quantity : float) -> void:
	pass

func change_resource_maximum_quantity(_quantity : float) -> void:
	pass

func set_current_resource_quantity(_new_quantity : float) -> void:
	if _new_quantity < 0.0: set_current_resource_quantity(0.0)

func get_current_resource_quantity() -> float:
	return _current_resource_quantity

func get_maximum_resource_quantity() -> float:
	return maximum_resource_quantity
