class_name SceneTrigger extends Area2D

@export var dest_scene: String

var in_area: bool

func _ready() -> void:
	set_process(false)

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		in_area = true
		set_process(true)

func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		in_area = false
		set_process(false)

func _process(delta: float) -> void:
	if Input.is_action_pressed("interact"):
		AphManager.change_scene(get_owner(), dest_scene)
