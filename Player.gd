extends KinematicBody2D

const Gravity = 900
const MAX_SPEED = 500
const ACCEL = 400
const FRICTION = 2000
const JUMP = 500
const DOUBLE_JUMP = 300
const MAX_JUMPS = 2



onready var anim = $AnimatedSprite

var velocity = Vector2.ZERO
var jumps = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("idle")

func _process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = move_toward(velocity.x, MAX_SPEED, ACCEL * delta)
		anim.play("walk")
		anim.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		velocity.x = move_toward(velocity.x, -MAX_SPEED, ACCEL * delta)
		anim.play("walk")
		anim.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
		anim.play("idle")
	if Input.is_action_just_pressed("ui_select") and  (is_on_floor() or jumps < MAX_JUMPS):
		if is_on_floor():
			velocity.y = -JUMP
		else:
			velocity.y = -DOUBLE_JUMP
			jumps += 1
		if is_on_floor():
			jumps = 0
			anim.play("jump")
		elif not is_on_floor():
			anim.play("jump")
	
	
func _physics_process(delta):
	velocity.y += Gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	
	
	

	
