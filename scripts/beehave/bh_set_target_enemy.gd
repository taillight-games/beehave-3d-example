
class_name SetTargetEnemy extends ActionLeaf

func tick(actor:Node, _blackboard:Blackboard) -> int:
	actor.set_target(actor.enemy.global_position)
	return SUCCESS
