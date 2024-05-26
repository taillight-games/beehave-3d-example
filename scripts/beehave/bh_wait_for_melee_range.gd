
class_name WaitForMeleeRange extends ConditionLeaf

func tick(actor:Node, _blackboard:Blackboard) -> int:
	if actor.global_position.distance_to(actor.enemy.global_position) <= actor.melee_range:
		return SUCCESS
	else:
		return RUNNING

#	if actor.actions.is_in_hitbox(actor.enemy):
#		return SUCCESS
#	else:
#		return RUNNING
