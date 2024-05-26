
class_name IsMoving extends ConditionLeaf

func tick(actor:Node, _blackboard:Blackboard) -> int:
	if actor.linear_velocity.length() > 0.1:
		return SUCCESS
	else:
		return FAILURE
