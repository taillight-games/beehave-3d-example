
class_name ActionSlot extends Node


@onready var parent : NPCActions = get_parent() 

@onready var agent : Agent = parent.get_parent()

func _ready():
	pass

func on_start_action():
	assert(false, "Error: start_action not implimented in ActionSlot extension class")

func on_end_action():
	assert(false, "Error: end_action not implimented in ActionSlot extension class")

func on_action_process():
	assert(false, "Error: action_process not implimented in ActionSlot extension class")
