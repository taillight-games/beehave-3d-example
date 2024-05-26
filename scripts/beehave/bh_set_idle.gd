
class_name SetIdle extends ActionLeaf

@export var idle_value := true

func tick(actor:Node, _blackboard:Blackboard) -> int:
	actor.is_idle = idle_value
	return SUCCESS
