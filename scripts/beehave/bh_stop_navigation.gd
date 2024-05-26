
class_name StopNavigation extends ActionLeaf

func tick(actor:Node, _blackboard:Blackboard) -> int:
	actor.toggle_navigation(false)
	return SUCCESS