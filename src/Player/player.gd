extends CharacterBody2D

class_name Player

@export var MAX_SPEED: int = 200
@export var ACCEL: int = 800
@export var FRICTION: int = 800

var MainInstances = GlobalResourceLoader.MainInstances

func _ready():
	MainInstances.Player = self
	
func _physics_process(delta):
	var direction: Vector2 = get_input_vector()
	if direction != Vector2.ZERO: 
		velocity = velocity.move_toward(direction * MAX_SPEED, ACCEL * delta)
	else: 
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	move_and_slide()
	
func get_input_vector()->Vector2: 
	var input_vector: Vector2 = Vector2.ZERO
	input_vector.x = Input.get_axis("ui_left", "ui_right")
	input_vector.y = Input.get_axis("ui_up", "ui_down")
	return input_vector.normalized()
