extends HBoxContainer

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.

#	-------------------------------------------------------

''' WEBSITE BUTTON '''
func _on_Btn_Website_pressed():
	var website = 'https://twohoursonelife.com'
	OS.shell_open(website)


''' DISCORD BUTTON '''
func _on_Btn_Discord_pressed():
	OS.shell_open('https://discord.gg/GNg3JUX')


''' ONETECH BUTTON '''
func _on_Btn_OneTech_pressed():
	OS.shell_open('https://onetech.twohoursonelife.com/')


''' GAMEPEDIA BUTTON '''
func _on_Btn_Gamepedia_pressed():
	OS.shell_open('https://twohoursonelife.gamepedia.com/Two_Hours,_One_Life_Wiki')


''' PATREON BUTTON '''
func _on_Btn_Patreon_pressed():
	OS.shell_open('https://www.patreon.com/twohoursonelife')


func _on_lks_translator_pressed():
	OS.shell_open('http://tholr.online/language')
