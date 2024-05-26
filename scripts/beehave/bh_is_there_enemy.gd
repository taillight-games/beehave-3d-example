
class_name IsThereEnemy extends ConditionLeaf

func tick(actor:Node, _blackboard:Blackboard) -> int:
	if actor.senses.has_enemies():
		return SUCCESS
	else:
		return FAILURE
