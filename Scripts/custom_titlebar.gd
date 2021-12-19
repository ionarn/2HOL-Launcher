extends HBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ctb_checkbutton_toggled(button_pressed):
	if button_pressed == true:
		TL_Node.title_bar.visible = true
		OS.set_borderless_window(true)
#		ProjectSettings.set_setting("display/window/size/borderless", "false")
	else:
		TL_Node.title_bar.visible = false
		OS.set_borderless_window(false)
#		ProjectSettings.set_setting("display/window/size/borderless", "true")
