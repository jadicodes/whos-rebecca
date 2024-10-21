extends Control


@export var _rebeccas: Array[CharacterBase]

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
	for i in 3:
		picked_characters.append(_rebeccas[i])	
		_create_portraits(picked_characters)


func _create_portraits(array_of_characters):
	pass
