extends Node2D

var dummy := Object.new()
@onready var window: Window = get_tree().get_root()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# force rendering to continue even when minimized
	DisplayServer.register_additional_output(dummy)


func _notification(what: int) -> void:
	# set background to transparent when we lose focus, so that OBS Game Capture can use transparency
	if what == NOTIFICATION_APPLICATION_FOCUS_OUT:
		window.transparent_bg = true
	elif what == NOTIFICATION_APPLICATION_FOCUS_IN:
		window.transparent_bg = false


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventJoypadButton:
		button_event(event)
	elif event is InputEventJoypadMotion:
		motion_event(event)

# Up, Up, Down, Down, Left, Right, Left, Right, B, A, Start
var konami_code : Array[JoyButton] = [
	JOY_BUTTON_DPAD_UP,
	JOY_BUTTON_DPAD_UP,
	JOY_BUTTON_DPAD_DOWN,
	JOY_BUTTON_DPAD_DOWN,
	JOY_BUTTON_DPAD_LEFT,
	JOY_BUTTON_DPAD_RIGHT,
	JOY_BUTTON_DPAD_LEFT,
	JOY_BUTTON_DPAD_RIGHT,
	JOY_BUTTON_B,
	JOY_BUTTON_A,
	JOY_BUTTON_START
]

var matchIndex := 0

func check_konami_code(button : JoyButton) -> void:
	if button != konami_code[matchIndex]:
		matchIndex = 0
	else:
		matchIndex += 1
		# check if done
		if matchIndex == konami_code.size():
			matchIndex = 0
			%HugeFraudImage.visible = true
			await get_tree().create_timer(3.0).timeout # waits for 1 second
			%HugeFraudImage.visible = false


func check_man() -> void:
	%ManImage.visible = %LeftStick/On.visible && %RightStick/On.visible


func button_event(event: InputEventJoypadButton) -> void:
	var on := event.pressed
	var off := !on
	
	match event.button_index:
		JOY_BUTTON_A:
			%Button_A/Off.visible = off
			%Button_A/On.visible = on
		JOY_BUTTON_B:
			%Button_B/Off.visible = off
			%Button_B/On.visible = on
		JOY_BUTTON_X:
			%Button_X/Off.visible = off
			%Button_X/On.visible = on
		JOY_BUTTON_Y:
			%Button_Y/Off.visible = off
			%Button_Y/On.visible = on
		JOY_BUTTON_START:
			%Button_Menu/Off.visible = off
			%Button_Menu/On.visible = on
		JOY_BUTTON_BACK:
			%Button_View/Off.visible = off
			%Button_View/On.visible = on
		JOY_BUTTON_LEFT_SHOULDER:
			%Button_LB/Off.visible = off
			%Button_LB/On.visible = on
		JOY_BUTTON_RIGHT_SHOULDER:
			%Button_RB/Off.visible = off
			%Button_RB/On.visible = on
		JOY_BUTTON_LEFT_STICK:
			%LeftStick/Off.visible = off
			%LeftStick/On.visible = on
		JOY_BUTTON_RIGHT_STICK:
			%RightStick/Off.visible = off
			%RightStick/On.visible = on
		JOY_BUTTON_DPAD_UP:
			%Button_DPAD/Up.visible = on
		JOY_BUTTON_DPAD_DOWN:
			%Button_DPAD/Down.visible = on
		JOY_BUTTON_DPAD_LEFT:
			%Button_DPAD/Left.visible = on
		JOY_BUTTON_DPAD_RIGHT:
			%Button_DPAD/Right.visible = on
	# easter eggs
	if off:
		check_konami_code(event.button_index)
	check_man()


@onready var left_stick_x: float = %LeftStick.position.x
@onready var left_stick_y: float = %LeftStick.position.y

@onready var right_stick_x: float = %RightStick.position.x
@onready var right_stick_y: float = %RightStick.position.y

func motion_event(event: InputEventJoypadMotion) -> void:
	# var on := event.axis_value >= 0.5
	# var off := !on
	match event.axis:
		JoyAxis.JOY_AXIS_LEFT_X:
			%LeftStick.position.x = left_stick_x + (event.axis_value * 70)
		JoyAxis.JOY_AXIS_LEFT_Y:
			%LeftStick.position.y = left_stick_y + (event.axis_value * 70)
		JoyAxis.JOY_AXIS_RIGHT_X:
			%RightStick.position.x = right_stick_x + (event.axis_value * 70)
		JoyAxis.JOY_AXIS_RIGHT_Y:
			%RightStick.position.y = right_stick_y + (event.axis_value * 70)
		JoyAxis.JOY_AXIS_TRIGGER_RIGHT:
			# %RightTrigger/Off.visible = off
			# %RightTrigger/On.visible = on
			%RightTrigger/Bar.set_value_no_signal(event.axis_value * 100)
		JoyAxis.JOY_AXIS_TRIGGER_LEFT:
			# %LeftTrigger/Off.visible = off
			# %LeftTrigger/On.visible = on
			%LeftTrigger/Bar.set_value_no_signal(event.axis_value * 100)
