extends CharacterBody2D


const SPEED = 100.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var dir := Vector2(Input.get_axis("left", "right"), Input.get_axis("up","down")).normalized()
	if dir:
		velocity = dir * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)
	
	print(dir)
	_sprite_manager(dir)
	
		
	move_and_slide()

func _sprite_manager(dir: Vector2) -> void:
	var current_anim = animated_sprite_2d.animation
	var front = current_anim.ends_with("front")
	if dir == Vector2.ZERO:
		if front:
			animated_sprite_2d.animation = "idle front"
		else:
			animated_sprite_2d.animation = "idle back"
	else:
		if dir.y > 0:
			animated_sprite_2d.animation = "walk front"
		elif dir.y < 0:
			animated_sprite_2d.animation = "walk back"
		else:
			if front:
				animated_sprite_2d.animation = "walk front"
			else:
				animated_sprite_2d.animation = "walk back"
			
	if dir.x != 0:
		if dir.x > 0:
			animated_sprite_2d.flip_h = true
		else:
			animated_sprite_2d.flip_h = false
