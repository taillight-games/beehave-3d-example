
extends Area3D
class_name AISenses

@export var self_collider : Area3D

@export var current_agents : Array[Area3D] = []

@export var current_enemies : Array[Area3D] = []

@export var check_los : bool = false

var raycast :RayCast3D

# Called when the node enters the scene tree for the first time.
func _ready():
	if check_los:
		raycast = $RayCast3D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass




func _on_area_entered(area):
	if area is AgentDamageable and area != self_collider:
		if area.team != self_collider.team:
			current_enemies.append(area)
		else:
			current_agents.append(area)


func _on_area_exited(area):
	current_agents.erase(area)
	current_enemies.erase(area)


func has_enemies() -> bool:
	if current_enemies.size() > 0:
		return true
	else:
		return false

func get_enemy() -> Node3D:
	if current_enemies.size() > 0:
		if check_los:
			if has_los(current_enemies[0].global_position):
				return current_enemies[0] as Node3D
			else:
				return null
		else:
			return current_enemies[0] as Node3D
	else:
		return null

func has_los(target : Vector3) -> bool:
	raycast.enabled = true
	raycast.look_at_from_position(raycast.global_position, target, Vector3(0,1,0))
	raycast.target_position.z = -raycast.global_position.distance_to(target)
	raycast.force_raycast_update()
	
	if raycast.is_colliding():
		raycast.enabled = false
		return false
	else:
		raycast.enabled = false
		return true
