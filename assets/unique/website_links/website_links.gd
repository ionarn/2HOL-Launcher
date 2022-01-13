extends HBoxContainer

onready var tween = $lks_tween
const blend_speed = 0.35
const alpha_value = 0.5

func _ready():
	TL_Signal.connect("register_node", self, "register_nodes")


func register_nodes():
	TL_Node.website_links = self


func set_hint_tooltip():
	$lks_website.hint_tooltip = "2HOL Website\n" + TL_Variables.website_thol
	$lks_github.hint_tooltip = "2HOL GitHub\n" + TL_Variables.website_github
	$lks_discord.hint_tooltip = "2HOL Discord Server\n" + TL_Variables.website_discord
	$lks_twotech.hint_tooltip = "2HOL TwoTech\n" + TL_Variables.website_twotech
	$lks_fandom.hint_tooltip = "2HOL Fandom\n" + TL_Variables.website_fandom
	$lks_patreon.hint_tooltip = "2HOL Patreon\n" + TL_Variables.website_patreon
	$lks_open_collective.hint_tooltip = "2HOL Open Collective\n" + TL_Variables.website_open_collective
	$lks_translator.hint_tooltip = "2HOL Translator\n" + TL_Variables.website_translator


#func set_hint_tooltip():
#	print("VARIABLE set_hint_tooltip(): " + str(TL_Node.website_links))
#	$lks_website.hint_tooltip = "Two Hours One Life Website | " + TL_Variables.website_thol
#	$lks_discord.hint_tooltip = "Two Hours One Life Discord Server | " + TL_Variables.website_discord
#	$lks_onetech.hint_tooltip = "Two Hours One Life OneTech | " + TL_Variables.website_onetech
#	$lks_gamepedia.hint_tooltip = "Two Hours One Life Gamepedia | " + TL_Variables.website_gamepedia
#	$lks_patreon.hint_tooltip = "Two Hours One Life Patreon| " + TL_Variables.website_patreon
#	$lks_translator.hint_tooltip = "Two Hours One Life Translator | " + TL_Variables.website_translator


''' 2HOL WEBSITE '''
func _on_lks_website_pressed():
	OS.shell_open(TL_Variables.website_thol)

func _on_lks_website_mouse_entered():
	tween_modulate($lks_website, 1)

func _on_lks_website_mouse_exited():
	tween_modulate($lks_website, alpha_value)


''' TWOTECH '''
func _on_lks_twotech_pressed():
	OS.shell_open(TL_Variables.website_twotech)

func _on_lks_twotech_mouse_entered():
	tween_modulate($lks_twotech, 1)

func _on_lks_twotech_mouse_exited():
	tween_modulate($lks_twotech, alpha_value)


''' TRANSLATOR '''
func _on_lks_translator_pressed():
	OS.shell_open(TL_Variables.website_translator)

func _on_lks_translator_mouse_entered():
	tween_modulate($lks_translator, 1)

func _on_lks_translator_mouse_exited():
	tween_modulate($lks_translator, alpha_value)


''' GITHUB '''
func _on_lks_github_pressed():
	OS.shell_open(TL_Variables.website_github)

func _on_lks_github_mouse_entered():
	tween_modulate($lks_github, 1)

func _on_lks_github_mouse_exited():
	tween_modulate($lks_github, alpha_value)


''' DISCORD '''
func _on_lks_discord_pressed():
	OS.shell_open(TL_Variables.website_discord)

func _on_lks_discord_mouse_entered():
	tween_modulate($lks_discord, 1)

func _on_lks_discord_mouse_exited():
	tween_modulate($lks_discord, alpha_value)


''' FANDOM '''
func _on_lks_fandom_pressed():
	OS.shell_open(TL_Variables.website_gamepedia)

func _on_lks_fandom_mouse_entered():
	tween_modulate($lks_fandom, 1)

func _on_lks_fandom_mouse_exited():
	tween_modulate($lks_fandom, alpha_value)


''' PATREON '''
func _on_lks_patreon_pressed():
	OS.shell_open(TL_Variables.website_patreon)

func _on_lks_patreon_mouse_entered():
	tween_modulate($lks_patreon, 1)

func _on_lks_patreon_mouse_exited():
	tween_modulate($lks_patreon, alpha_value)


''' OPEN COLLECTIVE '''
func _on_lks_open_collective_pressed():
	OS.shell_open(TL_Variables.website_open_collective)

func _on_lks_open_collective_mouse_entered():
	tween_modulate($lks_open_collective, 1)

func _on_lks_open_collective_mouse_exited():
	tween_modulate($lks_open_collective, alpha_value)


''' TWEEN MODULATE '''
func tween_modulate(node: Node, to_alpha: float):
	tween.interpolate_property(node, "modulate",
			node.modulate, Color(1, 1, 1, to_alpha), blend_speed,
			Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
	tween.start()
