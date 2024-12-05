extends Node
@export var object_scene: PackedScene
var obstacle_position = Vector2(992, 200)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_obstacle_timer_timeout() -> void:
	var obstacle = object_scene.instantiate()
	obstacle.position = obstacle_position
	add_child(obstacle)
	print("Spawning object!")
