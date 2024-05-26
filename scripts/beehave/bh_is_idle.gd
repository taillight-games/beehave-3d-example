
class_name IsIdle extends ConditionLeaf

@export var animation_name : StringName

func tick(actor:Node, _blackboard:Blackboard) -> int:
	if actor.is_idle:
		return SUCCESS
	else:
		return FAILURE
