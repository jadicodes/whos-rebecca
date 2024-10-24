extends Control

signal answer_locked_in

@export var _rebeccas: Array[CharacterBase]
@onready var _portrait_grid = %PortraitGridContainer


func _choose_random_characters(character: String):
	var picked_characters: Array[CharacterBase]
	var pool_of_characters = _rebeccas

	pool_of_characters.shuffle()
	
	for n in range(_portrait_grid.get_children().size()):
		picked_characters.append(_rebeccas[n])
	
	_create_portraits(picked_characters)
	var correct_rebecca = picked_characters.pick_random()
	_set_traits(correct_rebecca)


func _create_portraits(array_of_characters):
	var counter = 0
	for child in _portrait_grid.get_children():
		child.texture = array_of_characters[counter].get_portrait()
		counter += 1
	counter = 0


func _set_traits(rebecca):
	rebecca.traits.shuffle()
	print(rebecca.traits[0], rebecca.traits[1], rebecca.traits[2])
	$Textbox.set_traits(rebecca.traits[0], rebecca.traits[1], rebecca.traits[2])


func _on_lock_in_button_pressed() -> void:
	emit_signal("answer_locked_in")
