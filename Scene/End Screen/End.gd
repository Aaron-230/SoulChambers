extends Control

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_exit_pressed() -> void:
	print("Exiting.... ")
	get_tree().quit()
