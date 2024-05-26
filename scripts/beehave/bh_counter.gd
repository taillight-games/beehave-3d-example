
class_name Counter extends ConditionLeaf
## Returns SUCCESS for max_count amount of times, the returns FAILURE once and repeats


@export var max_count := 0

@onready var current_count := max_count

func tick(_actor:Node, _blackboard:Blackboard) -> int:
	if current_count == 0:
		current_count = max_count
		return FAILURE
	else:
		current_count -= 1
		return SUCCESS
