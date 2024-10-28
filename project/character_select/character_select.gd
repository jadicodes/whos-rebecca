extends Control

signal rebecca_selected


func start():
	$Label.visible_ratio = 0
	$Label2.visible_ratio = 0
	$Button.hide()
	$Dialog1.play("text1")
	$TalkingJadi.play("talking")


func _on_dialog_1_animation_finished(anim_name: StringName) -> void:
	if anim_name == "text1":
		$Dialog2.play("text2")


func _on_dialog_2_animation_finished(anim_name: StringName) -> void:
	if anim_name == "text2":
		$Button.show()
		$TalkingJadi.play("default")


func _on_button_pressed() -> void:
	emit_signal("rebecca_selected")
