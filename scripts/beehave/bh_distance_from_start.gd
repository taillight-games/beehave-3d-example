
class_name DistanceFromStart extends ConditionLeaf

@export var max_distance := 10.0

@export var use_agent_max_distance := false

@export_enum("Position:0", "Destination:1") var use_point : int

func tick(_actor:Node, _blackboard:Blackboard) -> int:

	var _md = max_distance
	if use_agent_max_distance: _md = _actor.max_wander_distance

	var start_p := Vector3.ZERO
	if use_point == 0:
		start_p = _actor.global_position
	else:
		start_p = _actor.nav_agent.target_position

	if start_p.distance_to(_actor.start_position) > _md:
		return FAILURE
	else:
		return SUCCESS
