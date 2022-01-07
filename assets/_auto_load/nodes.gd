extends Control

var pop_popup_background
var pop_wrong_directory

var window_resize_control
var maximize_button

var title_bar
var title_bar_menu
var version
var bnr_label
var bnr_panel

var nvp_ScrollContainer
var hsplitcontainer
var vsplitcontainer
var tab_root

var sed_margin
var vid1_margin
var aud_margin
var nw_margin
var gen_margin
var rec_margin
var gen_groupbox
var vid2_margin
var hud_margin
var gfxb_margin
var emo_margin
var fer_margin
var ifr_margin
var mod_margin
var mod_groupbox
var chl_margin
var accordion_menu

var tabs_root
var nav_navigation_panel
var nav_basic_settings
var nav_advanced_button
var nav_advanced_container
var nav_arrow
var nav_info_button
var nav_info_container
var nav_commands_button

var ld_login_data
var ld_username
var ld_key
var ld_show_key

var spawn_seed
var sps_button
var sps_popup
var sps_spawn_seed
var sps_note
var sps_container
var sps_scrollcontainer
var sps_reset

var network
var server_dropdown
var server_reset
var address
var port
var server_add_item
var server_remove_item
var server_name
var nw_popup

var audio
var audio_checkbutton
var audio_slider
var audio_label
var audio_reset

var music_checkbutton
var music_slider
var music_label
var music_reset

var sound_checkbutton
var sound_slider
var sound_label
var sound_reset

var resolution
var resolution_label
var resolution_dropdown
var resolution_reset
var resolution_le_x
var resolution_multi
var resolution_le_y
var resolution_button

var fullscreen
var fullscreen_checkbutton
var fullscreen_reset

var mousepointer
var mousepointer_dropdown
var mousepointer_reset

var vsync
var vsync_checkbutton
var vsync_reset

var general_settings
var auto_login
var hard_to_quit
var check_spelling
var live_triggers
var tutorial_done
var pause_on_minimize
var cursor_speed

var record_game
var keep_recording
var show_playback_display
var speed_control_keys
var record_audio
var record_audio_length
var sound_sample_rate
var sound_buffer_size

var target_fps
var fps_measure
var half_frame_rate
var game_ui
var use_fov
var hud_fov_scale
var fov_max_scale
var force_big_cursor
var baby_head_down_fac
var baby_body_down_fac
var old_head_forward_fac
var old_head_down_fac
var ground_tile_blur

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

var mods_main_script
var mod_selection_dropdown
var list_without_mods
var list_hetuw_mod
var list_day_cycle_mod
var htw_show_player_info

var font_size
var font_size_spinbox
var font_size_reset

###################################

func finding_nodes(node_name):
	return get_tree().get_root().find_node(node_name, true, false)


func load_variables():
	pop_popup_background = finding_nodes("pop_popup_background")
	pop_wrong_directory = finding_nodes("pop_wrong_directory")
	
	window_resize_control = finding_nodes('window_resize')
	maximize_button = finding_nodes('tb_maximize')
	
	title_bar = finding_nodes("tb_title_bar")
	title_bar_menu = finding_nodes('tb_menu')
	version = finding_nodes("tb_version")
	bnr_label = finding_nodes("bnr_label")
	bnr_panel = finding_nodes("bnr_panel")

	nvp_ScrollContainer = finding_nodes("nvp_ScrollContainer")
	hsplitcontainer = finding_nodes("HSplitContainer")
	vsplitcontainer = finding_nodes("VSplitContainer")
	tab_root = finding_nodes("tab_root")

	sed_margin = finding_nodes("sed_margin")
	vid1_margin = finding_nodes("vid1_margin")
	aud_margin = finding_nodes("aud_margin")
	nw_margin = finding_nodes("nw_margin")
	gen_margin = finding_nodes("gen_margin")
	rec_margin = finding_nodes("rec_margin")
	gen_groupbox = finding_nodes("gen_groupbox")
	vid2_margin = finding_nodes("vid2_margin")
	hud_margin = finding_nodes("hud_margin")
	gfxb_margin = finding_nodes("gfxb_margin")
	emo_margin = finding_nodes("emo_margin")
	fer_margin = finding_nodes("fer_margin")
	ifr_margin = finding_nodes("ifr_margin")
	mod_margin = finding_nodes("mod_margin")
	mod_groupbox = finding_nodes("mod_groupbox")
	chl_margin = finding_nodes("chl_margin")
	accordion_menu = finding_nodes("accordion_menu")

	tabs_root = finding_nodes("tab_root")
	nav_navigation_panel = finding_nodes("nvp_navigation_panel")
	nav_basic_settings = finding_nodes("nvp_basic_settings")
	nav_advanced_button = finding_nodes("nvp_advanced")
	nav_advanced_container = finding_nodes("nvp_advanced_container")
	nav_arrow = finding_nodes("nvt_arrow")
	nav_info_button = finding_nodes("nvp_info")
	nav_info_container = finding_nodes("nvp_info_container")
	nav_commands_button = finding_nodes("nvp_change_log")

	ld_login_data = finding_nodes("ld_login_data")
	ld_username = finding_nodes("ld_username")
	ld_key = finding_nodes("ld_key")
	ld_show_key = finding_nodes("ld_show_key")

	spawn_seed = finding_nodes("spawn_seed")
	sps_button = finding_nodes("sps_button")
	sps_popup = finding_nodes("sps_popup")
	sps_spawn_seed = finding_nodes("sps_spawn_seed")
	sps_note = finding_nodes("sps_note")
	sps_container = finding_nodes("sps_container")
	sps_scrollcontainer = finding_nodes("sps_scrollcontainer")
	sps_reset = finding_nodes("sps_reset")

	network = finding_nodes("nw_network_main_script")
	server_dropdown = finding_nodes("svr_button")
	server_reset = finding_nodes("svr_reset")
	address = finding_nodes("adr_url")
	port = finding_nodes("prt_port")
	server_add_item = finding_nodes("svr_add_item")
	server_remove_item = finding_nodes("svr_remove_item")
	server_name = finding_nodes("svr_server_name")
	nw_popup = finding_nodes("nw_popup")

	audio = finding_nodes("aud_audio_main_script")
	audio_checkbutton = finding_nodes("av1_checkbutton")
	audio_slider = finding_nodes("av2_slider")
	audio_label = finding_nodes("av2_label")
	audio_reset = finding_nodes("av2_reset")

	music_checkbutton = finding_nodes("mv1_checkbutton")
	music_slider = finding_nodes("mv2_slider")
	music_label = finding_nodes("mv2_label")
	music_reset = finding_nodes("mv2_reset")

	sound_checkbutton = finding_nodes("sfx1_checkbutton")
	sound_slider = finding_nodes("sfx2_slider")
	sound_label = finding_nodes("sfx2_label")
	sound_reset = finding_nodes("sfx2_reset")

	resolution = finding_nodes("res_resolution")
	resolution_label = finding_nodes("res_label")
	resolution_dropdown = finding_nodes("res_dropdown")
	resolution_reset = finding_nodes("res_reset")
	resolution_le_x = finding_nodes("res_horizontal")
	resolution_multi = finding_nodes("res_multiply")
	resolution_le_y = finding_nodes("res_vertical")
	resolution_button = finding_nodes("res_button")

	fullscreen = finding_nodes("fs_fullscreen")
	fullscreen_checkbutton = finding_nodes("fs_checkbutton")
	fullscreen_reset = finding_nodes("fs_reset")
	
	mousepointer = finding_nodes("mp_mousepointer")
	mousepointer_dropdown = finding_nodes("mp_dropdown")
	mousepointer_reset = finding_nodes("mp_reset")
	
	vsync = finding_nodes("vs_vsync")
	vsync_checkbutton = finding_nodes("gcb_checkbutton")
	vsync_reset = finding_nodes("gcb_reset")
	
	general_settings = finding_nodes("gen_general")
	auto_login = finding_nodes("ali_autologin")
	hard_to_quit = finding_nodes("htq_hard_to_quit")
	check_spelling = finding_nodes("csp_check_spelling")
	live_triggers = finding_nodes("ltr_live_triggers")
	tutorial_done = finding_nodes("tdn_tutorial_done")
	pause_on_minimize = finding_nodes("pom_pause_on_minimize")
	cursor_speed = finding_nodes("csp_cursor_speed")
	
	record_game = finding_nodes("rcg_record_games")
	keep_recording = finding_nodes("krc_keep_recordings")
	show_playback_display = finding_nodes("spd_show_playback_display")
	speed_control_keys = finding_nodes("sck_speed_control_keys")
	record_audio = finding_nodes("rca_record_audio")
	record_audio_length = finding_nodes("ral_record_audio_length")
	sound_sample_rate = finding_nodes("ssr_sound_sample_rate")
	sound_buffer_size = finding_nodes("sbs_sound_buffer_size")
	
	target_fps = finding_nodes("tfp_target_fps")
	fps_measure = finding_nodes("fpm_fps_measure")
	half_frame_rate = finding_nodes("hfr_half_frame_rate")
	game_ui = finding_nodes("gui_game_ui")
	use_fov = finding_nodes("ufv_use_fov")
	hud_fov_scale = finding_nodes("hfs_hud_fov_scale")
	fov_max_scale = finding_nodes("fms_fov_max_scale")
	force_big_cursor = finding_nodes("fbc_force_big_cursor")
	baby_head_down_fac = finding_nodes("bhd_baby_head_down_fac")
	baby_body_down_fac = finding_nodes("bbd_baby_body_down_fac")
	old_head_forward_fac = finding_nodes("ohf_old_head_forward_fac")
	old_head_down_fac = finding_nodes("ohd_old_head_down_fac")
	ground_tile_blur = finding_nodes("gtb_ground_tile_blur")
	
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
	
	mods_main_script = finding_nodes("mod_mods_main_script")
	mod_selection_dropdown = finding_nodes("mse_dropdown")
	list_without_mods = finding_nodes("wio_without_mods")
	list_hetuw_mod = finding_nodes("hem_hetuw_mod")
	list_day_cycle_mod = finding_nodes("dcm_day_cycle_mod")
	htw_show_player_info = finding_nodes("htw_show_player_info")
	
	font_size = finding_nodes("fsz_font_size")
	font_size_spinbox = finding_nodes("fsz_spinbox")
	font_size_reset = finding_nodes("fsz_reset")
