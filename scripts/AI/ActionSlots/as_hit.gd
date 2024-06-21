
class_name AS_Hit extends ActionSlot


@export var hit_recover_time : float = 1

@export var hit_recovery_i_frames := false

@export var hit_knockback : float = 3

@export var enable_knockback := true

@export var stop_think_during_recovery := false

# prevent the hit effect from stunlocking enemies
# only the first hit in that period of time will play the animation
@export_category("Recovery Repeat Timer")
@export var enable_repeat_timer := false
@export var repeat_time : float = 1.0
@onready var repeat_timer : Timer = $HitRecoveryRepeatTimer
var repeat_timer_in_progress := false

var disable_hit_response := false

func _ready():
	if enable_repeat_timer:
		repeat_timer.timeout.connect(repeat_timer_timeout)

func on_start_action():
	
	# check to make sure we should actually do the hit action
	if disable_hit_response:
		return
	if repeat_timer_in_progress:
		return
		
	if stop_think_during_recovery:
		parent.a_action_started()
	# add end self to the action_ended signal
	parent.action_ended.connect(on_end_action)

	if hit_recovery_i_frames:
		agent.toggle_damageable(false)
	# play the hit animation
	agent.anim_sm.start("hit")
	# set the actions to think there's an action in progress
	if enable_knockback:
		agent.linear_velocity = agent.basis.z * hit_knockback

	if enable_repeat_timer:
		repeat_timer_start()
	
	parent.timer.start(hit_recover_time)

func on_end_action():
	parent.action_ended.disconnect(on_end_action)
	agent.toggle_damageable(true)

# empty function must be here to overwrite the assert in the base class.
func on_action_process():
	pass

func repeat_timer_start():
	repeat_timer_in_progress = true
	repeat_timer.start(repeat_time)

func repeat_timer_timeout():
	repeat_timer_in_progress = false
