@icon("res://assets/components/save_component_node.svg")
class_name SaveComponent
extends Component

func _ready() -> void:
	pass

#----------------#
# Public Methods #
#----------------#

func create_save(category : String, value : String) -> void:
	pass

func update_save(category : String, value : String) -> void:
	pass

func get_save(category : String) -> String:
	return "N/A"

func does_save_exist(category : String) -> bool:
	return false
