extends HBoxContainer

''' VARIABLES '''

var option_0x = "1920"
var option_0y = "1080"
var option_1x = "1600"
var option_1y = "900"
var option_2x = "1280"
var option_2y = "720"
var option_3x = "960"
var option_3y = "540"
var option_4x = "640"
var option_4y = "360"

################################################################

# Loads the Resolutions values to the Lineedit and custom Dropdown menu.
func load_value():
	TL_Node.resolution_reset.connect('button_pressed', self, 'on_res_reset_pressed')
	
	var file = File.new()
	if file.file_exists(TL_Path.resolution_x) == true and file.file_exists(TL_Path.resolution_y) == true and file.file_exists(TL_Path.launcher_settings) == true:
		res_load_values()
		res_reset_button_visibility()
	file.close()


# Called when the node enters the scene tree for the first time.
#func _ready():
#	TL_Node.resolution_reset.connect('button_pressed', self, 'on_res_reset_pressed')


func _on_res_dropdown_item_selected(_index):
	res_apply_dropdown_to_lineedit()
	res_reset_button_visibility()


func on_res_reset_pressed():
	TL_Node.resolution_dropdown.selected = TL_Default.resolution_selected
	TL_Node.resolution_le_x.text = str(TL_Default.resolution_x)
	res_x_write(TL_Node.resolution_le_x.text)
	TL_Node.resolution_le_y.text = str(TL_Default.resolution_y)
	res_y_write(TL_Node.resolution_le_y.text)
	res_reset_button_visibility()


func _on_res_horizontal_text_changed(new_text):
	res_check_if_valid_integer(new_text, TL_Node.resolution_le_x)
	res_x_write(TL_Node.resolution_le_x.text)
	res_available_option(TL_Node.resolution_le_x.text, TL_Node.resolution_le_y.text)
	res_reset_button_visibility()


func _on_res_vertical_text_changed(new_text):
	res_check_if_valid_integer(new_text, TL_Node.resolution_le_y)
	res_y_write(TL_Node.resolution_le_y.text)
	res_available_option(TL_Node.resolution_le_x.text, TL_Node.resolution_le_y.text)
	res_reset_button_visibility()


func _on_res_dropdown_pressed():
	var le_x_pos_x = TL_Node.resolution_le_x.get_global_position().x
	var le_x_pos_y = TL_Node.resolution_le_x.get_global_position().y
	var le_x_size_x = TL_Node.resolution_le_x.rect_size.x
	var le_x_size_y = TL_Node.resolution_le_x.rect_size.y
	var le_multi_size_x = TL_Node.resolution_multi.rect_size.x
	var le_y_size_x = TL_Node.resolution_le_y.rect_size.x
	var drp_size_x = TL_Node.resolution_dropdown.rect_size.x
	
	TL_Node.resolution_dropdown.get_popup().set_position(Vector2(le_x_pos_x, (le_x_pos_y + le_x_size_y + 4) ))
	TL_Node.resolution_dropdown.get_popup().rect_size.x = (le_x_size_x + le_multi_size_x + le_y_size_x + drp_size_x + 4)


func res_load_values():
	var file_x = File.new() #new file class on which you will call file class methods
	file_x.open(TL_Path.resolution_x, File.READ)  #the file is now opened in the background
	TL_Node.resolution_le_x.text = file_x.get_as_text()
	var file_y = File.new() #new file class on which you will call file class methods
	file_y.open(TL_Path.resolution_y, File.READ)  #the file is now opened in the background
	TL_Node.resolution_le_y.text = file_y.get_as_text()
	res_available_option(file_x.get_as_text(), file_y.get_as_text())
	file_x.close()
	file_y.close()


func res_available_option(compare_x, compare_y):
	if compare_x == option_0x and compare_y == option_0y:
		TL_Node.resolution_dropdown.selected = 0
	elif compare_x == option_1x and compare_y == option_1y:
		TL_Node.resolution_dropdown.selected = 1
	elif compare_x == option_2x and compare_y == option_2y:
		TL_Node.resolution_dropdown.selected = 2
	elif compare_x == option_3x and compare_y == option_3y:
		TL_Node.resolution_dropdown.selected = 3
	elif compare_x == option_4x and compare_y == option_4y:
		TL_Node.resolution_dropdown.selected = 4
	else:
		TL_Node.resolution_dropdown.selected = 5


func res_reset_button_visibility():
	if TL_Node.resolution_le_x.text == str(TL_Default.resolution_x) and TL_Node.resolution_le_y.text == str(TL_Default.resolution_y):
		TL_Node.resolution_reset.set_visible(false)
	else:
		TL_Node.resolution_reset.set_visible(true)


func res_x_write(amount):
	if TL_Variables.startup_load_finished == true:
		var file = File.new() #new file class on which you will call file class methods
		file.open(TL_Path.resolution_x, file.WRITE)  #the file is now opened in the background
		file.store_string(amount)
		file.close()


func res_y_write(amount):
	if TL_Variables.startup_load_finished == true:
		var file = File.new() #new file class on which you will call file class methods
		file.open(TL_Path.resolution_y, file.WRITE)  #the file is now opened in the background
		file.store_string(amount)
		file.close()


func res_apply_dropdown_to_lineedit():
	if TL_Node.resolution_dropdown.selected == 0:
		TL_Node.resolution_le_x.text = option_0x
		res_x_write(option_0x)
		TL_Node.resolution_le_y.text = option_0y
		res_y_write(option_0y)
	
	elif TL_Node.resolution_dropdown.selected == 1:
		TL_Node.resolution_le_x.text = option_1x
		res_x_write(option_1x)
		TL_Node.resolution_le_y.text = option_1y
		res_y_write(option_1y)
	
	elif TL_Node.resolution_dropdown.selected == 2:
		TL_Node.resolution_le_x.text = option_2x
		res_x_write(option_2x)
		TL_Node.resolution_le_y.text = option_2y
		res_y_write(option_2y)
	
	elif TL_Node.resolution_dropdown.selected == 3:
		TL_Node.resolution_le_x.text = option_3x
		res_x_write(option_3x)
		TL_Node.resolution_le_y.text = option_3y
		res_y_write(option_3y)
	
	elif TL_Node.resolution_dropdown.selected == 4:
		TL_Node.resolution_le_x.text = option_4x
		res_x_write(option_4x)
		TL_Node.resolution_le_y.text = option_4y
		res_y_write(option_4y)


func res_check_if_valid_integer(the_text, line_edit):
	if !the_text.is_valid_integer():
		line_edit.delete_char_at_cursor()


#func _on_res_horizontal_ready():
##	LauncherNodes.register_node("resolution_le_x", LauncherNodes.get("res_horizontal"))
#	LauncherNodes.register_node(LauncherNodes.resolution_le_x, LauncherNodes.get("res_horizontal"))
##	LauncherNodes.resolution_le_x = LauncherNodes.get("res_horizontal")
#
#
#func _on_res_multiply_ready():
#	LauncherNodes.register_node(LauncherNodes.resolution_multi, LauncherNodes.get("res_multiply"))
#
#
#func _on_res_vertical_ready():
##	LauncherNodes.register_node("resolution_le_y", LauncherNodes.get("res_vertical"))
#	LauncherNodes.register_node(LauncherNodes.resolution_le_y, LauncherNodes.get("res_vertical"))
##	LauncherNodes.resolution_le_y = LauncherNodes.get("res_vertical")
#
#
#func _on_res_dropdown_ready():
#	LauncherNodes.register_node(LauncherNodes.resolution_dropdown, LauncherNodes.get("res_dropdown"))
#
#
#func _on_res_reset_ready():
#	LauncherNodes.register_node(LauncherNodes.resolution_reset, LauncherNodes.get("res_reset"))
