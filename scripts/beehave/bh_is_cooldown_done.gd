
class_name IsCooldownDone extends ConditionLeaf

enum cooldown_types
{
	normal,
	secondary
}

@export var cooldown_type : cooldown_types = cooldown_types.normal

func tick(_actor:Node, _blackboard:Blackboard) -> int:
	if cooldown_type == cooldown_types.normal:
		if _actor.in_cooldown:
			return FAILURE
		else:
			return SUCCESS
	else:
		if _actor.in_secondary_cooldown:
			return FAILURE
		else:
			return SUCCESS
