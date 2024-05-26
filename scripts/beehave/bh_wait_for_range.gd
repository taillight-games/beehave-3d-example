
class_name WaitForRange extends ConditionLeaf

@export var _range : float = 2.0

func tick(actor:Node, _blackboard:Blackboard) -> int:
	if actor.global_position.distance_to(actor.enemy.global_position) <= _range:
		return SUCCESS
	else:
		return RUNNING

#	if actor.actions.is_in_hitbox(actor.enemy):
#		return SUCCESS
#	else:
#		return RUNNING
