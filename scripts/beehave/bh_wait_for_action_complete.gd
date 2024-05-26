
class_name WaitForActionComplete extends ConditionLeaf

func tick(actor:Node, _blackboard:Blackboard) -> int:
	return SUCCESS
	#if actor.senses.has_enemies():
		#return SUCCESS
	#else:
	#	return FAILURE
