extends Control

# V A R I A B L E S

# GENERAL LAUNCHER FILES
#var launcher_settings_path = "./settings/launcher_settings.ini"
#var config = ConfigFile.new()
#var load_response = config.load(launcher_settings_path)

const SECTION_DEFAULTS = "defaults"
const SECTION_AUDIO = "audio"
const SECTION_SEEDS = "seeds"
const SECTION_NETWORK = "network"
const SECTION_LAUNCHER = "launcher"


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

var finished_loading = false

var config_b = ConfigFile.new()
var load_response_b = config_b.load(TL_Path.launcher_settings)


func load_variables():
#	var config_a = ConfigFile.new()
#	var load_response_a = config_a.load(TL_Path.launcher_settings)
	
	var file = File.new()
	
	# BASIC SETTINGS
	seed_index = setget_defaults_values(SECTION_DEFAULTS, "seed_index", 0)
	seed_name = setget_defaults_values(SECTION_DEFAULTS, "seed_name", "Default")
	spawn_seed = setget_defaults_values(SECTION_DEFAULTS, "spawn_seed", "")
	twin_code = setget_defaults_values(SECTION_DEFAULTS, "twinCode", "")

	#-- Video
	fullscreen = setget_defaults_values(SECTION_DEFAULTS, "fullscreen", 0)
	resolution_x = setget_defaults_values(SECTION_DEFAULTS, "screenWidth", 1280)
	resolution_y = setget_defaults_values(SECTION_DEFAULTS, "screenHeight", 720)
	resolution_selected = setget_defaults_values(SECTION_DEFAULTS, "resolution_selected", 2)
	borderless = setget_defaults_values(SECTION_DEFAULTS, "borderless", 0)
	mousepointer = setget_defaults_values(SECTION_DEFAULTS, "cursorMode", 0)
	vsync = setget_defaults_values(SECTION_DEFAULTS, "countingOnVsync", 1)

	#-- Audio
	audio_off = setget_defaults_values(SECTION_DEFAULTS, "audio_off", false)
	audio_volume = setget_defaults_values(SECTION_DEFAULTS, "audio_volume", 100)
	music_off = setget_defaults_values(SECTION_DEFAULTS, "musicOff", false)
	music_volume = setget_defaults_values(SECTION_DEFAULTS, "musicLoudness", 100)
	sound_off = setget_defaults_values(SECTION_DEFAULTS, "soundEffectsOff", false)
	sound_volume = setget_defaults_values(SECTION_DEFAULTS, "soundEffectsLoudness", 100)
	
	#-- Server
	server = setget_defaults_values(SECTION_DEFAULTS, "server", [{
		"address": "play.twohoursonelife.com",
		"port": 8005, "server_name":
		"Two Hours One Life"
	}])
	server_index = setget_defaults_values(SECTION_DEFAULTS, "server_index", 0)
	server_address = setget_defaults_values(SECTION_DEFAULTS, "server_address",
			"play.twohoursonelife.com")
	server_name = setget_defaults_values(SECTION_DEFAULTS, "server_name", "Two Hours One Life")
	server_port = setget_defaults_values(SECTION_DEFAULTS, "server_port", 8005)
	use_custom_server = setget_defaults_values(SECTION_DEFAULTS, "use_custom_server", 0)

	# GAME SETTINGS
	auto_login = setget_defaults_values(SECTION_DEFAULTS, "autoLogIn", 0)
	hard_to_quit = setget_defaults_values(SECTION_DEFAULTS, "hardToQuitMode", 0)
	target_frame_rate = setget_defaults_values(SECTION_DEFAULTS, "targetFrameRate", 60)
	fps_measure = setget_defaults_values(SECTION_DEFAULTS, "skipFPSMeasure", 0)
	check_spelling = setget_defaults_values(SECTION_DEFAULTS, "spellCheckOn", 1)
	live_triggers = setget_defaults_values(SECTION_DEFAULTS, "enableLiveTriggers", 0)
	tutorial_done = setget_defaults_values(SECTION_DEFAULTS, "tutorialDone", 0)
	pause_on_minimize = setget_defaults_values(SECTION_DEFAULTS, "pauseOnMinimize", 0)
	cursor_speed = setget_defaults_values(SECTION_DEFAULTS, "mouseSpeed", 1.0)

	# Recording Settings
	record_game = setget_defaults_values(SECTION_DEFAULTS, "recordGame", 1)
	keep_recordings = setget_defaults_values(SECTION_DEFAULTS, "keepPastRecordings", 20)
	show_playback_display = setget_defaults_values(SECTION_DEFAULTS, "hidePlaybackDisplay", 0)
	record_audio = setget_defaults_values(SECTION_DEFAULTS, "recordAudio", 0)
	record_audio_length = setget_defaults_values(SECTION_DEFAULTS, "recordAudioLengthInSeconds", 130)
	sound_sample_rate = setget_defaults_values(SECTION_DEFAULTS, "soundSampleRate", 44100)
	speed_control_keys = setget_defaults_values(SECTION_DEFAULTS, "enableSpeedControlKeys", 0)
	sound_buffer_size = setget_defaults_values(SECTION_DEFAULTS, "soundBufferSize", 1024)
	
	# HUD SETTINGS
	game_ui = setget_defaults_values(SECTION_DEFAULTS, "hideGameUI", 0)
	use_fov = setget_defaults_values(SECTION_DEFAULTS, "fovEnabled", 0)
	hud_fov_scale = setget_defaults_values(SECTION_DEFAULTS, "fovScale", 1.25)
	fov_max_scale = setget_defaults_values(SECTION_DEFAULTS, "fovMax", 2.25)
	force_big_cursor = setget_defaults_values(SECTION_DEFAULTS, "forceBigPointer", 0)
	half_frame_rate = setget_defaults_values(SECTION_DEFAULTS, "halfFrameRate", 0)

	baby_head_down_fac = setget_defaults_values(SECTION_DEFAULTS, "babyHeadDownFactor", 0.54)
	baby_body_down_fac = setget_defaults_values(SECTION_DEFAULTS, "babyBodyDownFactor", 0.75)
	old_head_forward_fac = setget_defaults_values(SECTION_DEFAULTS, "oldHeadForwardFactor", 3.0)
	old_head_down_fac = setget_defaults_values(SECTION_DEFAULTS, "oldHeadDownFactor", 0.35)
	ground_tile_blur = setget_defaults_values(SECTION_DEFAULTS, "groundTileEdgeBlurRadius", 12)
	
	# COMMANDS
	#-- Emotions
	var test = setget_defaults_values(SECTION_DEFAULTS, "KEY", "/VALUE")

	emotion_duration = setget_defaults_values(SECTION_DEFAULTS, "emotDuration", 10)
	emo_happy = setget_defaults_values(SECTION_DEFAULTS, "emo_happy", "/happy")
	emo_mad = setget_defaults_values(SECTION_DEFAULTS, "emo_mad", "/mad")
	emo_angry = setget_defaults_values(SECTION_DEFAULTS, "emo_angry", "/angry")
	emo_sad = setget_defaults_values(SECTION_DEFAULTS, "emo_sad", "/sad")
	emo_devious = setget_defaults_values(SECTION_DEFAULTS, "emo_devious", "/devious")
	emo_joy = setget_defaults_values(SECTION_DEFAULTS, "emo_joy", "/joy")
	emo_blush = setget_defaults_values(SECTION_DEFAULTS, "emo_blush", "/blush")
	emo_hubba = setget_defaults_values(SECTION_DEFAULTS, "emo_hubba", "/hubba")
	emo_ill = setget_defaults_values(SECTION_DEFAULTS, "emo_ill", "/ill")
	emo_yoohoo = setget_defaults_values(SECTION_DEFAULTS, "emo_yoohoo", "/yoohoo")
	emo_hmph = setget_defaults_values(SECTION_DEFAULTS, "emo_hmph", "/hmph")
	emo_love = setget_defaults_values(SECTION_DEFAULTS, "emo_love", "/love")
	emo_oreally = setget_defaults_values(SECTION_DEFAULTS, "emo_oreally", "/oreally")
	emo_shock = setget_defaults_values(SECTION_DEFAULTS, "emo_shock", "/shock")
	emo_clown = setget_defaults_values(SECTION_DEFAULTS, "emo_clown", "/clown")
	emo_pog = setget_defaults_values(SECTION_DEFAULTS, "emo_pog", "/pog")
	emo_cry = setget_defaults_values(SECTION_DEFAULTS, "emo_cry", "/cry")
	emo_tongue = setget_defaults_values(SECTION_DEFAULTS, "emo_tongue", "/tongue")
	emo_sleep = setget_defaults_values(SECTION_DEFAULTS, "emo_sleep", "/sleep")
	emo_brokelove = setget_defaults_values(SECTION_DEFAULTS, "emo_brokelove", "/brokelove")
	emo_eyeroll = setget_defaults_values(SECTION_DEFAULTS, "emo_eyeroll", "/eyeroll")
	emo_erm = setget_defaults_values(SECTION_DEFAULTS, "emo_erm", "/erm")
	emo_please = setget_defaults_values(SECTION_DEFAULTS, "emo_please", "/please")
	emo_cook = setget_defaults_values(SECTION_DEFAULTS, "emo_cook", "/cook")
	emo_smith = setget_defaults_values(SECTION_DEFAULTS, "emo_smith", "/smith")
	emo_miner = setget_defaults_values(SECTION_DEFAULTS, "emo_miner", "/miner")
	emo_farmer = setget_defaults_values(SECTION_DEFAULTS, "emo_farmer", "/farmer")
	emo_tailor = setget_defaults_values(SECTION_DEFAULTS, "emo_tailor", "/tailor")
	emo_hunter = setget_defaults_values(SECTION_DEFAULTS, "emo_hunter", "/hunter")
	
#	config_b.set_value("defaults", "emo_hunter", "/hunter")
	
#	if file.file_exists(TL_Path.launcher_settings) == false or config_b.has_section_key("defaults", "emo_hunter") == false:
#		print("Doesn't have section 'defaults' and key 'emo_hunter'")
#		config_b.set_value("defaults", "emo_hunter", "/hunter")
#		emo_hunter = config_b.get_value("defaults", "emo_hunter")
	
	# LAUNCHER SETTINGS
	font_size = setget_defaults_values(SECTION_DEFAULTS, "font_size", 14)
	
	var my_audio = setget_defaults_values(SECTION_AUDIO, "audio_volume", 100)
	setget_defaults_values(SECTION_AUDIO, "audio_off", 0)
	setget_defaults_values(SECTION_AUDIO, "music_volume", 100)
	setget_defaults_values(SECTION_AUDIO, "music_off", 0)
	setget_defaults_values(SECTION_AUDIO, "sound_volume", 100)
	setget_defaults_values(SECTION_AUDIO, "sound_off", 0)
	
	setget_defaults_values(SECTION_SEEDS, "seeds", [ {
			"note": "Default",
			"seed": ""
	} ])
	setget_defaults_values(SECTION_SEEDS, "seed_index", 0)
	
	setget_defaults_values(SECTION_NETWORK, "server", [ {
			"address": "play.twohoursonelife.com",
			"port": 8005,
			"server_name": "Two Hours One Life"
	} ])
	setget_defaults_values(SECTION_NETWORK, "server_index", 0)
	
	setget_defaults_values(SECTION_LAUNCHER, "font_size", 14)
	setget_defaults_values(SECTION_LAUNCHER, "mod_selected", 0)
	
#	var audio_section = "audio"
#	if file.file_exists(TL_Path.launcher_settings) == false or config_b.has_section("audio") == false:
#		config_b.set_value("audio", "audio_volume", 100)
#		config_b.set_value("audio", "audio_off", 0)
#		config_b.set_value("audio", "music_volume", 100)
#		config_b.set_value("audio", "music_off", 0)
#		config_b.set_value("audio", "sound_volume", 100)
#		config_b.set_value("audio", "sound_off", 0)
	
#	if file.file_exists(TL_Path.launcher_settings) == false or config_b.has_section("seeds") == false:
#		config_b.set_value("seeds", "seeds", [ {
#				"note": "Default",
#				"seed": ""
#		} ])
#		config_b.set_value("seeds", "seed_index", 0)
	
#	if file.file_exists(TL_Path.launcher_settings) == false or config_b.has_section("network") == false:
#		config_b.set_value("network", "server", [ {
#				"address": "play.twohoursonelife.com",
#				"port": "8005",
#				"server_name": "Two Hours One Life"
#		} ])
#		config_b.set_value("network", "server_index", 0)
	
#	if file.file_exists(TL_Path.launcher_settings) == false or config_b.has_section("launcher") == false:
#		print("Section 'launcher' not existing.")
#		config_b.set_value("launcher", "font_size", 14)
#		config_b.set_value("launcher", "mod_selected", 0)
#		print(config_b.get_value("launcher", "font_size"))
#		print("Has key 'font_size': " + str(config_b.has_section_key("launcher", "font_size")))
	
	config_b.save(TL_Path.launcher_settings)
	
	finished_loading = true
	
#	TL_OnReady.on_loading_ready()


func setget_defaults_values(section: String, key: String, new_value):
#	var config_b = ConfigFile.new()
#	var load_response = config_b.load(TL_Path.launcher_settings)
	var file = File.new()
	if (config_b.has_section_key(section, key) == false
			or file.file_exists(TL_Path.launcher_settings) == false):
#		print("Default value " + key + " does not exist yet")
		config_b.set_value(section, key, new_value)
	return config_b.get_value(TL_Variables.SECTION_DEFAULTS, key)

