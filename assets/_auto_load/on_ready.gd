extends Control

var i = 0
var j = 0

var config = ConfigFile.new()
var load_response = config.load(TL_Path.launcher_settings)


# F U N C T I O N S

# Called when the node enters the scene tree for the first time.
func on_loading_ready():
	TL_Signal.connect("ready_load_checkbutton", self, "_ready_load_checkbutton")
	TL_Signal.connect("ready_load_spinbox", self, "_ready_load_spinbox")
	TL_Node.title_bar.connect_item_pressed()
	
	TL_Node.nav_navigation_panel.load_menu_selection()
	TL_Node.pop_popup_background.set_ok_text()
	
	var file = File.new() # new file class on which you will call file class methods
	file.open(TL_Path.data_version_number, File.READ) # the file is now opened in the background
	TL_Node.version.text = "2HOL Version " + file.get_as_text()
	
	file.open(TL_Path.binary, File.READ)
	TL_Node.bnr_label.text = file.get_as_text()
	var game_file_path = ""
	if OS.get_name() == "Windows":
		game_file_path = TL_Path.game_file
	elif OS.get_name() == "X11":
		game_file_path = TL_Path.game_file_linux
	
	if file.file_exists(game_file_path) == false: # TRUE
		# LOGIN
		TL_Node.ld_login_data.load_values()
		
		# BASIC SETTINGS
		TL_Node.fullscreen.load_value()
		TL_Node.resolution.load_value()
		TL_Node.mousepointer.load_value()
		TL_Node.vsync.load_value()
		
		# EMOTION SETTINGS
		if file.file_exists(TL_Path.emotion_words) == true:
			TL_Node.emotion_duration.load_value()
			TL_Node.emotion_happy.load_value()
			TL_Node.emotion_mad.load_value()
			TL_Node.emotion_angry.load_value()
			TL_Node.emotion_sad.load_value()
			TL_Node.emotion_devious.load_value()
			TL_Node.emotion_joy.load_value()
			TL_Node.emotion_blush.load_value()
			TL_Node.emotion_hubba.load_value()
			TL_Node.emotion_ill.load_value()
			TL_Node.emotion_yoohoo.load_value()
			TL_Node.emotion_hmph.load_value()
			TL_Node.emotion_love.load_value()
			TL_Node.emotion_oreally.load_value()
			TL_Node.emotion_shock.load_value()
			TL_Node.emotion_clown.load_value()
			TL_Node.emotion_pog.load_value()
			TL_Node.emotion_cry.load_value()
			TL_Node.emotion_tongue.load_value()
			TL_Node.emotion_sleep.load_value()
			TL_Node.emotion_broke_love.load_value()
			TL_Node.emotion_eye_roll.load_value()
			TL_Node.emotion_erm.load_value()
			TL_Node.emotion_please.load_value()
			TL_Node.emotion_cook.load_value()
			TL_Node.emotion_smith.load_value()
			TL_Node.emotion_miner.load_value()
			TL_Node.emotion_farmer.load_value()
			TL_Node.emotion_tailor.load_value()
			TL_Node.emotion_hunter.load_value()
		
		if file.file_exists(TL_Path.launcher_settings) == true:
			TL_Node.spawn_seed.load_values()
			TL_Node.audio.load_values()
			TL_Node.network.load_values()
			TL_Node.font_size.load_value()

			# GAME SETTINGS
			TL_Node.general_settings.load_values()
			
			TL_Node.auto_login.load_value()
			TL_Node.hard_to_quit.load_value()
			TL_Node.check_spelling.load_value()
			TL_Node.live_triggers.load_value()
			TL_Node.tutorial_done.load_value()
			TL_Node.pause_on_minimize.load_value()
			TL_Node.cursor_speed.load_value()
			TL_Node.record_game.load_value()
			TL_Node.keep_recording.load_value()
			TL_Node.show_playback_display.load_value()
			TL_Node.speed_control_keys.load_value()
			TL_Node.record_audio.load_value()
			TL_Node.record_audio_length.load_value()
			TL_Node.sound_sample_rate.load_value()
			TL_Node.sound_buffer_size.load_value()
			
			# GRAPHICS SETTINGS
			TL_Node.target_fps.load_value()
			TL_Node.fps_measure.load_value()
			TL_Node.half_frame_rate.load_value()
			TL_Node.game_ui.load_value()
			TL_Node.use_fov.load_value()
			TL_Node.hud_fov_scale.load_value()
			TL_Node.fov_max_scale.load_value()
			TL_Node.force_big_cursor.load_value()
			TL_Node.baby_head_down_fac.load_value()
			TL_Node.baby_body_down_fac.load_value()
			TL_Node.old_head_forward_fac.load_value()
			TL_Node.old_head_down_fac.load_value()
			TL_Node.ground_tile_blur.load_value()
			
			# MOD SETTINGS
			TL_Node.mods_main_script.load_values()
			TL_Node.htw_show_player_info.load_value()
			
#		else:
#			config.set_value("defaults", "allowSavingSpeech", 0)
#			config.set_value("defaults", "screenHeight", 720)
#			config.set_value("defaults", "screenWidth", 1280)
#			config.set_value("defaults", "resolution_selected", 2)
#			config.set_value("defaults", "borderless", 0)
#			config.set_value("defaults", "cursorMode", 0)
#			config.set_value("defaults", "fullscreen", 0)
#			config.save(TL_Path.launcher_settings)
#			if config.has_section('seeds'):
#				pass
	else:
		TL_Node.pop_popup_background.visible = true
		TL_Node.pop_wrong_directory.popup()
	file.close()


func _ready_load_checkbutton(checkbutton, reset_button, ini_path, default_setting, invert_bool):
	TL_CheckButton.load_ini(checkbutton, ini_path, invert_bool)
	TL_CheckButton.reset_button_visibility(checkbutton, reset_button, default_setting, invert_bool)


func _ready_load_spinbox(spinbox_node, ini_path, reset_button, default_setting):
	TL_SpinBox.load_ini(spinbox_node, ini_path)
	TL_SpinBox.reset_button_visibility(spinbox_node, reset_button, default_setting, ini_path)
