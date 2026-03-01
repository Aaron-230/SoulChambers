extends Area2D

@export_file("*.tscn") var next_scene_path: String

func _on_body_entered(body):
	if body.name == "Player":
		transition_to_next_level()

func transition_to_next_level():
	if next_scene_path == "":
		print("Warning: No next scene path set in the Inspector!")
		return
	print("Level Complete! Moving to: ", next_scene_path)
	get_tree().change_scene_to_file(next_scene_path)
