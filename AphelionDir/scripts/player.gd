class_name Player extends CharacterBody2D

const BASESPEED = 100
var speed: float
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	
	var dir := Vector2(Input.get_axis("left", "right"), Input.get_axis("up","down")).normalized()
	
	if Input.is_action_pressed("shift"):
		speed = BASESPEED + 50
		sprite.speed_scale = 1.5
	else:
		speed = BASESPEED
		sprite.speed_scale = 1
		
	if dir:
		velocity = dir * speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, speed)
	
	sprite_manager(dir)
	
	move_and_slide()

func sprite_manager(dir: Vector2) -> void:
	var current_anim := sprite.animation
	var front := current_anim.ends_with("front")
	if dir == Vector2.ZERO:
		if front:
			sprite.animation = "idle front"
		else:
			sprite.animation = "idle back"
	else:
		if dir.y > 0:
			sprite.animation = "walk front"
		elif dir.y < 0:
			sprite.animation = "walk back"
		else:
			if front:
				sprite.animation = "walk front"
			else:
				sprite.animation = "walk back"
			
	if dir.x != 0:
		if dir.x > 0:
			sprite.flip_h = true
		else:
			sprite.flip_h = false
