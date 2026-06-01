@icon("res://assets/components/brick_wall.svg")
class_name DungeonComponent
extends Component3D

@export var generate_on_start : bool = true
@export_range(0, 128) var maximum_room_count : int = 5

@export_category("Room Arrays")
@export var content_rooms : Array[Node]
@export var hall_rooms : Array[Node]
@export var arena_rooms : Array[Node]

var current_room_count : int = 0

func _ready() -> void:
	if generate_on_start:
		pass
