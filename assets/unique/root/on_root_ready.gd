extends Control

signal is_ready

# Called when the node enters the scene tree for the first time.
func _ready():
#	emit_signal("is_ready")
	TL_Default.load_variables()
	TL_Node.load_variables()
#	TL_Signal.emit_signal("register_node")
	TL_Font.load_variables()
	TL_Scene.load_variables()
	TL_Variables.load_variables()
	
	TL_OnReady.on_loading_ready()
#	$Timer.start()
	
#	if TL_Default.finished_loading == true:
#		TL_OnReady.on_loading_ready()


#func _on_Timer_timeout():
#	if TL_Default.finished_loading == true:
#		TL_OnReady.on_loading_ready()
