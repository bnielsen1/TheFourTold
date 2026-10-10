class_name SceneManager extends Node

signal load_finished
var player: Player
var scene_dir_path: String = "res://AphelionDir/scene/"
var full_path: String
var from_scene
var loading_screen: PackedScene = preload("uid://co2a1xa5d2mwu")
var loaded_scene: PackedScene
var dest_scene_name: String

func _ready() -> void:
	set_process(false)
	if not player:
		player = preload("res://AphelionDir/scene/player.tscn").instantiate()
		get_tree().current_scene.add_child(player)

func change_scene(from, dest_name: String) -> void:
	dest_scene_name = dest_name
	full_path = scene_dir_path + dest_scene_name + ".tscn"
	from_scene = from
	player = from.get_node("Player")
	player.get_parent().remove_child(player)
	
	var new_load_screen = loading_screen.instantiate()
	add_child(new_load_screen)
	load_finished.connect(new_load_screen.on_load_finished)
	
	await new_load_screen.loading_screen_ready
	load_finished.emit()
	
	get_tree().change_scene_to_file(full_path)
	await get_tree().process_frame
	var scene_root = get_tree().current_scene
	
	if is_instance_valid(player) and scene_root:
		scene_root.add_child(player)
		player.owner = scene_root
