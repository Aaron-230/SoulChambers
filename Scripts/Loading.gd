extends Node2D

@export_file("*.tscn") var target_level_path: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	pass


func _on_video_stream_player_finished() -> void:
	get_tree().change_scene_to_file(target_level_path)
