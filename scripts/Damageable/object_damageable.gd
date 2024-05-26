
extends Damageable
class_name ObjectDamageable

func damaged(_attack : AttackObject):
	
	if health <= 0:
		return
		
	on_hit.emit()
	
	health -= _attack.damage
	
	if health <= 0:
		die()
	
func die():
	pass
