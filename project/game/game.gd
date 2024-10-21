extends Control


@export var _rebeccas: Array[CharacterBase]
@onready var _portrait_grid = %PortraitGridContainer

func set_text(text):
	$Label.text = text


func _choose_random_characters(character: String):
	var picked_characters: Array[CharacterBase]
	var pool_of_characters: Array[CharacterBase]

	if character == "Rebecca":
		pool_of_characters = _rebeccas
	if character == "Jared":
		pool_of_characters = _rebeccas

	pool_of_characters.shuffle()
	
	for n in range(_portrait_grid.get_children().size()):
		picked_characters.append(_rebeccas[n])
	
	_create_portraits(picked_characters)


func _create_portraits(array_of_characters):
	var counter = 0
	print(array_of_characters)
	for child in _portrait_grid.get_children():
		child.texture = array_of_characters[counter].get_portrait()
		counter += 1
	counter = 0
