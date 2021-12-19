extends MarginContainer

func finding_nodes(node_name):
	return get_tree().get_root().find_node(node_name, true, false)

onready var mod_margin = finding_nodes('mod_margin')
onready var mod_groupbox = finding_nodes('mod_groupbox')
onready var accordion_menu = finding_nodes('accordion_menu')


# Called when the node enters the scene tree for the first time.
func _ready():
	mod_groupbox.connect('unfold_pressed', self, 'on_mod_unfold_pressed')


func on_mod_unfold_pressed():
	accordion_menu.collapse(mod_margin, mod_groupbox)


