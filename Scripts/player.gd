extends Node2D

const PLAYER_START_POSITION = Vector2(0, 418)
const POSITION_INCREMENT = 16

@onready var sprite_2d = $Sprite2D
@onready var animation_player = $AnimationPlayer	

var new_position: Vector2 = Vector2.ZERO
@export var speed = 40

func _process(delta):
	if new_position == Vector2.ZERO:
		return
	position = lerp(position, new_position, speed * delta)
	
	if absf((position - new_position).length() ) < 0.001:
		position = round(position)

func _input(event):
	
	var position_candidate
	
	if Input.is_action_just_pressed("down"):
		position_candidate = Vector2.DOWN * POSITION_INCREMENT + position
		#sprite_2d.rotation_degrees = 180
	elif Input.is_action_just_pressed("up"):
		position_candidate = Vector2.UP * POSITION_INCREMENT + position
		#sprite_2d.rotation_degrees = 0
	elif Input.is_action_just_pressed("left"):
		position_candidate = Vector2.LEFT * POSITION_INCREMENT + position
		#sprite_2d.rotation_degrees = 270
	elif Input.is_action_just_pressed("right"):
		#sprite_2d.rotation_degrees = 90
		position_candidate = Vector2.RIGHT * POSITION_INCREMENT + position

	if !position_candidate:
		return
	new_position = position_candidate
	
