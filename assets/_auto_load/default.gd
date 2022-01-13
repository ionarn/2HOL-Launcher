extends Control

# V A R I A B L E S

# GENERAL LAUNCHER FILES
var launcher_settings_path = "./settings/launcher_settings.ini"
var config = ConfigFile.new()
var load_response = config.load(launcher_settings_path)


const vsplit_offset = 90

# BASIC SETTINGS

var seed_index
var seed_name
var spawn_seed
var twin_code

#-- Video
var fullscreen
var resolution_x
var resolution_y
var resolution_selected
var borderless
var mousepointer
var vsync

#-- Audio
var audio_off
var audio_volume
var music_off
var music_volume
var sound_off
var sound_volume

#-- Server
var server
var server_index
var server_address
var server_name
var server_port
var use_custom_server

# GAME SETTINGS
var auto_login
var hard_to_quit
var target_frame_rate
var fps_measure
var check_spelling
var live_triggers
var tutorial_done
var pause_on_minimize
var cursor_speed

# Recording Settings
var record_game
var keep_recordings
var show_playback_display
var record_audio
var record_audio_length
var sound_sample_rate
var speed_control_keys
var sound_buffer_size

# HUD SETTINGS
var game_ui
var use_fov
var hud_fov_scale
var fov_max_scale
var force_big_cursor
var half_frame_rate

var baby_head_down_fac
var baby_body_down_fac
var old_head_forward_fac
var old_head_down_fac
var ground_tile_blur

# COMMANDS
#-- Emotions
var emotion_duration
var emo_happy
var emo_mad
var emo_angry
var emo_sad
var emo_devious
var emo_joy
var emo_blush
var emo_hubba
var emo_ill
var emo_yoohoo
var emo_hmph
var emo_love
var emo_oreally
var emo_shock
var emo_clown
var emo_pog
var emo_cry
var emo_tongue
var emo_sleep
var emo_brokelove
var emo_eyeroll
var emo_erm
var emo_please
var emo_cook
var emo_smith
var emo_miner
var emo_farmer
var emo_tailor
var emo_hunter

# LAUNCHER SETTINGS
var font_size


func load_variables():
	var file = File.new()
	
	# BASIC SETTINGS
	
	seed_index = setget_defaults_values("seed_index", 0)
	seed_name = setget_defaults_values("seed_name", "Default")
	spawn_seed = setget_defaults_values("spawn_seed", "")
	twin_code = setget_defaults_values("twinCode", "")
	
	#-- Video
	fullscreen = setget_defaults_values("fullscreen", 0)
	resolution_x = setget_defaults_values("screenWidth", 1280)
	resolution_y = setget_defaults_values("screenHeight", 720)
	resolution_selected = setget_defaults_values("resolution_selected", 2)
	borderless = setget_defaults_values("borderless", 0)
	mousepointer = setget_defaults_values("cursorMode", 0)
	vsync = setget_defaults_values("countingOnVsync", 1)

	#-- Audio
	audio_off = setget_defaults_values("audio_off", false)
	audio_volume = setget_defaults_values("audio_volume", 100)
	music_off = setget_defaults_values("musicOff", false)
	music_volume = setget_defaults_values("musicLoudness", 100)
	sound_off = setget_defaults_values("soundEffectsOff", false)
	sound_volume = setget_defaults_values("soundEffectsLoudness", 100)

	#-- Server
	server = setget_defaults_values("server", [{
		"address": "play.twohoursonelife.com",
		"port": 8005, "server_name":
		"Two Hours One Life"
	}])
	server_index = setget_defaults_values("server_index", 0)
	server_address = setget_defaults_values("server_address",
			"play.twohoursonelife.com")
	server_name = setget_defaults_values("server_name", "Two Hours One Life")
	server_port = setget_defaults_values("server_port", 8005)
	use_custom_server = setget_defaults_values("use_custom_server", 0)
	
	# GAME SETTINGS
	auto_login = setget_defaults_values("autoLogIn", 0)
	hard_to_quit = setget_defaults_values("hardToQuitMode", 0)
	target_frame_rate = setget_defaults_values("targetFrameRate", 60)
	fps_measure = setget_defaults_values("skipFPSMeasure", 0)
	check_spelling = setget_defaults_values("spellCheckOn", 1)
	live_triggers = setget_defaults_values("enableLiveTriggers", 0)
	tutorial_done = setget_defaults_values("tutorialDone", 0)
	pause_on_minimize = setget_defaults_values("pauseOnMinimize", 0)
	cursor_speed = setget_defaults_values("mouseSpeed", 1.0)

	# Recording Settings
	record_game = setget_defaults_values("recordGame", 1)
	keep_recordings = setget_defaults_values("keepPastRecordings", 20)
	show_playback_display = setget_defaults_values("hidePlaybackDisplay", 0)
	record_audio = setget_defaults_values("recordAudio", 0)
	record_audio_length = setget_defaults_values("recordAudioLengthInSeconds", 130)
	sound_sample_rate = setget_defaults_values("soundSampleRate", 44100)
	speed_control_keys = setget_defaults_values("enableSpeedControlKeys", 0)
	sound_buffer_size = setget_defaults_values("soundBufferSize", 1024)

	# HUD SETTINGS
	game_ui = setget_defaults_values("hideGameUI", 0)
	use_fov = setget_defaults_values("fovEnabled", 0)
	hud_fov_scale = setget_defaults_values("fovScale", 1.25)
	fov_max_scale = setget_defaults_values("fovMax", 2.25)
	force_big_cursor = setget_defaults_values("forceBigPointer", 0)
	half_frame_rate = setget_defaults_values("halfFrameRate", 0)

	baby_head_down_fac = setget_defaults_values("babyHeadDownFactor", 0.54)
	baby_body_down_fac = setget_defaults_values("babyBodyDownFactor", 0.75)
	old_head_forward_fac = setget_defaults_values("oldHeadForwardFactor", 3.0)
	old_head_down_fac = setget_defaults_values("oldHeadDownFactor", 0.35)
	ground_tile_blur = setget_defaults_values("groundTileEdgeBlurRadius", 12)

	# COMMANDS
	#-- Emotions
	var test = setget_defaults_values("KEY", "/VALUE")
	
	emotion_duration = setget_defaults_values("emotDuration", 10)
	emo_happy = setget_defaults_values("emo_happy", "/happy")
	emo_mad = setget_defaults_values("emo_mad", "/mad")
	emo_angry = setget_defaults_values("emo_angry", "/angry")
	emo_sad = setget_defaults_values("emo_sad", "/sad")
	emo_devious = setget_defaults_values("emo_devious", "/devious")
	emo_joy = setget_defaults_values("emo_joy", "/joy")
	emo_blush = setget_defaults_values("emo_blush", "/blush")
	emo_hubba = setget_defaults_values("emo_hubba", "/hubba")
	emo_ill = setget_defaults_values("emo_ill", "/ill")
	emo_yoohoo = setget_defaults_values("emo_yoohoo", "/yoohoo")
	emo_hmph = setget_defaults_values("emo_hmph", "/hmph")
	emo_love = setget_defaults_values("emo_love", "/love")
	emo_oreally = setget_defaults_values("emo_oreally", "/oreally")
	emo_shock = setget_defaults_values("emo_shock", "/shock")
	emo_clown = setget_defaults_values("emo_clown", "/clown")
	emo_pog = setget_defaults_values("emo_pog", "/pog")
	emo_cry = setget_defaults_values("emo_cry", "/cry")
	emo_tongue = setget_defaults_values("emo_tongue", "/tongue")
	emo_sleep = setget_defaults_values("emo_sleep", "/sleep")
	emo_brokelove = setget_defaults_values("emo_brokelove", "/brokelove")
	emo_eyeroll = setget_defaults_values("emo_eyeroll", "/eyeroll")
	emo_erm = setget_defaults_values("emo_erm", "/erm")
	emo_please = setget_defaults_values("emo_please", "/please")
	emo_cook = setget_defaults_values("emo_cook", "/cook")
	emo_smith = setget_defaults_values("emo_smith", "/smith")
	emo_miner = setget_defaults_values("emo_miner", "/miner")
	emo_farmer = setget_defaults_values("emo_farmer", "/farmer")
	emo_tailor = setget_defaults_values("emo_tailor", "/tailor")
	emo_hunter = setget_defaults_values("emo_hunter", "/hunter")

	# LAUNCHER SETTINGS
	font_size = setget_defaults_values("font_size", 14)


func setget_defaults_values(key: String, new_value):
	var file = File.new()
	if (config.has_section_key(TL_Variables.SECTION_DEFAULTS, key) == false
			or file.file_exists(TL_Path.launcher_settings) == false):
		config.set_value(TL_Variables.SECTION_DEFAULTS, key, new_value)
		config.save(TL_Path.launcher_settings)
	return config.get_value(TL_Variables.SECTION_DEFAULTS, key)

