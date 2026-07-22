class_name SceneTrigger extends Area2D

@export var dest_scene: String

var in_area: bool

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		in_area = true
