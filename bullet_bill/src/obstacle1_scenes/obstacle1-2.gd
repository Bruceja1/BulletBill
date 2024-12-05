extends Area2D
var obstacle_velocity = Vector2.ZERO
var spawn_height = 568

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	var velocity = Vector2.ZERO

	velocity.x -= obstacle_velocity.x
	
	position += velocity * delta	
	
