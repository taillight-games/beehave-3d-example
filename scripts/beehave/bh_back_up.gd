extends ActionLeaf
class_name SetTargetBackwards

@export var distance : float = 2.0

func tick(_actor:Node, _blackboard:Blackboard) -> int:
	
	_actor.set_target(_actor.global_position + (_actor.basis.z * distance))
	return SUCCESS
