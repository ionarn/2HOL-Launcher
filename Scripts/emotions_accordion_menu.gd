extends MarginContainer

func finding_nodes(node_name):
	return get_tree().get_root().find_node(node_name, true, false)

onready var emo_margin = finding_nodes('emo_margin')
onready var emo_groupbox = finding_nodes('emo_groupbox')
onready var accordion_menu = finding_nodes('accordion_menu')


# Called when the node enters the scene tree for the first time.
func _ready():
	emo_groupbox.connect('unfold_pressed', self, 'on_emo_unfold_pressed')


func on_emo_unfold_pressed():
	accordion_menu.collapse(emo_margin, emo_groupbox)
