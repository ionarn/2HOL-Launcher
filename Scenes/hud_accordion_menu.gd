extends MarginContainer

func finding_nodes(node_name):
	return get_tree().get_root().find_node(node_name, true, false)

onready var hud_margin = finding_nodes('hud_margin')
onready var hud_groupbox = finding_nodes('hud_groupbox')
onready var accordion_menu = finding_nodes('accordion_menu')


# Called when the node enters the scene tree for the first time.
func _ready():
	hud_groupbox.connect('unfold_pressed', self, 'on_hud_unfold_pressed')


func on_hud_unfold_pressed():
	accordion_menu.collapse(hud_margin, hud_groupbox)
