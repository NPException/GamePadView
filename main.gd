extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _unhandled_input(event: InputEvent) -> void:
	if (event is InputEventJoypadButton):
		var buttonEvent := event as InputEventJoypadButton
		var on := buttonEvent.pressed
		var off := !on
		match event.button_index:
			JoyButton.JOY_BUTTON_A:
				$Button_A/Off.visible = off
				$Button_A/On.visible = on
			JoyButton.JOY_BUTTON_B:
				$Button_B/Off.visible = off
				$Button_B/On.visible = on
			JoyButton.JOY_BUTTON_X:
				$Button_X/Off.visible = off
				$Button_X/On.visible = on
			JoyButton.JOY_BUTTON_Y:
				$Button_Y/Off.visible = off
				$Button_Y/On.visible = on
			JoyButton.JOY_BUTTON_START:
				$Button_Menu/Off.visible = off
				$Button_Menu/On.visible = on
			JoyButton.JOY_BUTTON_BACK:
				$Button_View/Off.visible = off
				$Button_View/On.visible = on
			JoyButton.JOY_BUTTON_LEFT_SHOULDER:
				$Button_LB/Off.visible = off
				$Button_LB/On.visible = on
			JoyButton.JOY_BUTTON_RIGHT_SHOULDER:
				$Button_RB/Off.visible = off
				$Button_RB/On.visible = on
			JoyButton.JOY_BUTTON_DPAD_UP:
				$Button_DPAD/Up.visible = on
			JoyButton.JOY_BUTTON_DPAD_DOWN:
				$Button_DPAD/Down.visible = on
			JoyButton.JOY_BUTTON_DPAD_LEFT:
				$Button_DPAD/Left.visible = on
			JoyButton.JOY_BUTTON_DPAD_RIGHT:
				$Button_DPAD/Right.visible = on
	else:
		print(event.as_text())

# Called every frame. 'delta' is the elapViewed time since the previous frame.
func _process(delta: float) -> void:
	pass
