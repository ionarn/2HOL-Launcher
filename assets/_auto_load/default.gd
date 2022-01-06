extends Control

# V A R I A B L E S

# GENERAL LAUNCHER FILES
var launcher_settings_path = "./settings/launcher_settings.ini"
var config = ConfigFile.new()
var load_response = config.load(launcher_settings_path)

# BASIC SETTINGS
#-- Video
onready var fullscreen = config.get_value("defaults", "fullscreen")
onready var resolution_x = config.get_value("defaults", "screenWidth")
onready var resolution_y = config.get_value("defaults", "screenHeight")
onready var resolution_selected = config.get_value("defaults", "resolution_selected")
onready var borderless = config.get_value("defaults", "borderless")
onready var mousepointer = config.get_value("defaults", "cursorMode")
onready var vsync = config.get_value("defaults", "countingOnVsync")

#-- Audio
onready var audio_off = config.get_value("defaults", "audio_off")
onready var audio_slider = config.get_value("defaults", "audio_slider")
onready var music_off = config.get_value("defaults", "musicOff")
onready var music_slider = config.get_value("defaults", "musicLoudness")
onready var sound_off = config.get_value("defaults", "soundEffectsOff")
onready var sound_slider = config.get_value("defaults", "soundEffectsLoudness")

#-- Server
onready var server = config.get_value("defaults", "server")
onready var server_index = config.get_value("defaults", "server_index")

# GAME SETTINGS
onready var auto_login = config.get_value("defaults", "autoLogIn")
onready var hard_to_quit = config.get_value("defaults", "hardToQuitMode")
onready var target_frame_rate = config.get_value("defaults", "targetFrameRate")
onready var fps_measure = config.get_value("defaults", "skipFPSMeasure")
onready var check_spelling = config.get_value("defaults", "spellCheckOn")
onready var live_triggers = config.get_value("defaults", "enableLiveTriggers")
onready var tutorial_done = config.get_value("defaults", "tutorialDone")
onready var pause_on_minimize = config.get_value("defaults", "pauseOnMinimize")
onready var cursor_speed = config.get_value("defaults", "mouseSpeed")

# Recording Settings
onready var record_game = config.get_value("defaults", "recordGame")
onready var keep_recordings = config.get_value("defaults", "keepPastRecordings")
onready var show_playback_display = config.get_value("defaults", "hidePlaybackDisplay")
onready var record_audio = config.get_value("defaults", "recordAudio")
onready var record_audio_length = config.get_value("defaults", "recordAudioLengthInSeconds")
onready var sound_sample_rate = config.get_value("defaults", "soundSampleRate")
onready var speed_control_keys = config.get_value("defaults", "enableSpeedControlKeys")
onready var sound_buffer_size = config.get_value("defaults", "soundBufferSize")

# HUD SETTINGS
onready var game_ui = config.get_value("defaults", "hideGameUI")
onready var use_fov = config.get_value("defaults", "fovEnabled")
onready var hud_fov_scale = config.get_value("defaults", "fovScale")
onready var fov_max_scale = config.get_value("defaults", "fovMax")
onready var force_big_cursor = config.get_value("defaults", "forceBigPointer")
onready var half_frame_rate = config.get_value("defaults", "halfFrameRate")

onready var baby_head_down_fac = config.get_value("defaults", "babyHeadDownFactor")
onready var baby_body_down_fac = config.get_value("defaults", "babyBodyDownFactor")
onready var old_head_forward_fac = config.get_value("defaults", "oldHeadForwardFactor")
onready var old_head_down_fac = config.get_value("defaults", "oldHeadDownFactor")
onready var ground_tile_blur = config.get_value("defaults", "groundTileEdgeBlurRadius")

# COMMANDS
#-- Emotions
onready var emotion_duration = config.get_value("defaults", "emotDuration")
onready var emo_happy = config.get_value("defaults", "emo_happy")
onready var emo_mad = config.get_value("defaults", "emo_mad")
onready var emo_angry = config.get_value("defaults", "emo_angry")
onready var emo_sad = config.get_value("defaults", "emo_sad")
onready var emo_devious = config.get_value("defaults", "emo_devious")
onready var emo_joy = config.get_value("defaults", "emo_joy")
onready var emo_blush = config.get_value("defaults", "emo_blush")
onready var emo_hubba = config.get_value("defaults", "emo_hubba")
onready var emo_ill = config.get_value("defaults", "emo_ill")
onready var emo_yoohoo = config.get_value("defaults", "emo_yoohoo")
onready var emo_hmph = config.get_value("defaults", "emo_hmph")
onready var emo_love = config.get_value("defaults", "emo_love")
onready var emo_oreally = config.get_value("defaults", "emo_oreally")
onready var emo_shock = config.get_value("defaults", "emo_shock")
onready var emo_clown = config.get_value("defaults", "emo_clown")
onready var emo_pog = config.get_value("defaults", "emo_pog")
onready var emo_cry = config.get_value("defaults", "emo_cry")
onready var emo_tongue = config.get_value("defaults", "emo_tongue")
onready var emo_sleep = config.get_value("defaults", "emo_sleep")
onready var emo_brokelove = config.get_value("defaults", "emo_brokelove")
onready var emo_eyeroll = config.get_value("defaults", "emo_eyeroll")
onready var emo_erm = config.get_value("defaults", "emo_erm")
onready var emo_please = config.get_value("defaults", "emo_please")
onready var emo_cook = config.get_value("defaults", "emo_cook")
onready var emo_smith = config.get_value("defaults", "emo_smith")
onready var emo_miner = config.get_value("defaults", "emo_miner")
onready var emo_farmer = config.get_value("defaults", "emo_farmer")
onready var emo_tailor = config.get_value("defaults", "emo_tailor")
onready var emo_hunter = config.get_value("defaults", "emo_hunter")

# LAUNCHER SETTINGS
onready var font_size = config.get_value("defaults", "font_size")
