extends Node2D

@export var speed: float = 400.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var inputVector: Vector2 = Vector2.ZERO
	
	inputVector.x = Input.get_axis("left", "right")
	inputVector.y = Input.get_axis("up", "down")
	
	# Normalize the vector to avoid diagonals having a faster speed
	if (inputVector.length() > 0):
		inputVector = inputVector.normalized()
	
	position += inputVector * speed * delta
