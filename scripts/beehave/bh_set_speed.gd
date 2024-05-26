
class_name SetSpeed extends ActionLeaf

enum speed_type {
	normal_speed,
	sprint_speed,
	custom
}

@export var type : speed_type = speed_type.normal_speed

@export var custom_speed : float = 1.0

func tick(_actor:Node, _blackboard:Blackboard) -> int:
	if type == speed_type.normal_speed:
		_actor.movement_speed = _actor.normal_speed
	elif type == speed_type.sprint_speed:
		_actor.movement_speed = _actor.sprint_speed
	elif type == speed_type.custom:
		_actor.movement_speed = custom_speed
	return SUCCESS

	
