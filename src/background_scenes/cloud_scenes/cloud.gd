extends Area2D
var cloud_velocity = Vector2.ZERO

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	var velocity = Vector2.ZERO

	velocity.x -= cloud_velocity.x
	
	position += velocity * delta	
	
