

class_name AttackObject extends Resource


enum damage_types {
	none,
	slashing,
	kinetic,
	fire,
	earth
}

@export var damage_type : damage_types = damage_types.slashing

@export var damage : int = 1

@export var override_knockback := false

@export var knockback : float = 3

func _init(_damage_type : damage_types = damage_types.slashing, _damage : int = 1, _override_knockback : bool = false, _knockback : float = 3):
	damage_type = _damage_type
	damage = _damage
	override_knockback = _override_knockback
	knockback = _knockback

