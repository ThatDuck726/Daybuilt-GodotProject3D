@icon("res://assets/components/DungeonComponent3d.svg")
class_name DungeonComponent3D
extends Component3D
## A brief description of the class's role and functionality.
##
## The description of the script, what it can do,
## and any further detail.
##
## @experimental

@export var generate_on_start : bool = true
@export_range(0, 128) var maximum_room_count : int = 5

@export_category("Room Arrays")
@export var content_rooms : Array[Node]
@export var hall_rooms : Array[Node]
@export var arena_rooms : Array[Node]

var current_room_count : int = 0
var current_rooms : Array[Node]

func _ready() -> void:
	if generate_on_start:
		pass

func generate_rooms() -> void:
	for i in range(current_room_count, maximum_room_count):
		pass

func add_room() -> void:
	pass

func del_room() -> void:
	pass
