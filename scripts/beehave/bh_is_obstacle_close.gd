extends ConditionLeaf
class_name IsObstacleClose

func tick(actor:Node, _blackboard:Blackboard) -> int:
	if actor.wall_raycast_collided or actor.near_obstacle:
		return SUCCESS
	else:
		return FAILURE
