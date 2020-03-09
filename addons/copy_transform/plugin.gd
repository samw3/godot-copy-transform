tool
extends EditorPlugin

var copied_transform:Transform = Transform.IDENTITY

func _enter_tree():
	add_tool_menu_item("Copy Transform", self, "copy_transform")
	add_tool_menu_item("Paste Transform", self, "paste_transform")


func _exit_tree():
	remove_tool_menu_item("Copy Transform")
	remove_tool_menu_item("Paste Transform")

func copy_transform(thing):
	var nodes = get_editor_interface().get_selection().get_selected_nodes()
	if nodes.size() == 0: _show_message("Select a Spatial and try again.")
	elif nodes.size() > 1: _show_message("Too many nodes selected, only select one to copy.")
	else:
		var node = nodes[0]
		if !node is Spatial: _show_message("Selection must be a Spatial.")
		else:
			var sp = node as Spatial
			copied_transform = sp.transform
			print("Copied transform: ", copied_transform)

func paste_transform(thing):
	var nodes = get_editor_interface().get_selection().get_selected_nodes()
	if nodes.size() == 0: _show_message("Select a Spatial and try again.")
	else:
		for node in nodes:
			if node is Spatial:
				var sp = node as Spatial
				sp.transform = copied_transform
				print("Pasted transform: ", copied_transform)

func _show_message(message):
	var dialog = AcceptDialog.new()
	dialog.dialog_text = message
	add_child(dialog)
	dialog.popup_centered()
