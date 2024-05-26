extends Node

@export var sound : AudioStream

@export var audio_player : AudioStreamPlayer3D

# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().on_hit.connect(play_sound)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func play_sound():
	#audio_player.stream = sound
	if audio_player.get_stream_playback() is AudioStreamPlaybackPolyphonic:
		audio_player.get_stream_playback().play_stream(sound)

