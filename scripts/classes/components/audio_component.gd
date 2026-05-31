@icon("res://assets/components/AudioComponentNode.svg")
class_name AudioComponent
extends Component

signal audio_started

func destroy_audio_player(audio_player : Node) -> void:
	audio_player.stop()
	audio_player.queue_free()

#----------------#
# Public Methods #
#----------------#

func play_audio(stream : AudioStream, volume_linear : float = 100) -> void:
	var player := AudioStreamPlayer.new()
	player.stream = stream
	player.volume_db = linear_to_db(volume_linear)
	
	player.connect("finished", destroy_audio_player.bind(player))
	add_child(player)
	player.play()

func play_audio3d(stream : AudioStream, volume_linear : float = 100, unit_size : float = 10.0, bus : StringName = "Master") -> void:
	var player := AudioStreamPlayer3D.new()
	player.stream = stream
	player.volume_db = linear_to_db(volume_linear)
	player.unit_size = unit_size
	player.bus = bus
	
	player.connect("finished", destroy_audio_player.bind(player))
	add_child(player)
	player.play()
