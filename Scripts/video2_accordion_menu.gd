extends MarginContainer

func finding_nodes(node_name):
	return get_tree().get_root().find_node(node_name, true, false)

onready var vid2_margin = finding_nodes('vid2_margin')
onready var vid2_groupbox = finding_nodes('vid2_groupbox')
onready var accordion_menu = finding_nodes('accordion_menu')


# Called when the node enters the scene tree for the first time.
func _ready():
	vid2_groupbox.connect('unfold_pressed', self, 'on_vid2_unfold_pressed')


func on_vid2_unfold_pressed():
	accordion_menu.collapse(vid2_margin, vid2_groupbox)
