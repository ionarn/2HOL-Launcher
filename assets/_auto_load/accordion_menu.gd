extends Control

func collapse(margin, groupbox):
	margin.visible = !margin.visible
	var btn_Video = "MarginContainer/HBox_Video/btn_Video"
	if margin.visible == true:
		groupbox.get_node(btn_Video).icon = TL_Icon.menu_opened
	else:
		groupbox.get_node(btn_Video).icon = TL_Icon.menu_closed
