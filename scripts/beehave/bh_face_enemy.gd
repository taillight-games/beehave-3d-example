
class_name FaceEnemy extends ActionLeaf
#yeas
func tick(actor:Node, _blackboard:Blackboard) -> int:
	if actor.actions.is_in_hitbox(actor.enemy):
		#actor.rot_in_place = false
		actor.rotate_node = null
		return SUCCESS
	else:
		actor.rotate_self = true
		actor.rotate_target = actor.enemy.global_position
		actor.rotate_node = actor.enemy
		return RUNNING
