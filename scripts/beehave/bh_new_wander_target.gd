
class_name NewWanderTarget extends ActionLeaf

@export var radius : float = 0

func tick(actor:Node, _blackboard:Blackboard) -> int:

	if radius == 0:
		actor.new_wander_target()
	else:
		actor.new_wander_target(radius)
	
	return SUCCESS
