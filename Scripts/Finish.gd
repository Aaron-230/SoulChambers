extends Area2D

@export_file("*.tscn") var target_level_path: String

# Use the exact names of your nodes here
@onready var music = $BackgroundMusic
@onready var anim = $CanvasLayer/AnimationPlayer

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		complete_level()

func complete_level():
	if target_level_path == "":
		return

	# 1. Create a Tween to fade the music volume to silent (-80)
	if music:
		var tween = create_tween()
		# Fades 'volume_db' from current to -80 over 1.0 seconds
		tween.tween_property(music, "volume_db", -80.0, 1.0)

	# 2. Play the visual transition
	if anim:
		anim.play("Fade")
		# Wait for the animation (which should also be ~1.0s)
		await anim.animation_finished

	# 3. Change Scene
	get_tree().change_scene_to_file(target_level_path)
