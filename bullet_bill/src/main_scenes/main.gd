extends Node

var obstacle_scenes = [
	preload("res://src/obstacle1_scenes/obstacle1-1.tscn"),
	preload("res://src/obstacle1_scenes/obstacle1-2.tscn"),
	preload("res://src/obstacle1_scenes/obstacle1-3.tscn"),
	preload("res://src/obstacle1_scenes/obstacle1-4.tscn"),
	preload("res://src/obstacle1_scenes/obstacle1-5.tscn")
]

#@export var object_scene: PackedScene
var obstacle_position = Vector2(1600, 608)
var obstacle_scale = Vector2(5, 5)
var obstacle_velocity = Vector2(2000, 0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_obstacle_timer_timeout() -> void:
	#var obstacle = object_scene.instantiate()
	var obstacle = obstacle_scenes[randi() % obstacle_scenes.size()].instantiate()	
	
	obstacle.position = obstacle_position
	obstacle.position.y = obstacle.spawn_height
	obstacle.set("scale", obstacle_scale)
	obstacle.obstacle_velocity = obstacle_velocity
	
	add_child(obstacle)
	print("Spawning object!")
