

class_name NPCActions extends Node


@export var default_animation_name : StringName = "idle"

@export_category("Hit Action Slot")

@export var enable_hit_action := true

@export var hit_action_slot : ActionSlot

@onready var parent : Agent = get_parent()

var action_in_progress := false

@onready var timer : Timer = $Timer

signal action_started
signal action_ended
signal action_process

func _ready():
	timer.timeout.connect(a_action_ended)

func a_action_started():
	if action_in_progress:
		a_action_ended()
	action_in_progress = true
	parent.bh_tree.enabled = false
	parent.toggle_navigation(false)

func a_action_ended():
	timer.stop()
	action_in_progress = false
	action_ended.emit()
	parent.bh_tree.enabled = true
	parent.toggle_navigation(true)

func is_action_in_progress() -> bool:
	return action_in_progress

func hit_action():
	if enable_hit_action:
		hit_action_slot.on_start_action()
