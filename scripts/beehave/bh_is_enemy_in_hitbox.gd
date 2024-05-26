
class_name IsEnemyInHitbox extends ConditionLeaf


func tick(actor:Node, _blackboard:Blackboard) -> int:
#	if actor.global_positon.distance_to(actor.enemy.global_positon) <= actor.melee_range:
#		return SUCCESS
#	else:
#		return FAILURE

	if actor.actions.is_in_hitbox(actor.enemy):
		return SUCCESS
	else:
		return FAILURE
