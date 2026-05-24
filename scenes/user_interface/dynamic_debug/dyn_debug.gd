extends Container

@export var debug : bool = false
var contents_dictionary : Dictionary[String, String]

signal category_created(category_name)
signal category_deleted(category_name)
signal value_updated(new_value)

func create_category(name : String, value : String, horizontal : bool = true) -> void:
	if does_category_exist(name, false):
		push_warning("Category Already Exists: ", name)
		return
	
	contents_dictionary.set(name, value)
	
	# Create Category Name & Value Labels, will be children of another container
	var name_label := Label.new()
	name_label.text = name
	var value_label := Label.new()
	value_label.text = value
	
	if horizontal:
		var hbox := HBoxContainer.new()
		hbox.name = (name + "Container")
		
		hbox.add_child(name_label)
		hbox.add_child(value_label)
	else:
		var vbox := VBoxContainer.new()
		vbox.name = (name + "Container")
		
		vbox.add_child(name_label)
		vbox.add_child(value_label)

func update_value(category : String, new_value : String) -> void:
	if !does_category_exist(category, true): return
	contents_dictionary.set(category, new_value)
	value_updated.emit(new_value)

func get_value(category : String) -> String:
	if !does_category_exist(category, true): return "N/A"
	return contents_dictionary.get(category)

func does_category_exist(category : String, verbose : bool) -> bool:
	if contents_dictionary.has(category):
		if debug: print("Found Category: ", category)
		return true
	else:
		if verbose or debug: push_warning("Category Doesn't Exist: ", category)
		return false

func delete_category(category : String) -> void:
	if !does_category_exist(category, true): return
	contents_dictionary.erase(category)
	
	category_deleted.emit(category)

func _ready() -> void:
	if Global.dyn_debug != null:
		push_warning("DynDebug Already in Use")
		return
	Global.dyn_debug = self
