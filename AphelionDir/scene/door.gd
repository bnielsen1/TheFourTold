extends Area2D

@export var dest_scene: PackedScene

var in_area: bool

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		print("you're in")
		in_area = true

func _process(delta: float) -> void:
	if in_area == true && Input.is_action_pressed("interact"):
		print("yesy")
		get_tree().change_scene_to_packed(dest_scene)

func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		print("you're out")
		in_area = false
