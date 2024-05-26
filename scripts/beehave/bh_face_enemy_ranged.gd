
class_name FaceEnemyRanged extends ActionLeaf

func tick(actor:Node, _blackboard:Blackboard) -> int:
	
	actor.rotate_self = true
	actor.rotate_target = actor.enemy.global_position
	actor.rotate_node = actor.enemy
	
	if actor.is_rotate_complete():
		#actor.rot_in_place = false
		actor.rotate_node = null
		return SUCCESS
	else:
		return RUNNING
