extends Control

''' VARIABLES '''
#var server_default = 0
var server_name_new = 'Custom Server'

var new_server_name = "New Server"
var new_address = ""
var new_port = ""

var section_nw = "network"
var server = "server"
var key_server_name = "server_name"
var key_address = "address"
var key_port = "port"
var server_index = "server_index"

#	-------------------------------------------------------

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass
#	TL_Node.nw_popup.connect("item_selected", self, "_on_server_dropdown_item_selected")
#	TL_Node.nw_popup.connect("pressed_add", self, "_on_server_dropdown_add_item_pressed")
#	TL_Node.nw_popup.connect("pressed_remove", self, "_on_server_dropdown_remove_item_pressed")
#	TL_Node.server_reset.connect('button_pressed', self, 'on_server_reset_pressed')


func load_values():
	TL_Node.nw_popup.connect("item_selected", self, "_on_server_dropdown_item_selected")
	TL_Node.nw_popup.connect("pressed_add", self, "_on_server_dropdown_add_item_pressed")
	TL_Node.nw_popup.connect("pressed_remove", self, "_on_server_dropdown_remove_item_pressed")
	TL_Node.nw_popup.connect("becomes_hidden", self, "_on_nw_popup_becomes_hidden")
	TL_Node.server_reset.connect('button_pressed', self, 'on_server_reset_pressed')
	
#	var file = File.new()
#	if file.file_exists(TL_Path.launcher_settings) == false or config.has_section("network") == false:
#		config.set_value("defaults", "server", [{
#			'server_name': "Two Hours One Life",
#			'address': "play.twohoursonelife.com",
#			'port': 8005
#		}])
#		config.set_value("defaults", "server_index", 0)
#		config.set_value("network", 'server', [{
#			'server_name': "Two Hours One Life",
#			'address': "play.twohoursonelife.com",
#			'port': 8005
#		}])
#		config.set_value("network", 'server_index', 0)
#		config.set_value(TL_Variables.section_network, TL_Variables.key_server, TL_Default.server_address)
#		config.set_value(TL_Variables.section_network, TL_Variables.key_server_name, TL_Default.server_name)
#		config.set_value(TL_Variables.section_network, TL_Variables.key_server_port, TL_Default.server_port)
#		config.save(TL_Path.launcher_settings)
	add_servers_to_dropdown()
	load_server_credentials(TL_Node.nw_popup.get_selected())
	var le_list = [TL_Node.server_name, TL_Node.address, TL_Node.port]
	TL_Node.nw_popup.default_check(TL_Node.nw_popup.selected, le_list, TL_Node.server_reset)


func _on_server_dropdown_item_selected(index):
	var config = ConfigFile.new()
	var load_response = config.load(TL_Path.launcher_settings)
	var server_list = config.get_value(section_nw, server)
	if config.has_section(section_nw) == true:
		config.set_value(section_nw, server_index, index)
		config.save(TL_Path.launcher_settings)
		TL_Node.server_name.text = server_list[index][key_server_name]
		TL_Node.address.text = server_list[index][key_address]
		TL_Node.port.text = str(server_list[index][key_port])
		var le_server_list = [TL_Node.server_name, TL_Node.address, TL_Node.port]
		TL_Node.nw_popup.default_check(index, le_server_list, TL_Node.server_reset)
	else:
		config.set_value(TL_Variables.section_network, TL_Variables.key_server, TL_Default.server_address)
		config.set_value(TL_Variables.section_network, TL_Variables.key_server_name, TL_Default.server_name)
		config.set_value(TL_Variables.section_network, TL_Variables.key_server_port, TL_Default.server_port)
		config.set_value(TL_Variables.section_network, TL_Variables.key_server_index, TL_Default.server_index)
		config.save(TL_Path.launcher_settings)


func _on_server_dropdown_add_item_pressed():
	var config = ConfigFile.new()
	var load_response = config.load(TL_Path.launcher_settings)
	if config.has_section(section_nw) == true:
		var server_list = config.get_value(section_nw, server)
		server_list.append({key_address: new_address, key_port: new_port, key_server_name: new_server_name})
		config.set_value(section_nw, server, server_list)
		config.save(TL_Path.launcher_settings)
		TL_Node.server_name.text = new_server_name
		TL_Node.address.text = new_address
		TL_Node.port.text = new_port


func _on_server_dropdown_remove_item_pressed(index):
	var config = ConfigFile.new()
	var load_response = config.load(TL_Path.launcher_settings)
	var server_list = config.get_value(section_nw, server)
	if server_list.size() > 1:
		server_list.remove(index)
		config.set_value(section_nw, server, server_list)
		config.save(TL_Path.launcher_settings)


func _on_svr2_dropdown_item_selected(index):
	check_server_index(index)
	load_server_credentials(index)
	
	TL_LineEdit.save_ini(TL_Node.address, TL_Path.address)
	TL_LineEdit.save_ini(TL_Node.port, TL_Path.port)


func _on_adr2_server_name_text_changed(new_text):
	write_to_ini(new_text, key_server_name)
#	nodes.server_dropdown.set_item_text(nodes.nw_popup.index_selected, nodes.server_name.text)
	TL_Node.nw_popup.set_item_text(TL_Node.nw_popup.get_selected(), new_text)


func _on_adr2_url_text_changed(new_text):
	write_to_ini(new_text, key_address)
	TL_LineEdit.save_ini(TL_Node.address, TL_Path.address)


func _on_adr2_port_text_changed(new_text):
	write_to_ini(new_text, key_port)
	TL_LineEdit.save_ini(TL_Node.port, TL_Path.port)


func _on_adr2_add_item_pressed():
	var config = ConfigFile.new()
	var load_response = config.load(TL_Path.launcher_settings)
	
	TL_Node.server_dropdown.add_item(server_name_new)
	
	var server_list = config.get_value(section_nw, server, null)
	var append_server = {key_server_name: '', key_address: '', key_port: ''}
	server_list.append(append_server)
	config.set_value(section_nw, server, server_list)
	config.save(TL_Path.launcher_settings)
	
	TL_Node.server_dropdown.selected = TL_Node.server_dropdown.get_item_count() - 1
	TL_Node.server_name.text = server_name_new
	write_to_ini(TL_Node.server_name.text, key_server_name)
	TL_Node.address.text = TL_Default.server_address
	write_to_ini(TL_Node.address.text, key_address)
	TL_Node.port.text = str(TL_Default.server_port)
	write_to_ini(TL_Node.port.text, key_port)
	
	check_server_index(TL_Node.server_dropdown.selected)
	TL_LineEdit.save_ini(TL_Node.address, TL_Path.address)
	TL_LineEdit.save_ini(TL_Node.port, TL_Path.port)


func _on_adr2_remove_item_pressed():
	var config = ConfigFile.new()
	var load_response = config.load(TL_Path.launcher_settings)
	
	var server_list = config.get_value(section_nw, server, null)
	server_list.remove(TL_Node.server_dropdown.selected)
	config.set_value(section_nw, server, server_list)
	config.save(TL_Path.launcher_settings)
	
	var dropdown_index = TL_Node.server_dropdown.selected
	TL_Node.server_dropdown.selected = TL_Node.server_dropdown.selected - 1
	TL_Node.server_dropdown.remove_item(dropdown_index)
	check_server_index(TL_Node.server_dropdown.selected)
	load_server_credentials(TL_Node.server_dropdown.selected)
	TL_LineEdit.save_ini(TL_Node.address, TL_Path.address)
	TL_LineEdit.save_ini(TL_Node.port, TL_Path.port)

#	-------------------------------------------------------

func add_servers_to_dropdown():
	var config = ConfigFile.new()
	var load_response = config.load(TL_Path.launcher_settings)
	
	var server_list = config.get_value("network", "server")
	for item in server_list:
		TL_Node.nw_popup.add_item(item["server_name"])
	TL_Node.nw_popup.select(config.get_value(section_nw, server_index, null))
#	TL_Node.nw_popup.get_items()[0].get_node("entry_removal").visible = false
	TL_Node.nw_popup.get_items()[0].find_node("entry_removal").visible = false
#	var index = 0
#	var configa = ConfigFile.new()
#	configa.load(TL_Path.launcher_settings)
#	var server_list = configa.get_value(section_nw, server)
#	for servers in server_list:
#		TL_Node.server_dropdown.add_item(servers[key_server_name], index)
#		server_dropdown.add_item(servers[0], index)
#		server_dropdown.set_item_text(index, servers['server_name'])
#		index += 1
#
#	var server_index = configa.get_value(section_nw, server_index, null)
#	TL_Node.server_dropdown.selected = server_index


func save_server_index():
	var config = ConfigFile.new()
	var load_response = config.load(TL_Path.launcher_settings)
	
	config.set_value(section_nw, server_index, TL_Node.server_dropdown.selected)
	config.save(TL_Path.launcher_settings)


func load_server_credentials(index):
	var config = ConfigFile.new()
	var load_response = config.load(TL_Path.launcher_settings)
	
	var server_selected_data = config.get_value(section_nw, server, null)
	TL_Node.server_name.text = server_selected_data[index][key_server_name]
	TL_Node.address.text = server_selected_data[index][key_address]
	TL_Node.port.text = str(server_selected_data[index][key_port])
	
	var server_index = config.get_value("network", "server_index")
	TL_Node.nw_popup.select(int(server_index))


func write_to_ini(new_text, key):
	var config = ConfigFile.new()
	var load_response = config.load(TL_Path.launcher_settings)
	
	var server_list = config.get_value(section_nw, server, null)
	server_list[TL_Node.nw_popup.get_selected()][key] = new_text
	config.set_value(section_nw, server, server_list)
	config.save(TL_Path.launcher_settings)


func check_server_index(index):
	if str(index) == '0':
		TL_Node.address.editable = false
		TL_Node.address.text = TL_Default.server_address
		TL_Node.port.editable = false
		TL_Node.port.text = TL_Default.server_port
		TL_Node.server_remove_item.disabled = true
		TL_Node.server_name.editable = false
	else:
		TL_Node.address.editable = true
		TL_Node.port.editable = true
		TL_Node.server_remove_item.disabled = false
		TL_Node.server_name.editable = true
	save_server_index()


func on_server_reset_pressed():
#	nodes.server_dropdown.selected = 0
	TL_Node.nw_popup.select(0)
	load_server_credentials(0)
	TL_LineEdit.save_ini(TL_Node.address, TL_Path.address)
	TL_LineEdit.save_ini(TL_Node.port, TL_Path.port)


func check_for_ini_cache_match():
	var config = ConfigFile.new()
	var load_response = config.load(TL_Path.launcher_settings)
	
	var file = File.new() #new file class on which you will call file class methods
	file.open(TL_Path.address, File.READ)  #the file is now opened in the background
	var address_value = file.get_as_text()
	file.open(TL_Path.port, File.READ)  #the file is now opened in the background
	var port_value = file.get_as_text()
	file.close()
	
	var my_index = 0
	var has_match = false
	var server_list = config.get_value(section_nw, server, null)
	
	for server in server_list:
		if server[key_address] == address_value and server[key_port] == port_value:
			TL_Node.server_dropdown.selected = my_index
			TL_Node.server_name.text = server.server_name
			TL_Node.address.text = address_value
			TL_Node.port.text = port_value
			has_match = true
			check_server_index(TL_Node.server_dropdown.selected)
			break
		my_index += 1
	if has_match == false:
		TL_Node.server_dropdown.add_item(server_name_new)
		
		var append_server = {key_server_name: server_name_new, key_address: address_value, key_port: port_value}
		server_list.append(append_server)
		config.set_value(section_nw, server, server_list)
		config.save(TL_Path.launcher_settings)
		
		TL_Node.server_dropdown.selected = TL_Node.server_dropdown.get_item_count() - 1
		TL_Node.server_name.text = server_name_new
#		write_to_ini(server_name.text, 0)
		TL_Node.address.text = address_value
#		write_to_ini(address_value, 1)
		TL_Node.port.text = port_value
#		write_to_ini(port_value, 2)
		check_server_index(TL_Node.server_dropdown.selected)


func _on_svr2_dropdown_pressed():
	TL_Node.server_dropdown.get_popup().set_position(Vector2(TL_Node.server_name.get_global_position().x, TL_Node.server_name.get_global_position().y + TL_Node.address.rect_size.y))
	TL_Node.server_dropdown.get_popup().rect_size.x = TL_Node.address.rect_size.x - 40


func _on_svr_button_pressed():
	TL_Node.server_dropdown.mouse_filter = 2
	if TL_Node.server_name.get_global_position().y < 300:
		TL_Node.nw_popup.set_position(Vector2(TL_Node.server_name.get_global_position().x, 
				TL_Node.server_name.get_global_position().y + TL_Node.server_name.rect_size.y + 4))
	else:
		TL_Node.nw_popup.set_position(Vector2(TL_Node.server_name.get_global_position().x, 
				TL_Node.server_name.get_global_position().y - TL_Node.nw_popup.rect_size.y - 4))
	TL_Node.nw_popup.rect_size.x = (TL_Node.server_name.rect_size.x + TL_Node.server_dropdown.rect_size.x + 4)
	TL_Node.nw_popup.rect_size.y = 0
	TL_Node.nw_popup.popup()


func _on_nw_popup_becomes_hidden():
	TL_Node.server_timer.start()


func _on_svr_timer_timeout():
	TL_Node.server_dropdown.mouse_filter = 0
