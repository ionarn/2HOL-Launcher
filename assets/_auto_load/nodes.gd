extends Control

var nodes = {}

var tween

var pop_popups
var pop_popup_background
var pop_wrong_directory

var window_resize_control
var maximize_button

var title_bar
var title_bar_menu
var version
var bnr_banner
var bnr_button
var bnr_label
var bnr_panel
var website_links

var nvp_advanced_split
var nvp_information_split
var nvp_ScrollContainer
var hsplitcontainer
var vsplitcontainer
var tab_root

#var sed_margin
#var vid1_margin
#var aud_margin
#var nw_margin
#var gen_margin
#var rec_margin
var gen_groupbox
#var vid2_margin
#var hud_margin
var gfxb_margin
#var emo_margin
#var fer_margin
#var ifr_margin
#var mod_margin
var mod_groupbox
#var chl_margin
var accordion_menu
var not_notification


# NAVIGATION
var tabs_root
var nav_navigation_panel
var nav_basic_settings
var nav_advanced_button
var nav_advanced_container
var nav_arrow
var nav_info_button
var nav_info_container
var nav_commands_button


# LOGIN
var ld_login_data
var ld_username
var ld_key
var ld_show_key


# SPAWN SETTINGS
var spawn_groupbox
var spawn_settings
var seed_popup
var seed_script
var seed_popup_container
var seed_popup_scrollcontainer

# seed name
var seed_name
var seed_popup_button
var seed_reset
var seed_timer

# seed value
var seed_value
var seed_value_script

var twin_code
var twin_code_reset


# VIDEO SETTINGS
var vid1_groupbox

# fullscreen
var fullscreen
var fullscreen_checkbutton
var fullscreen_reset

# resolution
var resolution
var resolution_label
var resolution_dropdown
var resolution_reset
var resolution_le_x
var resolution_multi
var resolution_le_y
#var resolution_button

var borderless
var borderless_checkbutton
var borderless_reset

#mouse pointer
var mousepointer
var mousepointer_dropdown
var mousepointer_reset

# v-sync
var vsync
var vsync_checkbutton
var vsync_reset


# AUDIO SETTINGS
var aud_audio

# audio
var audio
var audio_checkbutton
var audio_slider
var audio_label
var audio_reset

# music
var music_checkbutton
var music_slider
var music_label
var music_reset

# sound
var sound_checkbutton
var sound_slider
var sound_label
var sound_reset

# NETWORK
var nw_popup
var network
var network_script
var server_dropdown
var server_reset
var server_timer
var address
var port
var server_add_item
var server_remove_item
var server_name


# G A M E   S E T T I N G S
# GENERAL SETTINGS
var vid1_video
var general_settings
var general_settings_script

var auto_login
var hard_to_quit
var check_spelling
var live_triggers
var tutorial_done
var pause_on_minimize
var cursor_speed

# RECORDING SETTINGS
var recording_settings

var record_game
var keep_recording
var show_playback_display
var speed_control_keys
var record_audio
var record_audio_length
var sound_sample_rate
var sound_buffer_size

# G R A P H I C S
# VIDEO SETTINGS
var video_settings
var target_fps
var fps_measure
var half_frame_rate

# HUD SETTINGS
var hud_settings
var game_ui
var use_fov
var hud_fov_scale
var fov_max_scale
var force_big_cursor

var graphics_behaviour
var baby_head_down_fac
var baby_body_down_fac
var old_head_forward_fac
var old_head_down_fac
var ground_tile_blur

# C O M M A N D   S E T T I N G S
# EMOTION SETTINGS
var emotion_settings
var emotion_duration
var emotion_happy
var emotion_mad
var emotion_angry
var emotion_sad
var emotion_devious
var emotion_joy
var emotion_blush
var emotion_hubba
var emotion_ill
var emotion_yoohoo
var emotion_hmph
var emotion_love
var emotion_oreally
var emotion_shock
var emotion_clown
var emotion_pog
var emotion_cry
var emotion_tongue
var emotion_sleep
var emotion_broke_love
var emotion_eye_roll
var emotion_erm
var emotion_please
var emotion_cook
var emotion_smith
var emotion_miner
var emotion_farmer
var emotion_tailor
var emotion_hunter

# FERTILITY COMMANDS
var fertility_commands

# INFERTILITY COMMANDS
var infertility_commands


# M O D   S E T T I N G S
var mods_main_script
var mod_settings

var mod_selection_dropdown
var list_without_mods
var list_hetuw_mod
var list_day_cycle_mod
var htw_show_player_info


# C H A N G E   L O G
var change_log
var change_log_script


# L A U N C H E R   S E T T I N G S
var launcher_settings

var font_size
var font_size_spinbox
var font_size_reset

###################################

func finding_nodes(node_name):
	return get_tree().get_root().find_node(node_name, true, false)


func load_variables():
	tween = finding_nodes("Tween")
	
	pop_popups = finding_nodes("pop_popups")
	pop_popup_background = finding_nodes("pop_popup_background")
	pop_wrong_directory = finding_nodes("pop_wrong_directory")
	
	window_resize_control = finding_nodes('window_resize')
	maximize_button = finding_nodes('tb_maximize')
	title_bar = finding_nodes("tb_title_bar")
	title_bar_menu = finding_nodes('tb_menu')
	version = finding_nodes("tb_version")
	bnr_banner = finding_nodes("bnr_banner")
	bnr_button = finding_nodes("bnr_button")
	bnr_label = finding_nodes("bnr_label")
	bnr_panel = finding_nodes("bnr_panel")
#	website_links = finding_nodes("lks_links")
	
	nvp_advanced_split = finding_nodes("nvp_advanced_split")
	nvp_information_split = finding_nodes("nvp_information_split")
	nvp_ScrollContainer = finding_nodes("nvp_scroll_container")
	hsplitcontainer = finding_nodes("HSplitContainer")
	vsplitcontainer = finding_nodes("VSplitContainer")
	tab_root = finding_nodes("tab_root")

#	vid1_margin = finding_nodes("vid1_margin")
#	aud_margin = finding_nodes("aud_margin")
#	nw_margin = finding_nodes("nw_margin")
#	gen_margin = finding_nodes("gen_margin")
	
	
#	vid2_margin = finding_nodes("vid2_margin")
#	hud_margin = finding_nodes("hud_margin")
	gfxb_margin = finding_nodes("gfxb_margin")
#	emo_margin = finding_nodes("emo_margin")
#	fer_margin = finding_nodes("fer_margin")
#	ifr_margin = finding_nodes("ifr_margin")
#	mod_margin = finding_nodes("mod_margin")
	mod_groupbox = finding_nodes("mod_groupbox")
#	chl_margin = finding_nodes("chl_margin")
	accordion_menu = finding_nodes("accordion_menu")
	not_notification = finding_nodes("not_notification")
	
	tabs_root = finding_nodes("tab_root")
	
	# NAVIGATION PANEL
	nav_navigation_panel = finding_nodes("nvp_navigation_panel")
	nav_basic_settings = finding_nodes("nvp_basic_settings")
	nav_advanced_button = finding_nodes("nvp_advanced")
#	nav_advanced_container = finding_nodes("nvp_advanced_container")
	nav_arrow = finding_nodes("nvt_arrow")
	nav_info_button = finding_nodes("nvp_info")
	nav_info_container = finding_nodes("nvp_info_container")
	nav_commands_button = finding_nodes("nvp_change_log")
	
	# LOGIN
	ld_login_data = finding_nodes("ld_login_data")
	ld_username = finding_nodes("ld_username")
	ld_key = finding_nodes("ld_key")
	ld_show_key = finding_nodes("ld_show_key")
	
	# B A S I C   S E T T I N G S
	# SPAWN SETTINGS
	spawn_groupbox = finding_nodes("spn_groupbox")
	spawn_settings = finding_nodes("spn_spawn_settings")
	seed_popup = finding_nodes("sed_popup")
	seed_script = finding_nodes("sed_seed_name")
	seed_name = finding_nodes("sed_sn_lineedit")
	seed_popup_button = finding_nodes("sed_sn_button")
	seed_reset = finding_nodes("sed_sn_reset")
	seed_timer = finding_nodes("sed_sn_timer")
	seed_value = finding_nodes("sed_sv_lineedit")
	seed_value_script = finding_nodes("sed_seed_value")
	seed_popup_container = finding_nodes("pop_container") # Most likely not needed. Might want to delete it.
	seed_popup_scrollcontainer = finding_nodes("pop_scrollcontainer") # Most likely not needed. Might want to delete it.
	
	twin_code = finding_nodes("twc_twin_code")
	twin_code_reset = finding_nodes("twc_reset")
	
	# VIDEO SETTINGS
	vid1_groupbox = finding_nodes("vid1_groupbox")
	vid1_video = finding_nodes("vid1_video")
	
	# fullscreen
	fullscreen = finding_nodes("fs_fullscreen")
	fullscreen_checkbutton = finding_nodes("fs_checkbutton")
	fullscreen_reset = finding_nodes("fs_reset")
	
	# resolution
	resolution = finding_nodes("res_resolution")
	resolution_label = finding_nodes("res_label")
	resolution_dropdown = finding_nodes("res_dropdown")
	resolution_reset = finding_nodes("res_reset")
	resolution_le_x = finding_nodes("res_horizontal")
	resolution_multi = finding_nodes("res_multiply")
	resolution_le_y = finding_nodes("res_vertical")
#	resolution_button = finding_nodes("res_button")
	
	borderless = finding_nodes("bl_borderless")
	borderless_checkbutton = finding_nodes("bl_borderless").get_node("gcb_checkbutton")
	borderless_reset = finding_nodes("bl_borderless").get_node("gcb_reset")
	
	#mousepointer
	mousepointer = finding_nodes("mp_mousepointer")
	mousepointer_dropdown = finding_nodes("mp_dropdown")
	mousepointer_reset = finding_nodes("mp_reset")
	
	# v-sync
	vsync = finding_nodes("vs_vsync")
	vsync_checkbutton = finding_nodes("vs_vsync").get_node("gcb_checkbutton")
	vsync_reset = finding_nodes("vs_vsync").get_node("gcb_reset")
	
	# AUDIO SETTINGS
	aud_audio = finding_nodes("aud_audio")
	
	# audio
	audio = finding_nodes("aud_audio_main_script")
	audio_checkbutton = finding_nodes("av1_checkbutton")
	audio_slider = finding_nodes("av2_slider")
	audio_label = finding_nodes("av2_label")
	audio_reset = finding_nodes("av2_reset")
	
	# music
	music_checkbutton = finding_nodes("mv1_checkbutton")
	music_slider = finding_nodes("mv2_slider")
	music_label = finding_nodes("mv2_label")
	music_reset = finding_nodes("mv2_reset")
	
	# sound
	sound_checkbutton = finding_nodes("sfx1_checkbutton")
	sound_slider = finding_nodes("sfx2_slider")
	sound_label = finding_nodes("sfx2_label")
	sound_reset = finding_nodes("sfx2_reset")
	
	# NETWORK
	nw_popup = finding_nodes("nw_popup")
	server_add_item = finding_nodes("svr_add_item")
	server_remove_item = finding_nodes("svr_remove_item")
	network = finding_nodes("nw_network")
	network_script = finding_nodes("nw_network_main_script")
	
	# server name
	server_name = finding_nodes("svr_server_name")
	server_dropdown = finding_nodes("svr_button")
	server_reset = finding_nodes("svr_reset")
	server_timer = finding_nodes("svr_timer")
	
	# adress
	address = finding_nodes("adr_url")
	
	# port
	port = finding_nodes("prt_port")
	
	# G A M E   S E T T I N G S
	# GENERAL SETTINGS
	gen_groupbox = finding_nodes("gen_groupbox")
	general_settings = finding_nodes("gen_general_settings")
	general_settings_script = finding_nodes("gen_margin")
	
	auto_login = finding_nodes("ali_autologin")
	hard_to_quit = finding_nodes("htq_hard_to_quit")
	check_spelling = finding_nodes("csp_check_spelling")
	live_triggers = finding_nodes("ltr_live_triggers")
	tutorial_done = finding_nodes("tdn_tutorial_done")
	pause_on_minimize = finding_nodes("pom_pause_on_minimize")
	cursor_speed = finding_nodes("csp_cursor_speed")
	
	# RECORD SETTINGS
	recording_settings = finding_nodes("rec_recording")
	
	record_game = finding_nodes("rcg_record_games")
	keep_recording = finding_nodes("krc_keep_recordings")
	show_playback_display = finding_nodes("spd_show_playback_display")
	speed_control_keys = finding_nodes("sck_speed_control_keys")
	record_audio = finding_nodes("rca_record_audio")
	record_audio_length = finding_nodes("ral_record_audio_length")
	sound_sample_rate = finding_nodes("ssr_sound_sample_rate")
	sound_buffer_size = finding_nodes("sbs_sound_buffer_size")
	
	# G R A P H I C   S E T T I N G S
	# VIDEO SETTINGS
	video_settings = finding_nodes("vid2_video")
	target_fps = finding_nodes("tfp_target_fps")
	fps_measure = finding_nodes("fpm_fps_measure")
	half_frame_rate = finding_nodes("hfr_half_frame_rate")
	
	# HUD SETTINGS
	hud_settings = finding_nodes("hud_hud")
	game_ui = finding_nodes("gui_game_ui")
	use_fov = finding_nodes("ufv_use_fov")
	hud_fov_scale = finding_nodes("hfs_hud_fov_scale")
	fov_max_scale = finding_nodes("fms_fov_max_scale")
	force_big_cursor = finding_nodes("fbc_force_big_cursor")
	
	# GRAPHICS BEHAVIOUR SETTINGS
	graphics_behaviour = finding_nodes("gfxb_graphics_behaviour")
	baby_head_down_fac = finding_nodes("bhd_baby_head_down_fac")
	baby_body_down_fac = finding_nodes("bbd_baby_body_down_fac")
	old_head_forward_fac = finding_nodes("ohf_old_head_forward_fac")
	old_head_down_fac = finding_nodes("ohd_old_head_down_fac")
	ground_tile_blur = finding_nodes("gtb_ground_tile_blur")
	
	# C O M M A N D   S E T T I N G S
	# EMOTION SETTIGS
	emotion_settings = finding_nodes("emo_emotions")
	emotion_duration = finding_nodes("emd_emotion_duration")
	emotion_happy = finding_nodes("ehp_happy")
	emotion_mad = finding_nodes("emd_mad")
	emotion_angry = finding_nodes("eag_angry")
	emotion_sad = finding_nodes("esd_sad")
	emotion_devious = finding_nodes("edv_devious")
	emotion_joy = finding_nodes("ejy_joy")
	emotion_blush = finding_nodes("ebl_blush")
	emotion_hubba = finding_nodes("ehu_hubba")
	emotion_ill = finding_nodes("eil_ill")
	emotion_yoohoo = finding_nodes("eyo_yoohoo")
	emotion_hmph = finding_nodes("ehm_hmph")
	emotion_love = finding_nodes("elo_love")
	emotion_oreally = finding_nodes("eor_oreally")
	emotion_shock = finding_nodes("esk_shock")
	emotion_clown = finding_nodes("ecl_clown")
	emotion_pog = finding_nodes("epg_pog")
	emotion_cry = finding_nodes("ecr_cry")
	emotion_tongue = finding_nodes("etn_tongue")
	emotion_sleep = finding_nodes("esl_sleep")
	emotion_broke_love = finding_nodes("ebl_broke_love")
	emotion_eye_roll = finding_nodes("eer_eye_roll")
	emotion_erm = finding_nodes("erm_erm")
	emotion_please = finding_nodes("epl_please")
	emotion_cook = finding_nodes("eck_cook")
	emotion_smith = finding_nodes("esm_smith")
	emotion_miner = finding_nodes("emi_miner")
	emotion_farmer = finding_nodes("efa_farmer")
	emotion_tailor = finding_nodes("eta_tailor")
	emotion_hunter = finding_nodes("ehu_hunter")
	
	# FERTILITY COMMANDS
	fertility_commands = finding_nodes("fer_fertility")
	
	# INFERTILITY COMMANDS
	infertility_commands = finding_nodes("ifr_infertility")
	
	
	# M O D   S E T T I N G S
	mods_main_script = finding_nodes("mod_mods_main_script")
	mod_settings = finding_nodes("mod_mod_settings")
	
	mod_selection_dropdown = finding_nodes("mse_dropdown")
	list_without_mods = finding_nodes("wio_without_mods")
	list_hetuw_mod = finding_nodes("hem_hetuw_mod")
	list_day_cycle_mod = finding_nodes("dcm_day_cycle_mod")
	htw_show_player_info = finding_nodes("htw_show_player_info")
	
	
	# C H A N G E   L O G
	change_log = finding_nodes("chl_change_log")
	change_log_script = finding_nodes("chl_richtext")
	
	
	# L A U N C H E R   S E T T I N G S
	launcher_settings = finding_nodes("lnc_launcher")
	
	font_size = finding_nodes("fsz_font_size")
	font_size_spinbox = finding_nodes("fsz_spinbox")
	font_size_reset = finding_nodes("fsz_reset")
