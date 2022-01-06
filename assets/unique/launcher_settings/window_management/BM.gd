extends Control

var following = false
var mouse_offset = get_local_mouse_position()
var window_position = OS.window_position
var window_size = OS.window_size
var distance_to_edge = OS.window_size.y - rect_global_position.y

# Called when the node enters the scene tree for the first time.
func _ready():
	distance_to_edge = OS.window_size.y - rect_global_position.y


func _on_BM_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1:
			mouse_offset = get_local_mouse_position()
			window_position = OS.window_position
			window_size = OS.window_size
			following = !following


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if following:
		OS.window_size.y = get_global_mouse_position().y + distance_to_edge - mouse_offset.y
		rect_position.y = OS.window_size.y - distance_to_edge
