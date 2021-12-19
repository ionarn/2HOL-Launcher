extends MarginContainer

func finding_nodes(node_name):
	return get_tree().get_root().find_node(node_name, true, false)

onready var rec_margin = finding_nodes('rec_margin')
onready var rec_groupbox = finding_nodes('rec_groupbox')
onready var accordion_menu = finding_nodes('accordion_menu')


# Called when the node enters the scene tree for the first time.
func _ready():
	rec_groupbox.connect('unfold_pressed', self, 'on_vid1_unfold_pressed')


func on_vid1_unfold_pressed():
	accordion_menu.collapse(rec_margin, rec_groupbox)
