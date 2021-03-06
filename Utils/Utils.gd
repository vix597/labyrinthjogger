extends Node


func instance_scene_on_main(packed_scene, position=Vector2.ZERO):
	"""
	Helper method that takes a packed scene, creates an instance
	of it, then adds it as a child to the current scene, sets the
	global position and returns the instance.
	
	:param packed_scene: A packed scene usually loaded with preload()
	:param position: Vector2 to set as the new instance's global_position
	:returns: The newly created instance
	"""
	var main = get_tree().current_scene
	var instance = packed_scene.instance()
	instance.global_position = position
	main.add_child(instance)
	return instance


func get_main_instances():
	return ResourceLoader.load("res://Utils/MainInstances.tres")


func get_current_level():
	var MainInstances = get_main_instances()
	return MainInstances.current_level


func say_dialog(message):
	var MainInstances = get_main_instances()
	var dialog = MainInstances.dialog
	if dialog != null:
		dialog.say(message)


func ask_dialog(question, default=false):
	var MainInstances = get_main_instances()
	var dialog = MainInstances.dialog
	if dialog != null:
		dialog.ask(question, default)


func shop_dialog(message):
	var MainInstances = get_main_instances()
	var dialog = MainInstances.dialog
	if dialog != null:
		dialog.shop(message)
