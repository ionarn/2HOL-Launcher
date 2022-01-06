extends Node

# G L O B A L   C O N S T A N T   V A R I A B L E S

const hsplit_max_offset = 180

const new_server_name = "New Server"
const new_address = ""
const new_port = ""
const section_network = "network"
const key_server = "server"
const key_server_index = "server_index"
const server_name = "server_name"
const server_address = "address"
const server_port = "port"

var file_exists_emotion_words = false
const emo_allowed_characters = "[A-Za-z,/]"
const emotion_list = [ {
	"emo_ui_name": "Happy",
	"emo_default": "/happy",
	"emo_ini_id": 0
	}, {
	"emo_ui_name": "Mad",
	"emo_ini_name": "/mad",
	"emo_ini_id": 1
	}, {
	"emo_ui_name": "Angry",
	"emo_ini_name": "/angry",
	"emo_ini_id": 2
	}, {
	"emo_ui_name": "Sad",
	"emo_ini_name": "/sad",
	"emo_ini_id": 3
	}, {
	"emo_ui_name": "Devious",
	"emo_ini_name": "/devious",
	"emo_ini_id": 4
	}, {
	"emo_ui_name": "Joy",
	"emo_ini_name": "/joy",
	"emo_ini_id": 5
	}, {
	"emo_ui_name": "Blush",
	"emo_ini_name": "/blush",
	"emo_ini_id": 6
	}, {
	"emo_ui_name": "Hubba",
	"emo_ini_name": "/hubba",
	"emo_ini_id": 9
	}, {
	"emo_ui_name": "Ill",
	"emo_ini_name": "/ill",
	"emo_ini_id": 10
	}, {
	"emo_ui_name": "Yoohoo",
	"emo_ini_name": "/yoohoo",
	"emo_ini_id": 11
	}, {
	"emo_ui_name": "Hmph",
	"emo_ini_name": "/hmph",
	"emo_ini_id": 12
	}, {
	"emo_ui_name": "Love",
	"emo_ini_name": "/love",
	"emo_ini_id": 13
	}, {
	"emo_ui_name": "Oreally",
	"emo_ini_name": "/oreally",
	"emo_ini_id": 14
	}, {
	"emo_ui_name": "Shock",
	"emo_ini_name": "/shock",
	"emo_ini_id": 15
	}, {
	"emo_ui_name": "Clown",
	"emo_ini_name": "/clown",
	"emo_ini_id": 17
	}, {
	"emo_ui_name": "Pog",
	"emo_ini_name": "/pog",
	"emo_ini_id": 18
	}, {
	"emo_ui_name": "Cry",
	"emo_ini_name": "/cry",
	"emo_ini_id": 19
	}, {
	"emo_ui_name": "Tongue",
	"emo_ini_name": "/tongue",
	"emo_ini_id": 20
	}, {
	"emo_ui_name": "Sleep",
	"emo_ini_name": "/sleep",
	"emo_ini_id": 21
	}, {
	"emo_ui_name": "Broke Love",
	"emo_ini_name": "/brokelove",
	"emo_ini_id": 22
	}, {
	"emo_ui_name": "Eye Roll",
	"emo_ini_name": "/eyeroll",
	"emo_ini_id": 23
	}, {
	"emo_ui_name": "Erm",
	"emo_ini_name": "/erm",
	"emo_ini_id": 24
	}, {
	"emo_ui_name": "Please",
	"emo_ini_name": "/please",
	"emo_ini_id": 29
	}, {
	"emo_ui_name": "Cook",
	"emo_ini_name": "/cook",
	"emo_ini_id": 31
	}, {
	"emo_ui_name": "Smith",
	"emo_ini_name": "/smith",
	"emo_ini_id": 32
	}, {
	"emo_ui_name": "Miner",
	"emo_ini_name": "/miner",
	"emo_ini_id": 33
	}, {
	"emo_ui_name": "Farmer",
	"emo_ini_name": "/farmer",
	"emo_ini_id": 34
	}, {
	"emo_ui_name": "Tailor",
	"emo_ini_name": "/tailor",
	"emo_ini_id": 35
	}, {
	"emo_ui_name": "Hunter",
	"emo_ini_name": "/hunter",
	"emo_ini_id": 36
	},
]

onready var resource_array = [
	{"Node": TL_Node.auto_login, "default_value": TL_Default.auto_login, "Type": "checkbutton"},
	{"Node": TL_Node.hard_to_quit, "default_value": TL_Default.hard_to_quit, "Type": "checkbutton"},
	{"Node": TL_Node.check_spelling, "default_value": TL_Default.check_spelling, "Type": "checkbutton"},
	{"Node": TL_Node.live_triggers, "default_value": TL_Default.live_triggers, "Type": "checkbutton"},
	{"Node": TL_Node.tutorial_done, "default_value": TL_Default.tutorial_done, "Type": "checkbutton"},
	{"Node": TL_Node.pause_on_minimize, "default_value": TL_Default.pause_on_minimize, "Type": "checkbutton"},
	{"Node": TL_Node.cursor_speed, "default_value": TL_Default.cursor_speed, "Type": "spinbox"},
]


onready var hetuw_setting_list = [
	{"variable_name_code": "htw_show_player_info", "node": TL_Node.htw_show_player_info, "line": 52, "key_name": "init_show_selectedplayerinfo", "info": " // 1 = draw names bigger and show age when hovering over a player"},
	{}
]
