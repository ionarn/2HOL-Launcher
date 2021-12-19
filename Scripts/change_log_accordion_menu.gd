extends MarginContainer

func finding_nodes(node_name):
	return get_tree().get_root().find_node(node_name, true, false)

onready var chl_margin = finding_nodes('chl_margin')
onready var chl_groupbox = finding_nodes('chl_groupbox')
onready var accordion_menu = finding_nodes('accordion_menu')


# Called when the node enters the scene tree for the first time.
func _ready():
	chl_groupbox.connect('unfold_pressed', self, 'on_chl_unfold_pressed')
	chl_groupbox.get_node('MarginContainer/HBox_Video/name_reset').visible = false


func on_chl_unfold_pressed():
	accordion_menu.collapse(chl_margin, chl_groupbox)
