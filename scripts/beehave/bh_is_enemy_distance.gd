class_name IsEnemyDistance extends ConditionLeaf

@export var upper_range : float = 10
@export var lower_range : float = 2.0

func tick(actor:Node, _blackboard:Blackboard) -> int:
	if actor.enemy == null:
		return FAILURE

	var _p = actor.global_position.distance_to(actor.enemy.global_position)

	if lower_range <= _p and _p <= upper_range:
		return SUCCESS
	else:
		return FAILURE
