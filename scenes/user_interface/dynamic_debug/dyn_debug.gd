extends Container

@export var debug : bool = false
var contents_dictionary : Dictionary[String, String]

signal category_created(category_name)
signal category_deleted(category_name)
signal value_updated(new_value)

func create_category(name : String, value : String) -> void:
	if does_category_exist(name, false):
		printerr("Category Already Exists: ", name)
		return
	
	contents_dictionary.set(name, value)
	
	var hbox := HBoxContainer.new()
	hbox.name = (name + "Container")
	var name_label := Label.new()
	name_label.text = name
	var value_label := Label.new()
	value_label.text = value
	
	hbox.add_child(name_label)
	hbox.add_child(value_label)

func update_value(category : String, new_value : String) -> void:
	if !does_category_exist(category, true): return
	contents_dictionary.set(category, new_value)
	value_updated.emit(new_value)

func does_category_exist(category : String, verbose : bool) -> bool:
	if contents_dictionary.has(category):
		if debug: print("Found Category: ", category)
		return true
	else:
		if verbose or debug: printerr("Category Doesn't Exist: ", category)
		return false

func get_value(category : String) -> String:
	if !does_category_exist(category, true):
		return "N/A"
	return "N/A"

func delete_category(category : String) -> void:
	if !does_category_exist(category, true):
		return

func _ready() -> void:
	pass
