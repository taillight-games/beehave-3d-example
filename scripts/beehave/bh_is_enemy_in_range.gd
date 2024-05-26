
class_name IsEnemyInRange extends ConditionLeaf

@export var current_range : float = 2.0

func tick(actor:Node, _blackboard:Blackboard) -> int:
	if actor.enemy == null:
		return FAILURE

	if actor.global_position.distance_to(actor.enemy.global_position) <= current_range:
		return SUCCESS
	else:
		return FAILURE
