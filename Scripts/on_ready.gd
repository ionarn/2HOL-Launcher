extends Control

var launcher_settings = "./settings/launcher_settings.ini"
var i = 0
var j = 0

var config = ConfigFile.new()
var load_response = config.load(launcher_settings)

# F U N C T I O N S

# Called when the node enters the scene tree for the first time.
func _ready():
	TL_Signal.connect("emotion_ready", self, "_ready_emotion_ready")
	TL_Signal.connect("ready_load_checkbutton", self, "_ready_load_checkbutton")
	TL_Signal.connect("ready_load_spinbox", self, "_ready_load_spinbox")
	
	var file = File.new() # new file class on which you will call file class methods
	file.open(TL_Path.data_version_number, File.READ) # the file is now opened in the background
	TL_Node.version.text = "2HOL Version " + file.get_as_text()
	
	file.open(TL_Path.binary, File.READ)
	TL_Node.bnr_label.text = file.get_as_text()
	
	file = File.new() # new file class on which you will call file class methods
	if file.file_exists(TL_Path.game_file) == false: # NEEDS TO BE SET TO FALSE!!! (When OneLife.exe exists)
		TL_Node.pop_popup_background.visible = true
		TL_Node.pop_wrong_directory.popup()
	elif file.file_exists(TL_Path.game_file) == true: # NEEDS TO BE SET TO ELIF AND TRUE!!! (When OneLife.exe exists)
		
		# Loads the Username value to the Username Lineedit.
		if file.file_exists(TL_Path.username) == true:
			TL_Node.ld_login_data.load_le_data(TL_Path.username, TL_Node.ld_username)
		
		# Loads the Key value to the Key Lineedit.
		if file.file_exists(TL_Path.key) == true:
			TL_Node.ld_login_data.load_le_data(TL_Path.key, TL_Node.ld_key)
		
		# Loads the Resolutions values to the Lineedit and custom Dropdown menu.
		if file.file_exists(TL_Path.resolution_x) == true and file.file_exists(TL_Path.resolution_y) == true and file.file_exists(TL_Path.launcher_settings) == true:
			TL_Node.resolution.res_load_values()
			TL_Node.resolution.res_reset_button_visibility()
		
#		if file.file_exists(TL_Path.)
		
		if file.file_exists(TL_Path.emotion_words) == true:
			TL_Variables.file_exists_emotion_words = true
		else:
			TL_Variables.file_exists_emotion_words = false
		
		# Checks if the launcher_settings.ini exists.
		if file.file_exists(TL_Path.launcher_settings) == true:
			# Add and rename entries to 'Seed Name' and 'Spawn Seed'
			
			# S E E D S
			# Checks if launcher_settings.ini has section "seeds".
			if config.has_section('seeds') == true:
				TL_Node.spawn_seed.add_seeds_to_dropdown()
				TL_Node.spawn_seed.load_seed_data(TL_Node.sps_popup.get_selected())
				TL_Node.sps_popup.default_check(TL_Node.sps_popup.get_selected(), [TL_Node.sps_note, TL_Node.sps_spawn_seed], TL_Node.sps_reset)
#			else:
#				config.load(TL_Path.launcher_settings)
#				config.set_value("seeds", "seeds", [{
#					"seed": "",
#					"note": "Default"
#					}, ])
#				var seeds_list = config.get_value("seeds", "seeds")
#				for sps_item in seeds_list:
#					var s = entry.instance()
#					s.name = "id_%d" % i
##					s.get_node("entry_selection").text = sps_item['note']
#					if sps_item["note"] == "":
#						s.get_node("entry_selection").text = "New Seed " + str(i)
#					else:
#						s.get_node("entry_selection").text = sps_item['note']
#					TL_Node.sps_popup.find_node('sps_container').add_child(s)
#					i += 1
#				var seed_index = int(config.get_value("seeds", "seed_index"))
#				TL_Node.sps_popup.select(seed_index)
#				TL_Node.sps_spawn_seed.text = seeds_list[seed_index]['seed']
#				TL_Node.sps_note.text = seeds_list[seed_index]['note']
##				nodes.sps_popup.find_node('sps_container').get_child(seed_index)\
##						.find_node('entry_selection').icon = radio_checked
#				TL_Node.sps_popup.find_node('sps_container').get_child(0)\
#						.find_node('entry_removal').visible = false
#				if seed_index == 0:
#					TL_Node.sps_spawn_seed.editable = false
#					TL_Node.sps_note.editable = false
#				else:
#					TL_Node.sps_spawn_seed.editable = true
#					TL_Node.sps_note.editable = true
#			else:
##				config.load(FilePath.launcher_settings)
#				config.set_value("seeds", "seeds", [{
#					"seed": "",
#					"note": "Default"
#					}, ])
#				config.set_value("seeds", "seed_index", 0)
#				config.save(TL_Path.launcher_settings)
#				print(config.get_value("seeds", "seeds"))
#				print(config.get_sections())
			
			# N E T W O R K
			# Checks if launcher_settings.ini has section "network".
			if config.has_section("network") == true:
				TL_Node.network.add_servers_to_dropdown()
				TL_Node.network.load_server_credentials(TL_Node.nw_popup.get_selected())
				var le_list = [TL_Node.server_name, TL_Node.address, TL_Node.port]
				TL_Node.nw_popup.default_check(TL_Node.nw_popup.selected, le_list, TL_Node.server_reset)
#				TL_Node.network.check_for_ini_cache_match()
			elif config.has_section("network") == false:
				config.set_value("network", 'server', [ {'server_name': TL_Default.server_name, 'address': TL_Default.address, 'port': TL_Default.port} ])
				config.set_value("network", 'server_index', 0)
				config.save(TL_Path.launcher_settings)
			
#			if config.has_section('network') == true:
#				var network_list = config.get_value("network", "server")
#				for nw_item in network_list:
#					var s = entry.instance()
#					s.name = "id_%d" % j
#					if nw_item["server_name"] == "":
#						s.get_node("entry_selection").text = "New Server " + str(j)
#					else:
#						s.get_node("entry_selection").text = nw_item['server_name']
#					TL_Node.nw_popup.find_node('sps_container').add_child(s)
#					j += 1
#				var server_index = config.get_value("network", "server_index")
#				print("SERVER_INDEX is: ", str(server_index))
#				TL_Node.nw_popup.select(server_index)
#				TL_Node.server_name.text = network_list[server_index]['server_name']
#				TL_Node.address.text = network_list[server_index]['address']
#				TL_Node.port.text = network_list[server_index]['port']
##				LauncherNodes.nw_popup.find_node('sps_container').get_child(server_index)\
##						.find_node('entry_selection').icon = radio_checked
#				TL_Node.nw_popup.find_node('sps_container').get_child(0)\
#						.find_node('entry_removal').visible = false
#				if server_index == 0:
#					TL_Node.server_name.editable = false
#					TL_Node.address.editable = false
#					TL_Node.port.editable = false
#				else:
#					TL_Node.server_name.editable = true
#					TL_Node.address.editable = true
#					TL_Node.port.editable = true
#			else:
##				config.load(FilePath.launcher_settings)
#				config.set_value("network", "server", [{
#					"address": "",
#					"port": "",
#					"server_name": "New Server",
#					}, ])
#				config.set_value("network", "server_index", 0)
#				config.save(TL_Path.launcher_settings)
#				print(config.get_value("network", "server"))
#				print(config.get_sections())
			
			# A U D I O
			if config.has_section('audio') == true:
				TL_Node.audio.does_launcher_ini_exist()
				TL_Node.audio.load_slider_cache('audio_volume', TL_Node.audio_slider)
				TL_Node.audio.label_value(TL_Node.audio_slider.value, TL_Node.audio_label)
				TL_Node.audio.load_checkbutton_cache('audio_off', TL_Node.audio_checkbutton)

				TL_Node.audio.load_slider_cache('music_volume', TL_Node.music_slider)
				TL_Node.audio.label_value(TL_Node.music_slider.value, TL_Node.music_label)
				TL_Node.audio.load_checkbutton_cache('music_off', TL_Node.music_checkbutton)

				TL_Node.audio.load_slider_cache('sound_volume', TL_Node.sound_slider)
				TL_Node.audio.label_value(TL_Node.sound_slider.value, TL_Node.sound_label)
				TL_Node.audio.load_checkbutton_cache('sound_off', TL_Node.sound_checkbutton)

				TL_Node.audio.audio_toggle()

				TL_Node.audio.audio_reset_button_visibility()
				TL_Node.audio.audio_reset_button_visibility()
				TL_Node.audio.sound_reset_button_visibility()
				pass
		else:
			config.set_value("audio", "audio_volume", 100)
			config.set_value("audio", "audio_off", 0)
			config.set_value("audio", "music_volume", 100)
			config.set_value("audio", "music_off", 0)
			config.set_value("audio", "sound_volume", 100)
			config.set_value("audio", "sound_off", 0)
			config.set_value("seeds", "seeds", [{
				"note": "Default",
				"seed": ""
				} ])
			config.set_value("seeds", "seed_index", 0)
			config.set_value("network", "server", [{
				"address": "play.twohoursonelife.com",
				"port": "8005",
				"server_name": "Two Hours One Life"
				} ])
			config.set_value("network", "server_index", 0)
			config.set_value("defaults", "allowSavingSpeech", 0)
			config.set_value("defaults", "screenHeight", 720)
			config.set_value("defaults", "screenWidth", 1280)
			config.set_value("defaults", "resolution_selected", 2)
			config.set_value("defaults", "borderless", 0)
			config.set_value("defaults", "cursorMode", 0)
			config.set_value("defaults", "fullscreen", 0)
			config.save(TL_Path.launcher_settings)
#			if config.has_section('seeds'):
#				pass
	file.close()


func _ready_emotion_ready(node):
	if TL_Variables.file_exists_emotion_words == true:
		node.populate_emotion_lineedit()
		node.reset_button_visibility()


func _ready_load_checkbutton(checkbutton, reset_button, ini_path, default_setting, invert_bool):
	TL_CheckButton.load_ini(checkbutton, ini_path, invert_bool)
	TL_CheckButton.reset_button_visibility(checkbutton, reset_button, default_setting, invert_bool)


func _ready_load_spinbox(spinbox_node, ini_path, reset_button, default_setting):
	TL_SpinBox.load_ini(spinbox_node, ini_path)
	TL_SpinBox.reset_button_visibility(spinbox_node, reset_button, default_setting, ini_path)
#	print("Spinbox Value: ", spinbox_node.value)
#	print("Default Spinbox Value: ", default_setting)
