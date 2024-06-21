

class_name EnemyActions extends NPCActions


@export_category("Attack 1")
@export var attack_1_hitbox : Area3D

@export var attack_1_damage : int = 1

@export var attack_1_object : AttackObject

@export_category("Settings")

@export var self_collider : Area3D


### ---- Animation Functions ----- ###

func a_attack_1_damage():
	_deal_damage(attack_1_hitbox, attack_1_damage)

### ----- Internal Functions ---- ### 

func _deal_damage(_a : Area3D, _damage : int = 1):
	var _bodies = _a.get_overlapping_areas()
	var _ao = attack_1_object
	_ao.damage = _damage
	for _b in _bodies:
		if _b != self_collider and _b is Damageable:
			_b.damaged(_ao)


func is_in_hitbox(_agent : Area3D) -> bool:
	var _areas = attack_1_hitbox.get_overlapping_areas()
	for _a in _areas:
		if _a == _agent:
			return true
	return false

