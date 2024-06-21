extends RayCast3D


@onready var parent = get_parent().get_parent()

enum Type {
	left,
	middle,
	right
}

@export var raycastType : Type = Type.left

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	if is_colliding():

		parent.force_avoid_obstacle()
		# get the distance to raycast hit and then return it as a percentage of the raycast size
		var _distance = global_position.distance_to(get_collision_point())
		_distance = inverse_lerp(-target_position.z, 0, _distance)

		match raycastType:
			Type.left: parent.obstacle_distance.x = _distance
			Type.middle:	parent.obstacle_distance.y = _distance
			Type.right:	parent.obstacle_distance.z = _distance
		# print("obstacle collision")
