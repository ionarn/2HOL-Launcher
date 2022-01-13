extends Control

var section = "audio"


func load_values():
#	var config_b = ConfigFile.new()
#	var load_response_b = config_b.load(TL_Path.launcher_settings)
	TL_Node.audio_reset.connect('button_pressed', self, '_on_audio_reset_pressed')
	TL_Node.music_reset.connect('button_pressed', self, '_on_music_reset_pressed')
	TL_Node.sound_reset.connect('button_pressed', self, '_on_sound_reset_pressed')
	
	var file = File.new()
#	if (file.file_exists(TL_Path.launcher_settings) == false
#			and config.has_section('audio') == false):
#		config.set_value("audio", "audio_volume", 100)
#		config.set_value("audio", "audio_off", 0)
#		config.set_value("audio", "music_volume", 100)
#		config.set_value("audio", "music_off", 0)
#		config.set_value("audio", "sound_volume", 100)
#		config.set_value("audio", "sound_off", 0)
#		config.save(TL_Path.launcher_settings)
	
#	print("Sound Volume: " + str(config_b.get_value("audio", "sound_volume")))
	
	if file.file_exists(TL_Path.audio_off) == false:
		file.open(TL_Path.audio_off, file.WRITE)
		file.store_string(str(TL_Default.audio_off))
	
	if file.file_exists(TL_Path.music_off) == false:
		file.open(TL_Path.music_off, file.WRITE)
		file.store_string(str(TL_Default.music_off))
	
	if file.file_exists(TL_Path.music_volume) == false:
		file.open(TL_Path.music_volume, file.WRITE)
		file.store_string(str(TL_Default.music_volume))
	
	if file.file_exists(TL_Path.sound_off) == false:
		file.open(TL_Path.sound_off, file.WRITE)
		file.store_string(str(TL_Default.sound_off))
	
	if file.file_exists(TL_Path.sound_volume) == false:
		file.open(TL_Path.sound_volume, file.WRITE)
		file.store_string(str(TL_Default.sound_volume))
	
	does_launcher_ini_exist()
	load_slider_cache('audio_volume', TL_Node.audio_slider)
	label_value(TL_Node.audio_slider.value, TL_Node.audio_label)
	load_checkbutton_cache('audio_off', TL_Node.audio_checkbutton)
	
	load_slider_cache('music_volume', TL_Node.music_slider)
	label_value(TL_Node.music_slider.value, TL_Node.music_label)
	load_checkbutton_cache('music_off', TL_Node.music_checkbutton)
	
	load_slider_cache('sound_volume', TL_Node.sound_slider)
	label_value(TL_Node.sound_slider.value, TL_Node.sound_label)
	load_checkbutton_cache('sound_off', TL_Node.sound_checkbutton)
	
	audio_toggle()
	
	audio_reset_button_visibility()
	audio_reset_button_visibility()
	sound_reset_button_visibility()
	file.close()


func _on_av1_checkbutton_pressed():
	save_chache('audio_off', !TL_Node.audio_checkbutton.pressed)
	audio_toggle()
	audio_reset_button_visibility()


func _on_av2_slider_value_changed(value):
	label_value(value, TL_Node.audio_label)
	save_audio(value)
	save_chache('audio_volume', TL_Node.audio_slider.value)
	audio_reset_button_visibility()


func _on_mv1_checkbutton_pressed():
	save_chache('music_off', !TL_Node.music_checkbutton.pressed)
	save_slider_value(TL_Path.music_volume, TL_Node.music_checkbutton, TL_Node.music_slider.value)
	music_reset_button_visibility()


func _on_mv1_checkbutton_toggled(button_pressed):
	save_checkbutton_value(TL_Path.music_off, !TL_Node.music_checkbutton.pressed)
	music_reset_button_visibility()
	TL_Node.music_slider.editable = button_pressed
	if button_pressed == true:
		TL_Node.music_slider.mouse_filter = 0
		TL_Node.music_slider.set("custom_styles/grabber_area", TL_Style.slider_normal)
	else:
		TL_Node.music_slider.mouse_filter = 2
		TL_Node.music_slider.set("custom_styles/grabber_area", TL_Style.slider_disabled)


func _on_mv2_slider_value_changed(value):
	label_value(value, TL_Node.music_label)
	save_slider_value(TL_Path.music_volume, TL_Node.music_checkbutton, value)
	save_chache('music_volume', TL_Node.music_slider.value)
	music_reset_button_visibility()


func _on_sfx1_checkbutton_pressed():
	save_chache('sound_off', !TL_Node.sound_checkbutton.pressed)
	sound_reset_button_visibility()


func _on_sfx1_checkbutton_toggled(button_pressed):
	save_checkbutton_value(TL_Path.sound_off, !TL_Node.sound_checkbutton.pressed)
	save_slider_value(TL_Path.sound_volume, TL_Node.sound_checkbutton, TL_Node.sound_slider.value)
	sound_reset_button_visibility()
	TL_Node.sound_slider.editable = button_pressed
	if button_pressed == true:
		TL_Node.sound_slider.mouse_filter = 0
		TL_Node.sound_slider.set("custom_styles/grabber_area", TL_Style.slider_normal)
	else:
		TL_Node.sound_slider.mouse_filter = 2
		TL_Node.sound_slider.set("custom_styles/grabber_area", TL_Style.slider_disabled)


func _on_sfx2_slider_value_changed(value):
	label_value(value, TL_Node.sound_label)
	save_slider_value(TL_Path.sound_volume, TL_Node.sound_checkbutton, value)
	save_chache('sound_volume', TL_Node.sound_slider.value)
	sound_reset_button_visibility()


func _on_audio_reset_pressed():
	TL_Node.audio_checkbutton.pressed = !bool(TL_Default.audio_off)
	TL_Node.audio_slider.value = TL_Default.audio_volume
	save_chache('audio_off', str(TL_Default.audio_off))
	audio_toggle()
	audio_reset_button_visibility()


func _on_music_reset_pressed():
	TL_Node.music_checkbutton.pressed = !bool(TL_Default.music_off)
	TL_Node.music_slider.value = TL_Default.music_volume
	save_chache('music_off', str(TL_Default.music_off))
	audio_toggle()
	music_reset_button_visibility()
	
	
func _on_sound_reset_pressed():
	TL_Node.sound_checkbutton.pressed = !bool(TL_Default.sound_off)
	TL_Node.sound_slider.value = TL_Default.sound_volume
	save_chache('sound_off', str(TL_Default.sound_off))
	audio_toggle()
	sound_reset_button_visibility()

# ----------------------

func audio_reset_button_visibility():
	if TL_Node.audio_checkbutton.pressed != bool(TL_Default.audio_off) and TL_Node.audio_slider.value == TL_Default.audio_volume:
		TL_Node.audio_reset.set_visible(false)
	else:
		TL_Node.audio_reset.set_visible(true)


func music_reset_button_visibility():
	if TL_Node.music_checkbutton.pressed != bool(TL_Default.music_off) and TL_Node.music_slider.value == TL_Default.music_volume:
		TL_Node.music_reset.set_visible(false)
	else:
		TL_Node.music_reset.set_visible(true)


func sound_reset_button_visibility():
	if TL_Node.sound_checkbutton.pressed != bool(TL_Default.sound_off) and TL_Node.sound_slider.value == TL_Default.sound_volume:
		TL_Node.sound_reset.set_visible(false)
	else:
		TL_Node.sound_reset.set_visible(true)


func label_value(value, label):
	label.text = str(int(value))


func save_checkbutton_value(path, state):
	if TL_Variables.startup_load_finished == true:
		var file = File.new() #new file class on which you will call file class methods
		file.open(path, File.WRITE)  #the file is now opened in the background
		file.store_string(str(int(state)))
		file.close()


func save_slider_value(path, checkbutton, slider_value):
	if TL_Variables.startup_load_finished == true:
		var file = File.new() #new file class on which you will call file class methods
		file.open(path, File.WRITE)  #the file is now opened in the background
		if TL_Node.audio_checkbutton.pressed == true or checkbutton.pressed == true:
			file.store_string(str((slider_value  * TL_Node.audio_slider.value) / 10000))
		elif TL_Node.audio_checkbutton.pressed == false:
			file.store_string(str(0))
		file.close()


func save_audio(value):
	if TL_Variables.startup_load_finished == true:
		var array = [ [TL_Path.music_volume, TL_Node.music_slider], [TL_Path.sound_volume, TL_Node.sound_slider] ]
		for content in array:
			var file = File.new() #new file class on which you will call file class methods
			file.open(content[0], File.WRITE)  #the file is now opened in the background
			file.store_string(str((content[1].value * value) / 10000))
			file.close()


func save_chache(key, value):
	if TL_Variables.startup_load_finished == true:
		var config = ConfigFile.new()
		var load_response = config.load(TL_Path.launcher_settings)
		config.set_value(section, key, int(value))
		config.save(TL_Path.launcher_settings)


func load_slider_cache(key, slider):
	var config = ConfigFile.new()
	var load_response = config.load(TL_Path.launcher_settings)
	slider.value = int(config.get_value(section, key))


func load_checkbutton_cache(key, checkbutton):
	var config = ConfigFile.new()
	var load_response = config.load(TL_Path.launcher_settings)
	var boing = bool(int(config.get_value(section, key, checkbutton.pressed)))
	checkbutton.pressed = !boing


func does_launcher_ini_exist():
	pass
#	var file_check = File.new()
#	if file_check.file_exists(TL_Path.launcher_settings) == false:
#		var file = File.new()
#		file.open(TL_Path.launcher_settings, File.WRITE)
#		file.store_string('')
#		file.close()
#	if config.has_section(section) == false:
#		config.set_value(section, 'audio_volume', 100)
#		config.set_value(section, 'audio_off', 0)
#		config.set_value(section, 'music_volume', 100)
#		config.set_value(section, 'music_off', 0)
#		config.set_value(section, 'sound_volume', 100)
#		config.set_value(section, 'sound_off', 0)
#		config.save(TL_Path.launcher_settings)
	


func audio_toggle():
	var config = ConfigFile.new()
	var load_response = config.load(TL_Path.launcher_settings)
	if TL_Node.audio_checkbutton.pressed == false:
		TL_Node.audio_slider.mouse_filter = 2
		TL_Node.audio_slider.editable = false
		TL_Node.audio_slider.set("custom_styles/grabber_area", TL_Style.slider_disabled)
		
		TL_Node.music_checkbutton.pressed = false
		TL_Node.music_checkbutton.mouse_filter = 2
		TL_Node.music_checkbutton.disabled = true
		TL_Node.music_slider.mouse_filter = 2
		TL_Node.music_slider.editable = false
		TL_Node.music_slider.set("custom_styles/grabber_area", TL_Style.slider_disabled)
		
		TL_Node.sound_checkbutton.pressed = false
		TL_Node.sound_checkbutton.mouse_filter = 2
		TL_Node.sound_checkbutton.disabled = true
		TL_Node.sound_slider.editable = false
		TL_Node.sound_slider.mouse_filter = 2
		TL_Node.sound_slider.set("custom_styles/grabber_area", TL_Style.slider_disabled)
		
	elif TL_Node.audio_checkbutton.pressed == true:
		TL_Node.audio_slider.mouse_filter = 0
		TL_Node.audio_slider.editable = true
		TL_Node.audio_slider.set("custom_styles/grabber_area", TL_Style.slider_normal)
		
		var music = bool(int(config.get_value(section, 'music_off', null)))
		TL_Node.music_checkbutton.pressed = !music
		TL_Node.music_checkbutton.mouse_filter = 0
		TL_Node.music_checkbutton.disabled = false
		TL_Node.music_slider.mouse_filter = 0
		TL_Node.music_slider.editable = true
		TL_Node.music_slider.set("custom_styles/grabber_area", TL_Style.slider_normal)
		
		var sound = bool(int(config.get_value(section, 'sound_off', null)))
		TL_Node.sound_checkbutton.pressed = !sound
		TL_Node.sound_checkbutton.mouse_filter = 0
		TL_Node.sound_checkbutton.disabled = false
		TL_Node.sound_slider.editable = true
		TL_Node.sound_slider.mouse_filter = 0
		TL_Node.sound_slider.set("custom_styles/grabber_area", TL_Style.slider_normal)
