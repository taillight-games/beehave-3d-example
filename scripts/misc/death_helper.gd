extends Timer

@export_node_path("MeshInstance3D") var mesh_path : NodePath
@export var dead_material : Material
@export var transparent_material : Material

@onready var anim : AnimationPlayer = $AnimationPlayer

@onready var mesh = get_node(mesh_path)

# Called when the node enters the scene tree for the first time.
func _ready():
	timeout.connect(end)
	

func begin():
	
	await get_tree().create_timer(0.2).timeout
	
	mesh.material_overlay = dead_material
	start()
	anim.play("crumble")

func end():
	get_parent().queue_free()

func a_hide_main():
	mesh.material_override = transparent_material
