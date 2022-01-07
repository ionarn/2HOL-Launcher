extends HBoxContainer


#func finding_nodes(node_name):
#	return get_tree().get_root().find_node(node_name, true, false)


''' VARIABLES '''
var following = false
var dragging_start_pos = Vector2()
#onready var window_resize_ctrl = finding_nodes('window_resize')
#onready var maximize_button = finding_nodes('tb_maximize')
onready var menu_button = TL_Func.finding_nodes("tb_menu")

#	-------------------------------------------------------

''' ON LAUNCHER START '''
#func _ready():
#	OS.set_min_window_size(Vector2(200,200))
#	menu_button.get_popup().add_submenu_item('helping', 'helping', 0)
#	menu_button.get_popup().connect('id_pressed', self, '_on_item_pressed')
	
#	var file = File.new() # new file class on which you will call file class methods
#	file.open(TL_Path.data_version_number, File.READ) # the file is now opened in the background
#	$Version.text = "2HOL Version " + file.get_as_text()
#	file.close()
	
#	$Version.text = "2HOL Version " + ""

func connect_item_pressed():
	menu_button.get_popup().connect('id_pressed', self, '_on_item_pressed')


func _on_item_pressed(id):
	var index = menu_button.get_popup().get_current_index()
	if index == 3:
		closeProgram()


''' ON DELTA '''
func _process(_delta):
	if following:
		OS.window_position = OS.window_position + get_global_mouse_position() - dragging_start_pos


''' ON MAXIMIZE BUTTON PRESSED '''
func _on_Btn_Maximixe_pressed():
	maximized_behaviour_change()


''' ON MOUSE BUTTON PRESSED OR DOUBLE CLICKED '''
func _on_HBox_TitleBar_gui_input(event):
#	if OS.window_maximized == true:
#		is_maximized(event)
#	elif OS.window_maximized == false:
#		is_maximized(event)
	if event is InputEventMouseButton:
		if event.get_button_index() == 1:
			following = !following
			dragging_start_pos = get_local_mouse_position()


''' ON MINIMIZE BUTTON PRESSED '''
func _on_WC_Minimize_pressed():
	OS.window_minimized = true


''' ON CLOSE BUTTON PRESSED '''
func _on_WC_Close_pressed():
	closeProgram()

#	-------------------------------------------------------

''' ON CLOSE BUTTON PRESSED '''
func is_maximized(event):
	if event is InputEventMouseButton and event.doubleclick:
		if event.get_button_index() == 1:
			maximized_behaviour_change()


''' CHANGE BEHAVIOUR IF MAXIMIZED '''
func maximized_behaviour_change():
	if OS.window_maximized:
		OS.window_maximized = false
		TL_Node.window_resize_control.visible = true
#		var maximize_normal = preload('res://Icons/WC_Maximize.png')
		TL_Node.maximize_button.texture_normal = TL_Icon.maximize_normal
#		var maximize_hover = preload('res://Icons/WC_Maximize_Hover.png')
		TL_Node.maximize_button.texture_hover = TL_Icon.maximize_hover
#		var maximize_pressed = preload('res://Icons/WC_Maximize_Pressed.png')
		TL_Node.maximize_button.texture_pressed = TL_Icon.maximize_pressed
	elif OS.window_maximized == false:
		TL_Node.window_resize_control.visible = false
		OS.window_maximized = true
#		var windowed_normal = preload('res://Icons/WC_Windowed.png')
		TL_Node.maximize_button.texture_normal = TL_Icon.windowed_normal
#		var windowed_hover = preload('res://Icons/WC_Windowed_Hover.png')
		TL_Node.maximize_button.texture_hover = TL_Icon.windowed_hover
#		var windowed_pressed = preload('res://Icons/WC_Windowed_Pressed.png')
		TL_Node.maximize_button.texture_pressed = TL_Icon.windowed_pressed


''' CLOSE LAUNCHER '''
func closeProgram():
	get_tree().quit()


func _on_VSplitContainer_dragged(offset):
	if offset <= 30:
		TL_Node.bnr_label.visible = false
	else:
		TL_Node.bnr_label.visible = true
	
	var max_offset = 200
	if offset > max_offset:
		TL_Node.vsplitcontainer.split_offset = max_offset
