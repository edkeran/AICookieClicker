extends Node2D

signal add_auto_click(cant_autoclicks)
signal change_auto_click_rate(rate_click)

var heightStoreItem = 50

func _ready():
	load_store_items()

func load_store_items():
	for itemStore in STOREITEMS.listStoreItems:
		if(itemStore[3]):
			var buttonCurrent = Button.new()
			buttonCurrent.icon = ResourceLoader.load(itemStore[0])
			buttonCurrent.expand_icon = true
			buttonCurrent.icon_alignment = HORIZONTAL_ALIGNMENT_LEFT
			buttonCurrent.text = itemStore[1]
			buttonCurrent.set_meta("indexPowerUP", STOREITEMS.listStoreItems.find(itemStore))
			buttonCurrent.theme = load("res://theme_cookie/inventory_button.tres")
			var scriptPath = "res://Game/button_store.gd"
			buttonCurrent.set_script(load(scriptPath))
			buttonCurrent.custom_minimum_size = Vector2(0,heightStoreItem)
			buttonCurrent.connect("pressed", Callable(buttonCurrent, "button_pressed"))
			buttonCurrent.connect("button_store_click", Callable(self, "handle_buy_power_up"))
			create_hbox_container(buttonCurrent, itemStore[2])
			$MarginContainer/VContainerStorePowerUp.add_child(buttonCurrent)

func clear_store_items():
	for btn in $MarginContainer/VContainerStorePowerUp.get_children():
		btn.queue_free()

func create_hbox_container(buttonItm : Button, cost : int):
	var containerForButton : HBoxContainer = HBoxContainer.new()
	containerForButton.layout_direction = Control.LAYOUT_DIRECTION_RTL
	var labelCost = Label.new()
	labelCost.text = str(cost) + " COOKIES "
	containerForButton.size.x = buttonItm.size.x
	containerForButton.size.y += heightStoreItem
	buttonItm.add_child(containerForButton) 
	containerForButton.add_child(labelCost)

func handle_buy_power_up(buttonClicked : Button):
	var indexBtn : int = int(buttonClicked.get_meta("indexPowerUP"))
	var buttonInfo = STOREITEMS.listStoreItems[indexBtn]
	if(SCORE.currentScore >= buttonInfo[2]):
		match buttonInfo[5]:
			STOREITEMS.ADD_AUTOCLICK:
				handle_autoclick_added(buttonInfo)
			STOREITEMS.ALL_CLICK:
				handle_autoclick_change_rate(buttonInfo)

func handle_autoclick_added(buttonInfo):
	SCORE.currentScore-= buttonInfo[2]
	buttonInfo[3] = false
	emit_signal("add_auto_click",  buttonInfo[4])
	clear_store_items()
	load_store_items()
	add_ui_powerUp_clicked_sound()

func handle_autoclick_change_rate(buttonInfo):
	SCORE.currentScore-= buttonInfo[2]
	buttonInfo[3] = false
	emit_signal("change_auto_click_rate",  buttonInfo[4])
	clear_store_items()
	load_store_items()
	add_ui_powerUp_clicked_sound()

func add_ui_powerUp_clicked_sound():
	var soundInstance = AudioStreamPlayer.new()
	soundInstance.stream = load("res://sound/FX/ItemConfirmed.ogg")
	add_child(soundInstance)
	soundInstance.play()
