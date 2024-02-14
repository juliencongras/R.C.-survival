extends CharacterBody2D

var SPEED = 0
var MAX_SPEED = 500
var MIN_SPEED = -200
var ACCELERATION = 20
var rotation_speed = 0.1
@onready var car_sprite = $Sprite

func _physics_process(delta):
	velocity = Vector2(0, -1).rotated(rotation) * SPEED
	car_sprite.play("default")
	
	if SPEED > MAX_SPEED:
		SPEED = MAX_SPEED
	
	if SPEED < MIN_SPEED:
		SPEED = MIN_SPEED
	
	if SPEED != 0:
		if Input.is_action_pressed("Left"):
			rotate(-rotation_speed)
			car_sprite.play("left")
		elif Input.is_action_pressed("Right"):
			rotate(rotation_speed)
			car_sprite.play("right")
	
	if Input.is_action_pressed("Accelerate"):
		SPEED += ACCELERATION
	elif Input.is_action_pressed("Backup"):
		SPEED -= ACCELERATION
	elif SPEED > 0:
		SPEED -= ACCELERATION
	elif SPEED < 0:
		SPEED += ACCELERATION
	
	move_and_slide()
