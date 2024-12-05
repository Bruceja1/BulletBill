extends Area2D
var screen_size
signal hit

var speed = 1000

func _ready() -> void:
	screen_size = get_viewport_rect().size
	

func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("move_up"):
		velocity.y -= speed
		
	if Input.is_action_pressed("move_down"):
		velocity.y += speed
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)


func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	hide()
