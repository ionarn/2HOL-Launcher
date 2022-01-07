extends HBoxContainer

var frame_rates = [30, 60, 100, 120, 144]


# Called when the node enters the scene tree for the first time.
#func _ready():
#	$tfp_reset.connect("button_pressed", self, "_on_reset_button_pressed")


func load_value():
	$tfp_reset.connect("button_pressed", self, "_on_reset_button_pressed")
	
	load_ini(TL_Path.target_frame_rate, frame_rates)
	reset_button_visibility(frame_rates[$tfp_dropdown.selected], TL_Default.target_frame_rate)


func load_ini(ini_path, frame_rates):
	var file = File.new()
	file.open(ini_path, File.READ)
	var array_index = frame_rates.find(int(file.get_as_text()))
	$tfp_dropdown.selected = array_index


func write_to_ini(ini_path, fps):
	var file = File.new()
	file.open(ini_path, File.WRITE)
	file.store_string(str(fps))


func _on_tfp_dropdown_item_selected(index):
	write_to_ini(TL_Path.target_frame_rate, frame_rates[index])
	reset_button_visibility(frame_rates[$tfp_dropdown.selected], TL_Default.target_frame_rate)


func _on_reset_button_pressed():
	$tfp_dropdown.selected = frame_rates.find(int(TL_Default.target_frame_rate))
	write_to_ini(TL_Path.target_frame_rate, TL_Default.target_frame_rate)
	reset_button_visibility(frame_rates[$tfp_dropdown.selected], TL_Default.target_frame_rate)

func reset_button_visibility(selected_value, default_value):
	if selected_value == int(default_value):
		$tfp_reset.set_visible(false)
	else:
		$tfp_reset.set_visible(true)
