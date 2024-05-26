
class_name RotatingCooldown extends ActionLeaf

enum cooldown_types
{
	normal,
	secondary
}

@export var cooldown_type : cooldown_types = cooldown_types.normal
@export var cooldown_times : Array[float]

var times_cooled : int = 0

func tick(_actor:Node, _blackboard:Blackboard) -> int:
	
	times_cooled = times_cooled % cooldown_times.size()
	
	var _time = cooldown_times[times_cooled]
	
	if cooldown_type == cooldown_types.normal:
		_actor.start_cooldown(_time)
	else:
		_actor.start_secondary_cooldown(_time)
	
	times_cooled += 1
		
	return SUCCESS
