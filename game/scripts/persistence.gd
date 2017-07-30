extends Node

const SAVE = "user://save.json"

var data = {}

func _ready():
	load_data()
	
	
func save_data():
	var save_data = {}
	var savenodes = get_tree().get_nodes_in_group("persist")
	for i in savenodes:
		save_data[i.get_path()] = i.save()
	var save_file = File.new()
	save_file.open(SAVE, File.WRITE)
	save_file.store_line(save_data.to_json())
	save_file.close()
	print("saved! new top score: ", global.get_top_score())
	
	
func load_data():
	var save_file = File.new()
	if !save_file.file_exists(SAVE):
		print("no save file")
		return
	save_file.open(SAVE, File.READ)
	var data_load = {}
	data_load.parse_json(save_file.get_as_text())
	for node_path in data_load.keys():
		var node = get_node(node_path)
		for attr in data_load[node_path]:
			if attr == "top_score":
				global.top_score = data_load[node_path]["top_score"]