extends Control

''' VARIABLES '''
func finding_nodes(node_name):
	return get_tree().get_root().find_node(node_name, true, false)

#onready var nodes = finding_nodes('nodes')
#onready var path = finding_nodes('path')

#onready var audio_checkbutton = finding_nodes('av1_checkbutton')
#onready var audio_slider = finding_nodes('av2_slider')
#onready var audio_label = finding_nodes('av2_label')
#onready var audio_reset = finding_nodes('av2_reset')
#var audio_off_path = "./settings/audioOff.ini"
#var audio_off_default = false
#var audio_slider_default = 100

#onready var music_checkbutton = finding_nodes('mv1_checkbutton')
#onready var music_slider = finding_nodes('mv2_slider')
#onready var music_label = finding_nodes('mv2_label')
#onready var music_reset = finding_nodes('mv2_reset')
#var music_volume_path = "./settings/musicLoudness.ini"
#var music_off_path = "./settings/musicOff.ini"
#var music_off_default = false
#var music_slider_default = 100

#onready var sound_checkbutton = finding_nodes('sfx1_checkbutton')
#onready var sound_slider = finding_nodes('sfx2_slider')
#onready var sound_label = finding_nodes('sfx2_label')
#onready var sound_reset = finding_nodes('sfx2_reset')
#var sound_volume_path = "./settings/soundEffectsLoudness.ini"
#var sound_off_path = "./settings/soundEffectsOff.ini"
#var sound_off_default = false
#var sound_slider_default = 100
var section = "audio"

#var launcher_settings_path = "./settings/launcher_settings.ini"
#var launcher_ini_content = '[section]\n\naudio_volume=100\naudio_off=0\nmusic_volume=100\nmusic_off=0\nsound_volume=100\nsound_off=0'
var config = ConfigFile.new()
var load_response = config.load(TL_Path.launcher_settings)

# - - - - - - - - - - - - - - - - - - - - - - -

# Called when the node enters the scene tree for the first time.
func _ready():
	TL_Node.audio_reset.connect('button_pressed', self, '_on_audio_reset_pressed')
	TL_Node.music_reset.connect('button_pressed', self, '_on_music_reset_pressed')
	TL_Node.sound_reset.connect('button_pressed', self, '_on_sound_reset_pressed')
#	does_launcher_ini_exist()
#	load_slider_cache('audio_volume', audio_slider)
#	label_value(audio_slider.value, audio_label)
#	load_checkbutton_cache('audio_off', audio_checkbutton)
#
#	load_slider_cache('music_volume', music_slider)
#	label_value(music_slider.value, music_label)
#	load_checkbutton_cache('music_off', music_checkbutton)
#
#	load_slider_cache('sound_volume', sound_slider)
#	label_value(sound_slider.value, sound_label)
#	load_checkbutton_cache('sound_off', sound_checkbutton)
#
#	audio_toggle()
#
#	audio_reset_button_visibility()
#	audio_reset_button_visibility()
#	sound_reset_button_visibility()


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


func _on_mv1_checkbutton_toggled(_button_pressed):
	save_checkbutton_value(TL_Path.music_off, !TL_Node.music_checkbutton.pressed)
	music_reset_button_visibility()


func _on_mv2_slider_value_changed(value):
	label_value(value, TL_Node.music_label)
	save_slider_value(TL_Path.music_volume, TL_Node.music_checkbutton, value)
	save_chache('music_volume', TL_Node.music_slider.value)
	music_reset_button_visibility()


func _on_sfx1_checkbutton_pressed():
	save_chache('sound_off', !TL_Node.sound_checkbutton.pressed)
	sound_reset_button_visibility()


func _on_sfx1_checkbutton_toggled(_button_pressed):
	save_checkbutton_value(TL_Path.sound_off, !TL_Node.sound_checkbutton.pressed)
	save_slider_value(TL_Path.sound_volume, TL_Node.sound_checkbutton, TL_Node.sound_slider.value)
	sound_reset_button_visibility()


func _on_sfx2_slider_value_changed(value):
	label_value(value, TL_Node.sound_label)
	save_slider_value(TL_Path.sound_volume, TL_Node.sound_checkbutton, value)
	save_chache('sound_volume', TL_Node.sound_slider.value)
	sound_reset_button_visibility()


func _on_audio_reset_pressed():
	TL_Node.audio_checkbutton.pressed = !bool(TL_Default.audio_off)
	TL_Node.audio_slider.value = TL_Default.audio_slider
	save_chache('audio_off', str(TL_Default.audio_off))
	audio_toggle()
	audio_reset_button_visibility()


func _on_music_reset_pressed():
	TL_Node.music_checkbutton.pressed = !bool(TL_Default.music_off)
	TL_Node.music_slider.value = TL_Default.music_slider
	save_chache('music_off', str(TL_Default.music_off))
	audio_toggle()
	music_reset_button_visibility()
	
	
func _on_sound_reset_pressed():
	TL_Node.sound_checkbutton.pressed = !bool(TL_Default.sound_off)
	TL_Node.sound_slider.value = TL_Default.sound_slider
	save_chache('sound_off', str(TL_Default.sound_off))
	audio_toggle()
	sound_reset_button_visibility()

# ----------------------

func audio_reset_button_visibility():
	if TL_Node.audio_checkbutton.pressed != bool(TL_Default.audio_off) and TL_Node.audio_slider.value == TL_Default.audio_slider:
		TL_Node.audio_reset.get_node("reset").visible = false
	else:
		TL_Node.audio_reset.get_node("reset").visible = true


func music_reset_button_visibility():
	if TL_Node.music_checkbutton.pressed != bool(TL_Default.music_off) and TL_Node.music_slider.value == TL_Default.music_slider:
		TL_Node.music_reset.get_node("reset").visible = false
	else:
		TL_Node.music_reset.get_node("reset").visible = true


func sound_reset_button_visibility():
	if TL_Node.sound_checkbutton.pressed != bool(TL_Default.sound_off) and TL_Node.sound_slider.value == TL_Default.sound_slider:
		TL_Node.sound_reset.get_node("reset").visible = false
	else:
		TL_Node.sound_reset.get_node("reset").visible = true


func label_value(value, label):
	label.text = str(int(value))


func save_checkbutton_value(path, state):
	var file = File.new() #new file class on which you will call file class methods
	file.open(path, File.WRITE)  #the file is now opened in the background
	file.store_string(str(int(state)))
	file.close()


func save_slider_value(path, checkbutton, slider_value):
	var file = File.new() #new file class on which you will call file class methods
	file.open(path, File.WRITE)  #the file is now opened in the background
	if TL_Node.audio_checkbutton.pressed == true or checkbutton.pressed == true:
		file.store_string(str((slider_value  * TL_Node.audio_slider.value) / 10000))
	elif TL_Node.audio_checkbutton.pressed == false:
		file.store_string(str(0))
	file.close()


func save_audio(value):
	var array = [ [TL_Path.music_volume, TL_Node.music_slider], [TL_Path.sound_volume, TL_Node.sound_slider] ]
	for content in array:
		var file = File.new() #new file class on which you will call file class methods
		file.open(content[0], File.WRITE)  #the file is now opened in the background
		file.store_string(str((content[1].value * value) / 10000))
		file.close()


func save_chache(key, value):
	config.set_value(section, key, int(value))
	config.save(TL_Path.launcher_settings)


func load_slider_cache(key, slider):
	slider.value = int(config.get_value(section, key, null))


func load_checkbutton_cache(key, checkbutton):
	var boing = bool(int(config.get_value(section, key, checkbutton.pressed)))
	checkbutton.pressed = !boing


func does_launcher_ini_exist():
	var file_check = File.new()
	if file_check.file_exists(TL_Path.launcher_settings) == false:
		var file = File.new()
		file.open(TL_Path.launcher_settings, File.WRITE)
		file.store_string('')
		file.close()
	if config.has_section(section) == false:
		config.set_value(section, 'audio_volume', 100)
		config.set_value(section, 'audio_off', 0)
		config.set_value(section, 'music_volume', 100)
		config.set_value(section, 'music_off', 0)
		config.set_value(section, 'sound_volume', 100)
		config.set_value(section, 'sound_off', 0)
		config.save(TL_Path.launcher_settings)
	


func audio_toggle():
	if TL_Node.audio_checkbutton.pressed == false:
		TL_Node.music_checkbutton.pressed = false
		TL_Node.sound_checkbutton.pressed = false
	elif TL_Node.audio_checkbutton.pressed == true:
		var music = bool(int(config.get_value(section, 'music_off', null)))
		TL_Node.music_checkbutton.pressed = !music
		var sound = bool(int(config.get_value(section, 'sound_off', null)))
		TL_Node.sound_checkbutton.pressed = !sound
