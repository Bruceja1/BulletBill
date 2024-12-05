extends Node

@export var cloud_scene : PackedScene
@export var hill_scene : PackedScene

var obstacle_scenes = [
	preload("res://src/obstacle1_scenes/obstacle1-1.tscn"),
	preload("res://src/obstacle1_scenes/obstacle1-2.tscn"),
	preload("res://src/obstacle1_scenes/obstacle1-3.tscn"),
	preload("res://src/obstacle1_scenes/obstacle1-4.tscn"),
	preload("res://src/obstacle1_scenes/obstacle1-5.tscn"),
	
	preload("res://src/obstacle1_scenes/obstacle1-1u.tscn"),
	preload("res://src/obstacle1_scenes/obstacle1-2u.tscn"),
	preload("res://src/obstacle1_scenes/obstacle1-3u.tscn"),
	preload("res://src/obstacle1_scenes/obstacle1-4u.tscn"),
	preload("res://src/obstacle1_scenes/obstacle1-5u.tscn")
	
]

var obstacle_position = Vector2(1600, 608)
var obstacle_scale = Vector2(5, 5)
var obstacle_velocity = Vector2(1500, 0)
var cloud_velocity = Vector2(2500, 0)
var hill_velocity = Vector2(1100, 0)
var score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func game_over() -> void:
	$ScoreTimer.stop()
	$ObstacleTimer.stop()
	$CloudTimer.stop()
	$HillTimer.stop()
	$DifficultyTimer.stop()
	$HUD.show_game_over()
	$Music.stop()
	$DeathSound.play()
	

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	$Music.play()


func _on_obstacle_timer_timeout() -> void:
	#var obstacle = object_scene.instantiate()
	var obstacle = obstacle_scenes[randi() % obstacle_scenes.size()].instantiate()	
	obstacle.position = obstacle_position
	obstacle.position.y = obstacle.spawn_height
	obstacle.set("scale", obstacle_scale)
	obstacle.obstacle_velocity = obstacle_velocity
	

	add_child(obstacle)
	print("Spawning object!")


func _on_score_timer_timeout() -> void:
	score += 1
	$HUD.update_score(score)


func _on_start_timer_timeout() -> void:
	$ObstacleTimer.start()
	$CloudTimer.start()
	$HillTimer.start()
	$ScoreTimer.start()
	$DifficultyTimer.start()


func _on_cloud_timer_timeout() -> void:
	var cloud = cloud_scene.instantiate()	
	cloud.position.x = $TopRightMarker.position.x
	cloud.position.y = randf_range($TopRightMarker.position.y, $BottomRightMarker.position.y)
	cloud.cloud_velocity = cloud_velocity
	
	add_child(cloud)
	print("Spawning cloud!")
	


func _on_hill_timer_timeout() -> void:
	var hill = hill_scene.instantiate()
	hill.position = $BottomRightMarker.position
	hill.position.y -= 88
	hill.hill_velocity = hill_velocity
	
	add_child(hill)
	print("Spawning hill!")


func _on_difficulty_timer_timeout() -> void:
	obstacle_velocity.x += 1000
	print("Obstacle velocity has increased!")
