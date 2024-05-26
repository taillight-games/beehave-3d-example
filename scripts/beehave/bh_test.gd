
class_name TestAction extends ActionLeaf

func tick(_actor:Node, _blackboard:Blackboard) -> int:
	print("test action fired")
	return SUCCESS
