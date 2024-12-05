extends Area2D
var hill_velocity = Vector2.ZERO

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	var velocity = Vector2.ZERO

	velocity.x -= hill_velocity.x
	
	position += velocity * delta	
	
