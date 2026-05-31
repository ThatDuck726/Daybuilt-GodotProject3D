@icon("res://assets/components/save_component_node.svg")
class_name SaveComponent
extends Component

var values_dictionary : Dictionary[String, String]

func _ready() -> void:
	pass

func _read_files() -> void:
	pass

func _write_files() -> void:
	pass

#----------------#
# Public Methods #
#----------------#

func create_save(category : String, value : String) -> void:
	if does_save_exist(category):
		update_save(category, value)
	
	values_dictionary.set(category, value)

func update_save(category : String, value : String) -> void:
	if !does_save_exist(category): return
	values_dictionary.set(category, value)

func get_save(category : String) -> String:
	if !does_save_exist(category): return "N/A"
	return values_dictionary.get(category)

func does_save_exist(category : String) -> bool:
	return values_dictionary.has(category)
