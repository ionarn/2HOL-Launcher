extends MarginContainer

func finding_nodes(node_name):
	return get_tree().get_root().find_node(node_name, true, false)

onready var gfxb_margin = finding_nodes('gfxb_margin')
onready var gfxb_groupbox = finding_nodes('gfxb_groupbox')
onready var accordion_menu = finding_nodes('accordion_menu')


# Called when the node enters the scene tree for the first time.
func _ready():
	gfxb_groupbox.connect('unfold_pressed', self, 'on_gfxb_unfold_pressed')


func on_gfxb_unfold_pressed():
	accordion_menu.collapse(gfxb_margin, gfxb_groupbox)
