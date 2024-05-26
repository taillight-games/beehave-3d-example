
extends Area3D
class_name DamageDealer

@export var affect_col_mask := false

@export var active := false

@export var damage := 1
@export var attack_object : AttackObject

@export var self_collider : Area3D

var collider_mask

func _ready():
	attack_object = AttackObject.new()
	attack_object.damage = 1
	if !area_entered.is_connected(_on_area_entered):
		area_entered.connect(_on_area_entered)
	collider_mask = collision_mask
	if affect_col_mask:
		collision_mask = 0

func _on_area_entered(area : Area3D):
	if active:
		if area != self_collider and area is Damageable:
			area.damaged(attack_object)


func enable():
	if affect_col_mask:
		collision_mask = collider_mask
	active = true

func disable():
	if affect_col_mask:
		collision_mask = 0
	active = false

func oneshot():
	var _areas = get_overlapping_areas()
	for _a in _areas:
		if _a is Damageable:
			_a.damaged(damage)


func is_in_hitbox(_agent : Area3D) -> bool:
	var _areas = get_overlapping_areas()
	for _a in _areas:
		if _a == _agent:
			return true
	return false
