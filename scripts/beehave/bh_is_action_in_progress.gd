
class_name IsActionInProgress extends ConditionLeaf

func tick(actor:Node, _blackboard:Blackboard) -> int:
	if actor.actions.is_action_in_progress():
		return SUCCESS
	else:
		return FAILURE
