extends Node


''' EXECUTE STRING AS CODE '''
func exec(input: String):
	var script = GDScript.new()
	script.set_source_code("func eval():\n\treturn " + input)
	script.reload()
	var obj = Reference.new()
	obj.set_script(script)
	return obj.eval()


''' FLIP BOOLEAN STATE '''
func flip(boolean: bool):
	if boolean == true:
		boolean = false
	else:
		boolean = true


''' CLOSE LAUNCHER '''
func close_launcher():
	get_tree().quit()


func finding_nodes(node_name: String):
	return get_tree().get_root().find_node(node_name, true, false)
