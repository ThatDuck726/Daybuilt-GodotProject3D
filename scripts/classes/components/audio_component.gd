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

func play_audio(stream : AudioStream) -> void:
	var player := AudioStreamPlayer.new()
	player.stream = stream
	player.connect("finished", destroy_audio_player.bind(player))
	add_child(player)
	player.play()

func play_audio3d(stream : AudioStream) -> void:
	var player := AudioStreamPlayer3D.new()
	player.stream = stream
	player.connect("finished", destroy_audio_player.bind(player))
	add_child(player)
	player.play()
