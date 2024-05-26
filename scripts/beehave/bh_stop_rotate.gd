
class_name StopFaceEnemy extends ActionLeaf

func tick(actor:Node, _blackboard:Blackboard) -> int:
	
	#actor.rotate_self = false
	actor.rotate_node = null
	return SUCCESS
