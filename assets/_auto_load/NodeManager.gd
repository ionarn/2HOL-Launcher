extends Node

var _nodes := {}


func get(node_name: String):
	return get_tree().get_root().find_node(node_name, true, false)


func register_node(node_name: String, node_ref: Node) -> void:
	if _nodes.has(node_name):
		printerr("Node '%s' is already registered" % [ node_name ])
		return
	
	_nodes[node_name] = node_ref


func get_registered_node(node_name: String) -> Node:
	if not _nodes.has(node_name):
		return null
	
	return _nodes[node_name]
