
class_name StartNavigation extends ActionLeaf


func tick(actor:Node, _blackboard:Blackboard) -> int:
	actor.toggle_navigation(true)
	return SUCCESS


