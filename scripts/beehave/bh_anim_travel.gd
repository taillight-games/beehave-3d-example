
class_name AnimTravel extends ActionLeaf

@export var animation_name : StringName

func tick(actor:Node, _blackboard:Blackboard) -> int:

	actor.anim_travel(animation_name)
	
	return SUCCESS
