extends HBoxContainer

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


func _on_ctb_checkbutton_toggled(button_pressed):
	if button_pressed == true:
		TL_Node.title_bar.visible = true
		OS.set_borderless_window(true)
		TL_Node.window_resize_control.visible = true
	else:
		TL_Node.title_bar.visible = false
		OS.set_borderless_window(false)
		TL_Node.window_resize_control.visible = false
