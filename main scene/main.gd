extends Node2D

@onready var score_label = $UI/Score
@onready var battery_spawner_shape = $"Battery Spawner/CollisionShape2D"
@onready var battery_spawner_size : Vector2 = battery_spawner_shape.shape.extents * 2
@onready var battery_spawner = $"Battery Spawner"
@export var battery_scene : PackedScene
@onready var energy_bar = $UI/EnergyBar

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.main_scene_node = self
	energy_bar.value = energy_bar.max_value
	spawn_battery()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	energy_bar.value -= energy_bar.step
	
	if energy_bar.value <= 0:
		pass

func spawn_battery():
	score_label.text = str("Score : ", Global.score)
	var random_width = randf_range(0, battery_spawner_size.x)
	var random_height = randf_range(0, battery_spawner_size.y)
	var battery_random_position : Vector2 = Vector2(random_width, random_height)
	var battery_instance = battery_scene.instantiate()
	battery_instance.position = battery_random_position
	battery_spawner.call_deferred("add_child", battery_instance)
	energy_bar.value = energy_bar.max_value
