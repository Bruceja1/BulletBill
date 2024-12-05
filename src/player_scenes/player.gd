extends Area2D
var screen_size
signal hit

var speed = 1000
var max_rotation = 30

func _ready() -> void:
	screen_size = get_viewport_rect().size
	hide()
	

func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	
	rotation_degrees = 0
	
	if Input.is_action_pressed("move_up"):
		velocity.y -= speed
		rotation_degrees = -max_rotation
		
		
	if Input.is_action_pressed("move_down"):
		velocity.y += speed
		rotation_degrees = max_rotation
		
	if Input.is_action_pressed("move_up") && Input.is_action_pressed("move_down"):
		rotation_degrees = 0
				
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)


func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	hide()
	hit.emit()
	$CollisionShape2D.set_deferred("disabled", true)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	
