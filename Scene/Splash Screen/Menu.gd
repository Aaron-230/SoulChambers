extends Control

@export_file("*.tscn") var target_level_path: String

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_exit_pressed() -> void:
	print("Exiting.... ")
	get_tree().quit()

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file(target_level_path)
