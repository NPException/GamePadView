extends ColorRect

@onready var label := $RichTextLabel

@export var scroll_speed : float = 30.0

var current_scroll_speed : float = scroll_speed


# This gives this CanvasItem a "clipping mask" that only allows children to display within it's rect.
func _draw() -> void:
	#RenderingServer.canvas_item_set_clip(get_canvas_item(), true)
	pass


func show_text() -> void:
	if visible:
		current_scroll_speed *= 1.5
		return
	
	current_scroll_speed = scroll_speed
	label.clear()
	label.size.y = 1
	var file := FileAccess.open("res://scroll.txt", FileAccess.READ)
	if (file == null):
		file = FileAccess.open("res://default_scroll.txt", FileAccess.READ)
	if (file == null):
		return
	label.append_text(file.get_as_text())
	label.size.y = label.get_minimum_size().y
	label.position.y = self.size.y
	visible = true


func _process(delta: float) -> void:
	if not visible:
		return
	label.position.y -= current_scroll_speed * delta
	if label.position.y < -label.size.y:
		visible = false
