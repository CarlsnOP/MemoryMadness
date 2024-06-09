#@tool
extends Node

@export var ir: ImageFilesList

func _ready():
	if Engine.is_editor_hint() == true:
		var path = "res://assets/glitch"
		var dir = DirAccess.open(path)
		
		if not dir:
			return
		
		ir.file_names.clear()
		
		var file_names = dir.get_files()
		
		for fn in file_names:
			if ".import" not in fn:
				ir.file_names.append(path + "/" + fn)
		
		ResourceSaver.save(ir)

