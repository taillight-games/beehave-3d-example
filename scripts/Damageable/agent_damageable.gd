
extends Damageable
class_name AgentDamageable

@export_category("Agent Settings")

@export var team : int = 0

@export var agent : Node

@export var only_damage_in_vulnerable : bool = false

@export var damage_vulnerability : AttackObject.damage_types = AttackObject.damage_types.none

@export var settings : DamageableSettings

var is_alive := true

var vulnerable : bool = false

signal on_invincible_hit

func _ready():
	
	if agent == null:
		agent = get_parent()

func damaged(_attack : AttackObject):

	if !active or health <= 0:
		print("no damage")
		return

	if only_damage_in_vulnerable and !vulnerable:
		if !_attack.damage_type == damage_vulnerability:
			on_invincible_hit.emit()
			return


	var _damage = _attack.damage

	if vulnerable:
		var _fdamage : float = _attack.damage * settings.damage_mult_in_vulnerable
		_damage = roundi(_fdamage)

	health -= _damage

	on_hit.emit()

	agent.on_hit()
	
	if health <= 0:
		die()

func heal(i : int):
	health += i
	if health > max_health:
		health = max_health
		
	on_heal.emit()

func die():
	on_die.emit()
	is_alive = false
	agent.die()

	
	
