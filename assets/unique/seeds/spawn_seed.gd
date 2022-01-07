extends HBoxContainer

var selected_id = 0
var popup_panel_size_y = 0
var popup_smaller = false
var cursor_over_button = false
var getting_closed = false
var section = 'seeds'
var key = 'seeds'

var launcher_settings_path = "./settings/launcher_settings.ini"
var config = ConfigFile.new()
var load_response = config.load(launcher_settings_path)
var i = 0

# - - - - - - - - - - - - - - - - - - - - - - - -

func load_values():
	TL_Node.sps_popup.connect("item_selected", self, "_on_seed_dropdown_item_selected")
	TL_Node.sps_popup.connect("pressed_add", self, "_on_seed_dropdown_add_item_pressed")
	TL_Node.sps_popup.connect("pressed_remove", self, "_on_seed_dropdown_remove_item_pressed")
	TL_Node.sps_reset.connect("button_pressed", self, "_on_sps_reset_button_pressed")
	
	var file = File.new()
	if file.file_exists(TL_Path.launcher_settings) == true and config.has_section('seeds') == true:
		add_seeds_to_dropdown()
		load_seed_data(TL_Node.sps_popup.get_selected())
		TL_Node.sps_popup.default_check(TL_Node.sps_popup.get_selected(), [TL_Node.sps_note, TL_Node.sps_spawn_seed], TL_Node.sps_reset)
	else:
		config.set_value("seeds", "seeds", [{
			"note": "Default",
			"seed": ""
			} ])
		config.set_value("seeds", "seed_index", 0)
		config.save(TL_Path.launcher_settings)


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
	TL_Node.sps_popup.set_position(Vector2(TL_Node.sps_note.get_global_position().x, 
			TL_Node.sps_note.get_global_position().y + TL_Node.sps_note.rect_size.y + 4))
	TL_Node.sps_popup.rect_size.x = (TL_Node.sps_note.rect_size.x + TL_Node.sps_button.rect_size.x + 4)
	TL_Node.sps_popup.rect_size.y = 0
	TL_Node.sps_popup.popup()


func _on_seed_dropdown_item_selected(index):
	var seeds_list = config.get_value(section, key)
	if config.has_section(section) == true:
		config.set_value(section, 'seed_index', index)
		config.save(TL_Path.launcher_settings)
		TL_Node.sps_spawn_seed.text = seeds_list[index]['seed']
		TL_Node.sps_note.text = seeds_list[index]['note']
		var le_seed_list = [TL_Node.sps_spawn_seed, TL_Node.sps_note]
		TL_Node.sps_popup.default_check(index, le_seed_list, TL_Node.sps_reset)
		
		var file = File.new() #new file class on which you will call file class methods
		file.open(TL_Path.username, File.READ) # the file is now opened in the background
		
		if config.get_value(section, key)[index]["seed"] == "":
			var username1 = file.get_as_text()
			if "|" in username1:
				username1 = username1.replace(username1.right(username1.find("|")), "")
				file.open(TL_Path.username, File.WRITE) # the file is now opened in the background
				file.store_string(username1)
				file.close()
		else:
			var username2 = file.get_as_text()
			file.open(TL_Path.username, File.WRITE) # the file is now opened in the background
			if "|" in username2:
				var un_left = username2.left(username2.find("|"))
				username2 = (un_left + "|" + seeds_list[index]["seed"])
				file.store_string(username2)
			else:
				username2 = (username2 + "|" + seeds_list[index]["seed"])
				file.store_string(username2)
			file.close()
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
	if config.has_section(section) == true:
		var my_var = config.get_value(section, key)
		my_var.append({'seed': '', 'note': ''})
		config.set_value(section, key, my_var)
		config.save(launcher_settings_path)


func _on_seed_dropdown_remove_item_pressed(index):
	var seeds_list = config.get_value(section, key)
	if seeds_list.size() > 1:
		seeds_list.remove(index)
		config.set_value(section, key, seeds_list)
		config.save(TL_Path.launcher_settings)


func _on_sps_reset_button_pressed():
	TL_Node.sps_popup.select(0)


func assign_indeces():
	var index = 0
	for item in TL_Node.sps_container.get_children():
		item.id = index
		index += 1


func _on_sps_spawn_seed_text_changed(new_text):
#	config.get_value('seeds', 'seeds')
#	config.save(launcher_settings_path)
	var seed_value = config.get_value(section, key)
	seed_value[TL_Node.sps_popup.get_selected()]['seed'] = new_text
	config.set_value(section, key, seed_value)
	config.save(TL_Path.launcher_settings)
	
	var file = File.new() #new file class on which you will call file class methods
	file.open(TL_Path.username, File.READ) # the file is now opened in the background
	var username1 = file.get_as_text()
	file.open(TL_Path.username, File.WRITE) # the file is now opened in the background
	if new_text.empty() == false:
		if "|" in username1:
			username1 = username1.replace(username1.right(username1.find("|")), ("|" + new_text))
			file.store_string(username1)
		elif !"|" in username1:
			username1 = username1 + "|" + new_text
			file.store_string(username1)
	elif new_text.empty() == true:
		if "|" in username1:
			file.store_string(username1.left(username1.find("|")))
		elif "|" in username1 == false:
			file.store_string(username1)
	file.close()


func _on_sps_note_text_changed(new_text):
	TL_Node.sps_popup.set_item_text(TL_Node.sps_popup.get_selected(), new_text)
	var seed_value = config.get_value(section, key)
	seed_value[TL_Node.sps_popup.get_selected()]['note'] = new_text
	config.set_value(section, key, seed_value)
	config.save(TL_Path.launcher_settings)


func add_seeds_to_dropdown():
	var seed_list = config.get_value("seeds", "seeds")
	for item in seed_list:
		TL_Node.sps_popup.add_item(item["note"])
	TL_Node.sps_popup.select(config.get_value(section, "seed_index", null))
	TL_Node.sps_popup.get_items()[0].find_node("entry_removal").visible = false


func load_seed_data(index):
	var selected_seed_data = config.get_value(section, key, null)
	TL_Node.sps_note.text = selected_seed_data[index]["note"]
	TL_Node.sps_spawn_seed.text = selected_seed_data[index]["seed"]
	
	var seed_index = config.get_value(section, "seed_index")
	TL_Node.sps_popup.select(int(seed_index))
