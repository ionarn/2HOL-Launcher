extends MarginContainer

func finding_nodes(node_name):
	return get_tree().get_root().find_node(node_name, true, false)

onready var nw_margin = finding_nodes('nw_margin')
onready var nw_groupbox = finding_nodes('nw_groupbox')
onready var accordion_menu = finding_nodes('accordion_menu')


# Called when the node enters the scene tree for the first time.
func _ready():
	nw_groupbox.connect('unfold_pressed', self, 'on_vid1_unfold_pressed')


func on_vid1_unfold_pressed():
	accordion_menu.collapse(nw_margin, nw_groupbox)
