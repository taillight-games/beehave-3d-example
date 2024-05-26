extends Area3D

var colliding_body_count : int = 0

var is_collide : bool

func _ready():
	if !body_entered.is_connected(_on_body_entered):
		body_entered.connect(_on_body_entered)
	if !body_exited.is_connected(_on_body_exited):
		body_exited.connect(_on_body_exited)


func _on_body_entered(_body):
	colliding_body_count += 1


func _on_body_exited(_body):
	colliding_body_count -= 1

func is_colliding() -> bool:
	
	if colliding_body_count != 0:
		return true
	else:
		return false
