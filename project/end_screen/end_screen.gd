extends Control

signal yes_button_pressed
signal no_button_pressed


func start():
	$ScoreLabel.visible_ratio = 0
	$QuestionLabel.visible_ratio = 0
	$YesButton.hide()
	$NoButton.hide()
	$Dialog1.play("talk1")


func _on_yes_button_pressed() -> void:
	emit_signal("yes_button_pressed")


func _on_no_button_pressed() -> void:
	emit_signal("no_button_pressed")


func set_score(score):
	$ScoreLabel.text = "Wow! You got through " + str(score) + " Rebecca stories!"


func _on_dialog_1_animation_finished(anim_name: StringName) -> void:
	if anim_name == "talk1":
		$Dialog2.play("talk2")


func _on_dialog_2_animation_finished(anim_name: StringName) -> void:
	if anim_name == "talk2":
		$YesButton.show()
		$NoButton.show()
