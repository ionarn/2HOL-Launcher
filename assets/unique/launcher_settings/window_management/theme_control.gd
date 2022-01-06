extends Control

var selection_color = Color(1, 0.729412, 0.211765)
var cursor_color = Color(0.921569, 0.921569, 0.921569)
var clear_button_color_pressed = Color(1, 0.729412, 0.211765)
var font_color_selected = Color(0.086275, 0.094118, 0.109804)
var font_color = Color(0.921569, 0.921569, 0.921569)
var clear_button_color = Color(0.921569, 0.921569, 0.921569)
var font_color_uneditable = Color(0.258824, 0.258824, 0.258824)
var dynamic_font = DynamicFont.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func color_lineedit(node):
	node.set('custom_colors/selection_color', selection_color)
	node.set('custom_colors/cursor_color', cursor_color)
	node.set('custom_colors/clear_button_color_pressed', clear_button_color_pressed)
	node.set('custom_colors/font_color_selected', font_color_selected)
	node.set('custom_colors/font_color', font_color)
	node.set('custom_colors/clear_button_color', clear_button_color)
	node.set('custom_colors/font_color_uneditable', font_color_uneditable)
