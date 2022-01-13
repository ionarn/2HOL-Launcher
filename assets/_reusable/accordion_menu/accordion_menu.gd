tool
extends PanelContainer

var style_content_tree_normal = load("res://theme/ContentTree/ContentTree_Normal.tres")
var style_content_tree_focus = load("res://theme/ContentTree/ContentTree_Focus.tres")
var style_content_tree_pressed = load("res://theme/ContentTree/ContentTree_Pressed.tres")
var style_content_tree_hover = load("res://theme/ContentTree/ContentTree_Pressed.tres")

var style_nav_panel_normal = load("res://theme/Navigation_Tree/Maintab/Advanced/Advanced_Normal.tres")
var style_nav_panel_focus = load("res://theme/Navigation_Tree/Maintab/Advanced/Advanced_Focus.tres")
var style_nav_panel_pressed = load("res://theme/Navigation_Tree/Maintab/Advanced/Advanced_Pressed.tres")
var style_nav_panel_hover = load("res://theme/Navigation_Tree/Maintab/Advanced/Advanced_Hover.tres")

export(String) var text = "Name" setget set_text, get_text
export(String) var hiding_container_node = ""
export(bool) var use_reset_button = true setget set_use_reset_button, get_use_reset_button
export(String, "Content Area", "Navigation Panel") var use_case setget set_use_case, get_use_case

signal reset_pressed

# ---------------------

#func _ready():


func set_text(new_text):
	var label = $acm_margin/acm_hbox/acm_button
	text = new_text.to_upper()
	if label:
		label.text = new_text.to_upper()


func get_text():
	return text


func set_use_reset_button(new_boolean):
	var reset = $acm_margin/acm_hbox/acm_reset
	use_reset_button = new_boolean
	if reset:
		reset.visible = new_boolean


func get_use_reset_button():
	return use_reset_button


func set_use_case(new_selection):
	use_case = new_selection
	if new_selection == "Content Area":
		$acm_margin/acm_hbox/acm_button.set("custom_styles/normal", style_content_tree_normal)
		$acm_margin/acm_hbox/acm_button.set("custom_styles/focus", style_content_tree_focus)
		$acm_margin/acm_hbox/acm_button.set("custom_styles/pressed", style_content_tree_pressed)
		$acm_margin/acm_hbox/acm_button.set("custom_styles/hover", style_content_tree_hover)
		$acm_margin/acm_hbox/acm_button.set("custom_colors/font_color", Color(1, 0.733333, 0.207843))
		$acm_margin.set("custom_constants/margin_left", 3)
		$acm_margin/acm_hbox/acm_button/acm_sprite.position = Vector2(6, 19)
	elif new_selection == "Navigation Panel":
		$acm_margin/acm_hbox/acm_button.set("custom_styles/normal", style_nav_panel_normal)
		$acm_margin/acm_hbox/acm_button.set("custom_styles/focus", style_nav_panel_focus)
		$acm_margin/acm_hbox/acm_button.set("custom_styles/pressed", style_nav_panel_pressed)
		$acm_margin/acm_hbox/acm_button.set("custom_styles/hover", style_nav_panel_hover)
		$acm_margin/acm_hbox/acm_button.set("custom_colors/font_color", Color(0.772549, 0.776471, 0.780392))
		$acm_margin.set("custom_constants/margin_left", 0)
		$acm_margin/acm_hbox/acm_button/acm_sprite.position = Vector2(21, 21)

func get_use_case():
	return use_case


func _on_btn_Video_pressed():
	var container = TL_Func.exec("TL_Node." + hiding_container_node)
	collapse(container, self)


func _on_name_reset_button_pressed():
	emit_signal('reset_pressed')


func collapse(container, accordion_menu):
#	container.visible = !container.visible
	var button = $acm_margin/acm_hbox/acm_button
	$acm_margin.get_child(0)
	var tween = $acm_tween
	var arrow = $acm_margin/acm_hbox/acm_button/acm_sprite
	if container.rect_min_size == Vector2(0, 0):
		container.visible = true
		tween.interpolate_property(container, "rect_min_size",
				container.rect_min_size, Vector2(0, container.get_child(0).rect_size.y), 0.65,
				Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
		tween.interpolate_property(container, "modulate",
				Color(1, 1, 1, 0), Color(1, 1, 1, 1), 0.65,
				Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
		tween.interpolate_property(arrow, "rotation_degrees",
				0, 90, 0.65,
				Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
		tween.start()
		container.visible = true
	
	elif container.rect_min_size == Vector2(0, container.get_child(0).rect_size.y):
		container.mouse_filter = 2
		tween.interpolate_property(container, "rect_min_size",
				container.rect_min_size, Vector2(0, 0), 0.65,
				Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
		tween.interpolate_property(container, "modulate",
				Color(1, 1, 1, 1), Color(1, 1, 1, 0), 0.65,
				Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
		tween.interpolate_property(arrow, "rotation_degrees",
				90, 0, 0.65,
				Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
		tween.start()
	
#	if container.visible == true:
#		groupbox.get_node(button).icon = TL_Icon.menu_opened
#	else:
#		groupbox.get_node(button).icon = TL_Icon.menu_closed


func _on_acm_tween_tween_completed(object, key):
	var container = TL_Func.exec("TL_Node." + hiding_container_node)
	if container.rect_min_size == Vector2(0, 0):
		container.visible = false
	if container.rect_min_size.y == container.get_child(0).rect_size.y:
		container.mouse_filter = 0


func set_reset_visible(boolean: bool):
	$acm_margin/acm_hbox/acm_reset.set_visible(boolean)
