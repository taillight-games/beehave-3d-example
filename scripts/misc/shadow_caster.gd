extends RayCast3D


@export var shadow_offset : float = 0.02

@onready var shadow : Node3D = $shadow
@onready var parent : Node3D = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	
	if is_colliding():
		shadow.visible = true
		global_rotation = Vector3(0,0,0)
		shadow.global_position = get_collision_point() + Vector3(0, shadow_offset, 0)
		shadow.basis = align_up(shadow.basis, get_collision_normal())
	else:
		shadow.visible = false
	#shadow.rotation_degrees.y = 0


func align_up(node_basis, normal):
	var result = Basis()
	#var _scale = node_basis.get_scale() # Only if your node might have a scale other than (1,1,1)

	result.x = normal.cross(node_basis.z)
	result.y = normal
	result.z = node_basis.x.cross(normal)

	result = result.orthonormalized()
	#result.x *= _scale.x 
	#result.y *= _scale.y 
	#result.z *= _scale.z 

	return result
