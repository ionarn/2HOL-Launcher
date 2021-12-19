extends Control

var following = false
var mouse_offset
var window_position
var window_size
var distance_to_edge
var mouse_pressed = false
#export (bool) var left = false
#export (bool) var bottom = true
#export (bool) var top = false
export (int) var side = 0
var window_min_size_x = 680
var window_min_size_y = 540
var window_max_size_x = 1080
var window_max_size_y = 1920


# Called when the node enters the scene tree for the first time.
func _ready():
	if side == 0:	# Bottom
		distance_to_edge = OS.window_size.y - rect_global_position.y
	elif side == 1:	# Left
		distance_to_edge = rect_global_position.x
	elif side == 2:	# Top
		distance_to_edge = OS.window_size.y - rect_global_position.y
	elif side == 3:	# Right
		distance_to_edge = rect_global_position.x - OS.window_size.x


# Called every frame. 'delta' is the elapsed time since the previous frame.

#---------------------------------------
#func _process(_delta):
#	if following:
#		if vertical:
#			OS.window_size.y = get_global_mouse_position().y + distance_to_edge - mouse_offset.y
#			rect_position.y = OS.window_size.y - distance_to_edge
#		else:
#			if left:
#				OS.window_position.x = (OS.window_position + get_global_mouse_position() - mouse_offset).x - distance_to_edge
#				OS.window_size.x = window_size.x + (window_position.x - OS.window_position.x)
#			else:
#				OS.window_size.x = get_global_mouse_position().x - distance_to_edge - mouse_offset.x
#	if vertical == false and left == false:
#		rect_global_position.x = OS.window_size.x + distance_to_edge
#---------------------------------------


func _process(_delta):
#	if Input.is_mouse_button_pressed(1):
	if following:
		if side == 0 and Input.is_mouse_button_pressed(1):		# Bottom Mid
			OS.window_size.y = clamp((get_global_mouse_position().y + distance_to_edge - mouse_offset.y), window_min_size_y, window_max_size_y)
			rect_position.y = OS.window_size.y - distance_to_edge
		elif side == 1 and Input.is_mouse_button_pressed(1):		# Left Mid
			OS.window_position.x = (OS.window_position + get_global_mouse_position() - mouse_offset).x - distance_to_edge
			OS.window_size.x = clamp((window_size.x + (window_position.x - OS.window_position.x)), window_min_size_x, window_max_size_x)
#		elif side == 2 and Input.is_mouse_button_pressed(1):		# Top Mid
#			OS.window_size.y = get_global_mouse_position().y + distance_to_edge - mouse_offset.y
#			rect_position.y = OS.window_size.y - distance_to_edge
		elif side == 3 and Input.is_mouse_button_pressed(1):		# Right Mid
			OS.window_size.x = clamp((get_global_mouse_position().x - distance_to_edge - mouse_offset.x), window_min_size_x, window_max_size_x)
	#		if bottom == false and left == false:
	#		if side != 0 and side != 1:
	#			rect_global_position.x = OS.window_size.x + distance_to_edge
	
	
#	if Input.is_mouse_button_pressed(1):
##		print('Left Mouse Button Is Pressed.', get_viewport().get_mouse_position())
#		following == true
#	else:
#		following == false


#func mouse_clicked(event):
#	if event is InputEventMouseButton:
#		if event.get_button_index() == 1:
#			mouse_pressed == true
#			print(mouse_pressed)
#		else:
#			mouse_pressed == false
#			print(mouse_pressed)


func scale_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1:
			mouse_offset = get_local_mouse_position()
			window_position = OS.window_position
			window_size = OS.window_size
			following = !following


func _on_RM_gui_input(event):
	scale_input(event)
#	mouse_clicked(event)

func _on_BM_gui_input(event):
	scale_input(event)
#	mouse_clicked(event)

func _on_LM_gui_input(event):
	scale_input(event)
#	mouse_clicked(event)

func _on_TM_gui_input(_event):
	pass
#	scale_input(event)
#	mouse_clicked(event)
