extends Control

var section = 'seeds'
var key = 'seeds'
var stuff = [123,546,756]

var launcher_settings_path = "./settings/launcher_settings.ini"
var config = ConfigFile.new()
var load_response = config.load(launcher_settings_path)

func finding_nodes(node_name):
	return get_tree().get_root().find_node(node_name, true, false)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():
#	if config.has_section(section) == false:
#	config.set_value(section, key, [ {"seed": "K3F0H", "note": "Twistington"} ])
#	config.set_value(section, key, stuff)
#	config.save(launcher_settings_path)
	
#	if config.has_section('seeds') == false:
#	config.set_value('seeds', 'seed', stuff)
#	config.save(launcher_settings_path)
#	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
