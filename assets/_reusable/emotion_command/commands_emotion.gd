tool
extends HBoxContainer

export(String,
"Happy",
"Mad",
"Angry",
"Sad",
"Devious",
"Joy",
"Blush",
"Hubba",
"Ill",
"Yoohoo",
"Hmph",
"Love",
"Oreally",
"Shock",
"Clown",
"Pog",
"Cry",
"Tongue",
"Sleep",
"Broke Love",
"Eye Roll",
"Erm",
"Please",
"Cook",
"Smith",
"Miner",
"Farmer",
"Tailor",
"Hunter") var emo_label_text = "Emotion" setget set_emo_label_text, get_emo_label_text

var assigned_emotion = 0
var emo_signature = ""

var config = ConfigFile.new()
var load_response = config.load(TL_Path.launcher_settings)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
#	$emo_reset.connect("button_pressed", self, "_on_reset_pressed")


func load_value():
	$emo_reset.connect("button_pressed", self, "_on_reset_pressed")
	
	var file = File.new()
	if file.file_exists(TL_Path.emotion_words) == false:
		file.open(TL_Path.emotion_words, file.WRITE)
		file.store_string(
					TL_Default.emo_happy + "\n" + 
					TL_Default.emo_mad + "\n" + 
					TL_Default.emo_angry + "\n" + 
					TL_Default.emo_sad + "\n" + 
					TL_Default.emo_devious + "\n" + 
					TL_Default.emo_joy + "\n" + 
					TL_Default.emo_blush + "\n" + 
					"*yellowFever\n" + 
					"*snowSplat\n" + 
					TL_Default.emo_hubba + "\n" + 
					TL_Default.emo_ill + "\n" + 
					TL_Default.emo_yoohoo + "\n" + 
					TL_Default.emo_hmph + "\n" + 
					TL_Default.emo_love + "\n" + 
					TL_Default.emo_oreally + "\n" + 
					TL_Default.emo_shock + "\n" + 
					"*murderface\n" + 
					TL_Default.emo_clown + "\n" + 
					TL_Default.emo_pog + "\n" + 
					TL_Default.emo_cry + "\n" + 
					TL_Default.emo_tongue + "\n" + 
					TL_Default.emo_sleep + "\n" + 
					TL_Default.emo_brokelove + "\n" + 
					TL_Default.emo_eyeroll + "\n" + 
					TL_Default.emo_erm + "\n" + 
					"*starving\n" + 
					"*spicyFood\n" + 
					"*drunk\n" + 
					"*sourface\n" + 
					TL_Default.emo_please + "\n" + 
					"*tripping\n" + 
					TL_Default.emo_cook + "\n" + 
					TL_Default.emo_smith + "\n" + 
					TL_Default.emo_miner + "\n" + 
					TL_Default.emo_farmer + "\n" + 
					TL_Default.emo_tailor + "\n" + 
					TL_Default.emo_hunter
		)
	file.close()
	populate_emotion_lineedit()
	reset_button_visibility()


func populate_emotion_lineedit():
	var emo_array = read_emotionWords()
	var line_counter = 0
	for emotion in TL_Variables.emotion_list:
		if $emo_label.text == emotion["emo_ui_name"]:
			assigned_emotion = line_counter
		line_counter += 1
	$emo_lineedit.text = emo_array[TL_Variables.emotion_list[assigned_emotion]["emo_ini_id"]]


func set_emo_label_text(text):
	emo_label_text = text
	var label = $emo_label
	if label:
		label.text = text
	var lineedit = $emo_lineedit
	if lineedit:
		var new_text = text.replace(" ", "")
		new_text = new_text.to_lower()
		lineedit.placeholder_text = "/" + new_text
		emo_signature = "emo_" + new_text


func get_emo_label_text():
	return emo_label_text


func filter_allowed_characters(text):
	var old_caret_position = $emo_lineedit.caret_position
	var word = ""
	var regex = RegEx.new()
	regex.compile(TL_Variables.emo_allowed_characters)
	for valid_character in regex.search_all(text):
		word += valid_character.get_string()
	if not "/" in word:
		word =  "/" + word
	$emo_lineedit.text = word.to_lower()
	$emo_lineedit.caret_position = old_caret_position
	return word


func read_emotionWords():
	var file = File.new()
	file.open(TL_Path.emotion_words, File.READ)
	var emo_array = []
	while not file.eof_reached():
		emo_array.append(file.get_line())
	file.close()
	return emo_array


func write_to_emotionWords(emotion_array: Array, new_text: String):
	var file = File.new()
	var linecounter = 0
	emotion_array[TL_Variables.emotion_list[assigned_emotion]["emo_ini_id"]] = new_text.to_lower()
	var assembled_text = ""
	for line in emotion_array:
		linecounter += 1
		assembled_text = assembled_text + line
		if linecounter < emotion_array.size():
			assembled_text = assembled_text + "\n"
	file.open(TL_Path.emotion_words, File.WRITE)
	file.store_string(assembled_text)
	file.close()


func _on_ehp_lineedit_text_changed(new_text):
	var file = File.new()
	if file.file_exists(TL_Path.emotion_words) == true:
		var word = filter_allowed_characters(new_text)
		var emo_array = read_emotionWords()
		write_to_emotionWords(emo_array, word)
		reset_button_visibility()


func reset_button_visibility():
	if $emo_lineedit.text == evaluate("TL_Default." + emo_signature):
		$emo_reset.set_visible(false)
	else:
		$emo_reset.set_visible(true)


func _on_reset_pressed():
	var default_value = evaluate("TL_Default." + emo_signature)
	$emo_lineedit.text = default_value
	write_to_emotionWords(read_emotionWords(), default_value)
	reset_button_visibility()


func evaluate(input: String):
	var script = GDScript.new()
	script.set_source_code("func eval():\n\treturn " + input)
	script.reload()
	var obj = Reference.new()
	obj.set_script(script)
	return obj.eval()
