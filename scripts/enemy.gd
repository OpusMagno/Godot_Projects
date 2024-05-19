extends Node2D

@onready var sprite = $RigidBody2D/AnimatedSprite2D
@onready var col_enemy = $RigidBody2D/CollisionShape2D
var is_Hit = false

func _physics_process(delta):
	update_animations()

func _process(delta):
	pass

func _on_area_2d_area_entered(area):
	is_Hit == true
	
func update_animations():
	if is_Hit == false:
		sprite.play("Idle")
	else:
		sprite.play("Hit")
		print("HIT")
		is_Hit = false
