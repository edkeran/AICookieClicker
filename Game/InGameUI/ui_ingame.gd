extends Control


signal unable_cookie
signal able_cookie
signal unable_cookie_gallery

var current_mode

func _on_store_pressed():
	emit_signal("unable_cookie")
	add_ui_button_clicked_sound()

func _on_return_game_pressed():
	if(current_mode != null):
		current_mode.queue_free()
	add_ui_button_clicked_sound()
	emit_signal("able_cookie")

func add_ui_button_clicked_sound():
	var soundInstance = AudioStreamPlayer.new()
	soundInstance.stream = load("res://sound/FX/UIGameSelected.ogg")
	add_child(soundInstance)
	soundInstance.play()

func _on_gallery_pressed():
	emit_signal("unable_cookie_gallery")
	add_ui_button_clicked_sound()

