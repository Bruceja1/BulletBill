extends Area2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	var velocity = Vector2.ZERO

	velocity.x -= 1000
	
	position += velocity * delta	
	
