extends Node2D

var heightStoreItem = 50
var currentImageIterator = 0

func _ready():
	#Load the items list in the vbox container
	var itemsGallery = GALLERYSTORE.listGalleryItems
	for imgGallery in itemsGallery:
		var buttonCurrent = Button.new()
		buttonCurrent.icon = ResourceLoader.load(imgGallery[0])
		buttonCurrent.expand_icon = true
		buttonCurrent.icon_alignment = HORIZONTAL_ALIGNMENT_LEFT
		buttonCurrent.text = imgGallery[1]
		buttonCurrent.set_meta("indexGalleryItem", GALLERYSTORE.listGalleryItems.find(imgGallery))
		buttonCurrent.theme = load("res://theme_cookie/inventory_button.tres")
		var scriptPath = "res://Game/button_store.gd"
		buttonCurrent.set_script(load(scriptPath))
		buttonCurrent.custom_minimum_size = Vector2(0,heightStoreItem)
		#buttonCurrent.connect("pressed", Callable(buttonCurrent, "button_pressed"))
		#buttonCurrent.connect("button_store_click", Callable(self, "handle_buy_power_up"))
		create_hbox_container(buttonCurrent, imgGallery[2], imgGallery[3])
		$StoreItemsContainer/ScrollContainer/MarginContainer/VBoxContainer.add_child(buttonCurrent)
	$StoreItemsContainer/ScrollContainer/MarginContainer/VBoxContainer.add_child(button_see_all_gallery())
	$GalleryImagesContainer.visible = false

func create_hbox_container(buttonItm : Button, cost : int, isBought : bool):
	var containerForButton : HBoxContainer = HBoxContainer.new()
	containerForButton.layout_direction = Control.LAYOUT_DIRECTION_RTL
	var labelCost = Label.new()
	if(not isBought):
		labelCost.text =  SCORE.format_score_output(cost) + " COOKIES "
	else:
		labelCost.text = "Ver";
	containerForButton.size.x = buttonItm.size.x
	containerForButton.size.y += heightStoreItem
	buttonItm.add_child(containerForButton) 
	containerForButton.add_child(labelCost)

func button_see_all_gallery():
	var btnSeeAll = Button.new()
	btnSeeAll.icon = ResourceLoader.load("res://textures/Gallery/GalleryIcon.jpg")
	btnSeeAll.expand_icon = true
	btnSeeAll.icon_alignment = HORIZONTAL_ALIGNMENT_LEFT
	btnSeeAll.theme = load("res://theme_cookie/inventory_button.tres")
	btnSeeAll.custom_minimum_size = Vector2(0,heightStoreItem)
	btnSeeAll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	btnSeeAll.icon_alignment = HORIZONTAL_ALIGNMENT_CENTER
	btnSeeAll.connect("pressed", set_gallery_visible)
	return btnSeeAll

func set_gallery_visible():
	$StoreItemsContainer.visible = false
	$GalleryImagesContainer.visible = true
	
func close_gallery():
	$StoreItemsContainer.visible = true
	$GalleryImagesContainer.visible = false

func _on_next_pressed():
	currentImageIterator+=1
	if(currentImageIterator >= GALLERYSTORE.listGalleryItems.size()):
		currentImageIterator = 0
	update_picture()

func _on_prev_pressed():
	currentImageIterator-=1
	if(currentImageIterator < 0):
		currentImageIterator = GALLERYSTORE.listGalleryItems.size() - 1
	update_picture()

func update_picture():
	$GalleryImagesContainer/HBoxContainer/currentPicture.texture = load(GALLERYSTORE.listGalleryItems[currentImageIterator][0])
