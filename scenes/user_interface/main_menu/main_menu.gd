extends MarginContainer

@export var dev_world : PackedScene
var current_container : VBoxContainer

func _ready() -> void:
	for child in %MainContainer.get_children():
		if child is Button:
			child.pressed.connect(_on_button_pressed.bind(child.name))
	set_container(%MainContainer)

func set_container(new_container : VBoxContainer) -> void:
	for child in %MarginContainer.get_children():
		child.hide()
	new_container.show()

func _on_button_pressed(button_name : String) -> void:
	match button_name:
		"PlayButton":
			pass
		"DevButton":
			if dev_world: get_tree().change_scene_to_packed(dev_world)
		"QuitButton":
			get_tree().quit()
