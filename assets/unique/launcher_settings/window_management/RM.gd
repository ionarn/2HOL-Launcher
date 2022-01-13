extends Control

var following = false
var mouse_offset
var window_position
var window_size
var distance_to_edge
var mouse_pressed = false

var origin_windows_size
var origin_window_position

export(
		String,
		"Top-Left",
		"Top",
		"Top-Right",
		"Left",
		"Right",
		"Bottom-Left",
		"Bottom",
		"Bottom-Right") var side
var window_min_size_x = 680
var window_min_size_y = 540
var window_max_size_x = 1280
var window_max_size_y = 720


# Called when the node enters the scene tree for the first time.
func _ready():
	if side == "Bottom":	# Bottom
		distance_to_edge = OS.window_size.y - rect_global_position.y
	
	elif side == "Left":	# Left
		distance_to_edge = rect_global_position.x
	
	elif side == "Top":	# Top
		distance_to_edge = OS.window_size.y - rect_global_position.y
	
	elif side == "Right":	# Right
		distance_to_edge = rect_global_position.x - OS.window_size.x
	
	OS.min_window_size = Vector2(window_min_size_x, window_min_size_y)
	OS.max_window_size = Vector2(window_max_size_x, window_max_size_y)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if following:
		if side == "Bottom" and Input.is_mouse_button_pressed(1):
			OS.window_size.y = clamp(get_global_mouse_position().y + distance_to_edge - mouse_offset.y, window_min_size_y, window_max_size_y)
		
		elif side == "Left" and Input.is_mouse_button_pressed(1):
			OS.window_size.x = clamp(window_size.x + (window_position.x - OS.window_position.x), window_min_size_x, window_max_size_x)
			OS.window_position.x = clamp((OS.window_position.x + get_global_mouse_position().x - mouse_offset.x) - distance_to_edge, origin_window_position.x + origin_windows_size.x - window_max_size_x, origin_window_position.x + origin_windows_size.x - window_min_size_x)
		
		elif side == "Top" and Input.is_mouse_button_pressed(1):
			OS.window_size.y = clamp(window_size.y + (window_position.y - OS.window_position.y), window_min_size_y, window_max_size_y)
			OS.window_position.y = clamp(OS.window_position.y + get_global_mouse_position().y - mouse_offset.y, origin_window_position.y + origin_windows_size.y - window_max_size_y, origin_window_position.y + origin_windows_size.y - window_min_size_y)
		
		elif side == "Right" and Input.is_mouse_button_pressed(1):
			OS.window_size.x = clamp(get_global_mouse_position().x - distance_to_edge - mouse_offset.x, window_min_size_x, window_max_size_x)


func scale_input(event):
	if event is InputEventMouseButton:
		if event.pressed == true:
			origin_windows_size = OS.window_size
			origin_window_position = OS.window_position
		if event.get_button_index() == 1:
			mouse_offset = get_local_mouse_position()
			window_position = OS.window_position
			window_size = OS.window_size
			following = !following


func _on_RM_gui_input(event):
	scale_input(event)

func _on_BM_gui_input(event):
	scale_input(event)

func _on_LM_gui_input(event):
	scale_input(event)

func _on_TM_gui_input(event):
	scale_input(event)
