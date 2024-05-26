
class_name IsAnimPlaying extends ConditionLeaf

@export var animation_name : StringName

func tick(actor:Node, _blackboard:Blackboard) -> int:
	if actor.anim_sm.get_current_node() == animation_name:
		return SUCCESS
	else:
		return FAILURE
