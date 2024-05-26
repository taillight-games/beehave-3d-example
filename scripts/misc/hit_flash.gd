extends Timer

@export var models_path : Array[NodePath]

@export var time := 1.0

@export var flash_mat : Material


var models : Array[GeometryInstance3D]

func _ready():
	
	for _mp in models_path:
		models.append(get_node(_mp))
		assert(get_node(_mp) is GeometryInstance3D, "Error: hit_flash models_path must be GeometryInstance")
	
	if !timeout.is_connected(end_effect):
		timeout.connect(end_effect)
	get_parent().on_hit.connect(play_effect)
	

func play_effect():
	for _m in models:
		_m.material_overlay = flash_mat
	#model.material_overlay = flash_mat
	wait_time = time
	start()


func end_effect():
	#model.material_overlay = null
	for _m in models:
		if _m.material_overlay == flash_mat:
			_m.material_overlay = null
