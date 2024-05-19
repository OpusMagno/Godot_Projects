extends CharacterBody2D

@export var gravity = 400
@export var jump_force = 220
@export var speed = 125

@onready var animation = $AnimationPlayer
@onready var sprite = $AnimatedSprite2D
@onready var col_player = $PlayerCollision
@onready var col_attack = $Area2D/AttackCollision

var is_attacking = false


func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	#PULAR
	if Input.is_action_just_pressed("jump") && is_on_floor() == true:
		velocity.y = -jump_force
	
	if is_on_floor() == false: 
		velocity.y += gravity * delta
	
	#ANDAR
	var direction = Input.get_axis("move_left", "move_right")
	if direction != 0: 
		sprite.flip_h = (direction == -1)
		if direction > 0:
			col_player.position.x = sprite.position.x-7
		else:
			col_player.position.x = sprite.position.x+7

	velocity.x = direction * speed
	move_and_slide()

	update_animations(direction)


func _process(delta):
	if Input.is_action_just_pressed("attack") && !is_attacking:
		sprite.play("Attack")

func update_animations(direction):
	if is_on_floor() == true:
		if direction != 0:
			sprite.play("Run")
		else: 
			sprite.play("Idle") 
	else:
		if velocity.y < 0: 
			sprite.play("Jump")
		else: 
			sprite.play("Fall")
