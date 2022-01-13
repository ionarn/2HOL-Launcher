extends HBoxContainer

signal spawn_seed_value_changed

var selected_id = 0
var popup_panel_size_y = 0
var popup_smaller = false
var cursor_over_button = false
var getting_closed = false
var section = 'seeds'
var key = 'seeds'

var i = 0

# - - - - - - - - - - - - - - - - - - - - - - - -

func load_values():
	var config = ConfigFile.new()
	var load_response = config.load(TL_Path.launcher_settings)
	
	TL_Node.seed_popup.connect("item_selected", self, "_on_seed_dropdown_item_selected")
	TL_Node.seed_popup.connect("pressed_add", self, "_on_seed_dropdown_add_item_pressed")
	TL_Node.seed_popup.connect("pressed_remove", self, "_on_seed_dropdown_remove_item_pressed")
	TL_Node.seed_reset.connect("button_pressed", self, "_on_sps_reset_button_pressed")
	TL_Node.seed_popup.connect("becomes_hidden", self, "_on_seed_popup_becomes_hidden")
	TL_Node.seed_value_script.connect("spawn_seed_value_changed", self, "_on_sed_sv_lineedit_text_changed")
	
	var file = File.new()
	if file.file_exists(TL_Path.launcher_settings) == true and config.has_section('seeds') == true:
		add_seeds_to_dropdown()
		load_seed_data(TL_Node.seed_popup.get_selected())
		TL_Node.seed_popup.default_check(TL_Node.seed_popup.get_selected(), [TL_Node.seed_name, TL_Node.seed_value], TL_Node.seed_reset)
#	else:
#		config.set_value("seeds", "seeds", [{
#			"note": "Default",
#			"seed": ""
#			} ])
#		config.set_value("seeds", "seed_index", 0)
#		config.save(TL_Path.launcher_settings)


# Called when the node enters the scene tree for the first time.
#func _ready():
#	TL_Node.sps_popup.connect("item_selected", self, "_on_seed_dropdown_item_selected")
#	TL_Node.sps_popup.connect("pressed_add", self, "_on_seed_dropdown_add_item_pressed")
#	TL_Node.sps_popup.connect("pressed_remove", self, "_on_seed_dropdown_remove_item_pressed")
#	TL_Node.sps_reset.connect("button_pressed", self, "_on_sps_reset_button_pressed")
	
#	var seeds_list = config.get_value(section, key)
#	for item in seeds_list:
#		var s = entry.instance()
#		s.name = "id_%d" % i
#		s.get_node("entry_selection").text = item['note']
#		sps_popup.find_node('sps_container').add_child(s)
#		sps_container.add_child(s)
#		i += 1
	
#	var seed_index = config.get_value(section, 'seed_index')
#	sps_popup.select(seed_index)
#	sps_spawn_seed.text = seeds_list[seed_index]['seed']
#	sps_note.text = seeds_list[seed_index]['note']
#	sps_popup.find_node('sps_container').get_child(seed_index)\
#			.find_node('entry_selection').icon = radio_checked
#	sps_popup.find_node('sps_container').get_child(0)\
#			.find_node('entry_removal').visible = false
#	if seed_index == 0:
#		sps_spawn_seed.editable = false
#		sps_note.editable = false
#	else:
#		sps_spawn_seed.editable = true
#		sps_note.editable = true


func _on_sps_button_pressed():
	TL_Node.seed_popup_button.mouse_filter = 2
	
	TL_Node.seed_popup.set_position(Vector2(TL_Node.seed_name.get_global_position().x, 
			TL_Node.seed_name.get_global_position().y + TL_Node.seed_name.rect_size.y + 4))
	TL_Node.seed_popup.rect_size.x = (TL_Node.seed_name.rect_size.x + TL_Node.seed_popup_button.rect_size.x + 4)
	TL_Node.seed_popup.rect_size.y = 0
	TL_Node.seed_popup.popup()


func _on_seed_popup_becomes_hidden():
	TL_Node.seed_timer.start()


func _on_sed_timer_timeout():
	TL_Node.seed_popup_button.mouse_filter = 0


func _on_seed_dropdown_item_selected(index):
	var config = ConfigFile.new()
	var load_response = config.load(TL_Path.launcher_settings)
	
	TL_Node.seed_popup_button.mouse_filter = 0
	var seeds_list = config.get_value(section, key)
	if config.has_section(section) == true:
		config.set_value(section, 'seed_index', index)
		config.save(TL_Path.launcher_settings)
		TL_Node.seed_value.text = seeds_list[index]['seed']
		TL_Node.seed_name.text = seeds_list[index]['note']
		var le_seed_list = [TL_Node.seed_value, TL_Node.seed_name]
		TL_Node.seed_popup.default_check(index, le_seed_list, TL_Node.seed_reset)
		
		save_ini()
#			else:
#				file.open("./settings/email.ini", File.WRITE) # the file is now opened in the background
#				file.store_string(username + "|" + str(sps_spawn_seed.text))
#				file.close()
		
#		var file = File.new() #new file class on which you will call file class methods
#		file.open("./settings/email.ini", File.READ) # the file is now opened in the background
#		var username = file.get_as_text()
#		file.open("./settings/email.ini", File.WRITE) # the file is now opened in the background
#		file.store_string(username + "|" + str(sps_spawn_seed.text))
#		file.close()


func _on_seed_dropdown_add_item_pressed():
	var config = ConfigFile.new()
	var load_response = config.load(TL_Path.launcher_settings)
	
	if config.has_section(section) == true:
		var my_var = config.get_value(section, key)
		my_var.append({'seed': '', 'note': ''})
		config.set_value(section, key, my_var)
		config.save(TL_Path.launcher_settings)


func _on_seed_dropdown_remove_item_pressed(index):
	var config = ConfigFile.new()
	var load_response = config.load(TL_Path.launcher_settings)
	
	var seeds_list = config.get_value(section, key)
	if seeds_list.size() > 1:
		seeds_list.remove(index)
		config.set_value(section, key, seeds_list)
		config.save(TL_Path.launcher_settings)


func _on_sps_reset_button_pressed():
	TL_Node.seed_popup.select(0)


func assign_indeces():
	var index = 0
	for item in TL_Node.seed_popup_container.get_children():
		item.id = index
		index += 1


func _on_sed_sv_lineedit_text_changed(new_text):
	var config = ConfigFile.new()
	var load_response = config.load(TL_Path.launcher_settings)
	
	var seed_value = config.get_value(section, key)
	seed_value[TL_Node.seed_popup.get_selected()]['seed'] = new_text
	config.set_value(section, key, seed_value)
	config.save(TL_Path.launcher_settings)
	
	save_ini()


#func _on_sps_spawn_seed_text_changed(new_text):
#	var seed_value = config.get_value(section, key)
#	seed_value[TL_Node.seed_popup.get_selected()]['seed'] = new_text
#	config.set_value(section, key, seed_value)
#	config.save(TL_Path.launcher_settings)
#
#	save_ini()


func save_ini():
	if TL_Variables.startup_load_finished == true:
		var config = ConfigFile.new()
		var load_response = config.load(TL_Path.launcher_settings)
		
		var all_seeds = config.get_value("seeds", "seeds")
		var selected_seed = int(config.get_value("seeds", "seed_index"))
#		print(str(selected_seed))
		var seed_string = all_seeds[selected_seed]["seed"] + "\n"
#		print("SEED_STRING: " + str(all_seeds[selected_seed]))
#		print("SELECTED_SEED: " + str(selected_seed))
		
		var current_seed_index = 0
		for item in all_seeds:
			if current_seed_index != selected_seed:
				if current_seed_index != len(all_seeds) - 1:
					if selected_seed == len(all_seeds) - 1 and current_seed_index == len(all_seeds) - 2:
						seed_string += item["seed"]
					else:
						seed_string += item["seed"] + "\n"
				else:
					seed_string += item["seed"]
			current_seed_index += 1
		
		var file = File.new()
		file.open(TL_Path.spawn_seed, file.WRITE)
		file.store_string(seed_string)
		file.close()


func _on_sps_note_text_changed(new_text):
	var config = ConfigFile.new()
	var load_response = config.load(TL_Path.launcher_settings)
	
	TL_Node.seed_popup.set_item_text(TL_Node.seed_popup.get_selected(), new_text)
	var seed_value = config.get_value(section, key)
	seed_value[TL_Node.seed_popup.get_selected()]['note'] = new_text
	config.set_value(section, key, seed_value)
	config.save(TL_Path.launcher_settings)
	
	save_ini()


func add_seeds_to_dropdown():
	var config = ConfigFile.new()
	var load_response = config.load(TL_Path.launcher_settings)
	
	var seed_list = config.get_value("seeds", "seeds")
	for item in seed_list:
		TL_Node.seed_popup.add_item(item["note"])
	TL_Node.seed_popup.select(config.get_value(section, "seed_index", null))
	TL_Node.seed_popup.get_items()[0].get_node("Control").visible = false


func load_seed_data(index):
	var config = ConfigFile.new()
	var load_response = config.load(TL_Path.launcher_settings)
	
	var selected_seed_data = config.get_value(section, key, null)
	TL_Node.seed_name.text = selected_seed_data[index]["note"]
	TL_Node.seed_value.text = selected_seed_data[index]["seed"]
	
	var seed_index = config.get_value(section, "seed_index")
	TL_Node.seed_popup.select(int(seed_index))


#func _on_scrl_basic_draw():
#	print("I MUST REDRAW, MAN!")
