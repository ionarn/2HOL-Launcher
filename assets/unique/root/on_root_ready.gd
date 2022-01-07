extends Control

signal is_ready

# Called when the node enters the scene tree for the first time.
func _ready():
	emit_signal("is_ready")
	TL_Node.load_variables()
	TL_Font.load_variables()
	TL_Default.load_variables()
	TL_Scene.load_variables()
	TL_Variables.load_variables()
	
	TL_OnReady.on_loading_ready()
