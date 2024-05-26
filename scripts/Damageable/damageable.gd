
extends Area3D
class_name Damageable

@export_category("Damageable Settings")

@export var max_health : int = 10

@onready var health : int = max_health


@export var active := true

signal on_hit
signal on_heal
signal on_die

func _ready():
	# set the collider so it is always on collision layer 10 and is not monitoring
	monitoring = false
	collision_layer = 512
	collision_mask = 512

func damaged(_attack : AttackObject):
	pass
