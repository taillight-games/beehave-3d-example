
class_name StartCooldown extends ActionLeaf

enum cooldown_types
{
	normal,
	secondary
}

@export var cooldown_type : cooldown_types = cooldown_types.normal
@export var cooldown_time : float = 1

func tick(_actor:Node, _blackboard:Blackboard) -> int:
	if cooldown_type == cooldown_types.normal:
		_actor.start_cooldown(cooldown_time)
	else:
		_actor.start_secondary_cooldown(cooldown_time)
	return SUCCESS
