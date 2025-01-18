extends Node2D

var dummy := Object.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# force rendering to continue even when minimized
	DisplayServer.register_additional_output(dummy)


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventJoypadButton:
		button_event(event)
	elif event is InputEventJoypadMotion:
		motion_event(event)


func button_event(event: InputEventJoypadButton) -> void:
	var on := event.pressed
	var off := !on
	match event.button_index:
		JoyButton.JOY_BUTTON_A:
			%Button_A/Off.visible = off
			%Button_A/On.visible = on
		JoyButton.JOY_BUTTON_B:
			%Button_B/Off.visible = off
			%Button_B/On.visible = on
		JoyButton.JOY_BUTTON_X:
			%Button_X/Off.visible = off
			%Button_X/On.visible = on
		JoyButton.JOY_BUTTON_Y:
			%Button_Y/Off.visible = off
			%Button_Y/On.visible = on
		JoyButton.JOY_BUTTON_START:
			%Button_Menu/Off.visible = off
			%Button_Menu/On.visible = on
		JoyButton.JOY_BUTTON_BACK:
			%Button_View/Off.visible = off
			%Button_View/On.visible = on
		JoyButton.JOY_BUTTON_LEFT_SHOULDER:
			%Button_LB/Off.visible = off
			%Button_LB/On.visible = on
		JoyButton.JOY_BUTTON_RIGHT_SHOULDER:
			%Button_RB/Off.visible = off
			%Button_RB/On.visible = on
		JoyButton.JOY_BUTTON_LEFT_STICK:
			%LeftStick/Off.visible = off
			%LeftStick/On.visible = on
		JoyButton.JOY_BUTTON_RIGHT_STICK:
			%RightStick/Off.visible = off
			%RightStick/On.visible = on
		JoyButton.JOY_BUTTON_DPAD_UP:
			%Button_DPAD/Up.visible = on
		JoyButton.JOY_BUTTON_DPAD_DOWN:
			%Button_DPAD/Down.visible = on
		JoyButton.JOY_BUTTON_DPAD_LEFT:
			%Button_DPAD/Left.visible = on
		JoyButton.JOY_BUTTON_DPAD_RIGHT:
			%Button_DPAD/Right.visible = on


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
