extends Button

signal button_store_click(btnStore)

func button_pressed():
	emit_signal("button_store_click", self)
