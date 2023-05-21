extends Node

"""
	Declare the global variables of the singleton those are for the types 
	available in the powerUps
"""
var ADD_AUTOCLICK = "ADD_AUTOCLICK"
var ALL_CLICK = "ALL_CLICK"

"""
	Declare the list of items that will belong to the store
	The first element is the texture icon for the powerUP
	The second element is the name of the powerUP
	The third element is the cost of the item
	The forth is the availability in the store for the item
	The fifth element is the Quantity of items included in the powerUP 
	The last element is the type of powerUp if is an autoclick or more clicks in the powerUP
"""
var listStoreItems : Array = [
		["res://textures/storeItemsIcons/pointer.png", "+2 Autoclick", 20, true, 2, ADD_AUTOCLICK],
		["res://textures/storeItemsIcons/pointer.png", "+3 Autoclick", 200, true, 3, ADD_AUTOCLICK], 
		["res://textures/storeItemsIcons/pointer.png", "+5 Autoclick", 500, true, 5, ADD_AUTOCLICK], 
		["res://textures/storeItemsIcons/pointer.png", "+6 Autoclick", 700, true, 6, ADD_AUTOCLICK], 
		["res://textures/storeItemsIcons/pointer.png", "+10 Autoclick", 1500, true, 10, ADD_AUTOCLICK], 
		["res://textures/storeItemsIcons/pointer.png", "+20 Autoclick", 3500, true, 20, ADD_AUTOCLICK],
		["res://textures/storeItemsIcons/pointerStoreRate.jpg", "X2 Clicks Por Segundo",4500, true,  2, ALL_CLICK],
		["res://textures/storeItemsIcons/pointer.png", "+60 Autoclick", 8500, true, 60, ADD_AUTOCLICK],
		["res://textures/storeItemsIcons/pointer.png", "+100 Autoclick", 12000, true, 100, ADD_AUTOCLICK],
		["res://textures/storeItemsIcons/pointer.png", "+150 Autoclick", 15000, true, 150, ADD_AUTOCLICK],
		["res://textures/storeItemsIcons/pointer.png", "+300 Autoclick", 30000, true, 300, ADD_AUTOCLICK],
		["res://textures/storeItemsIcons/pointerStoreRate.jpg", "X3 Clicks Por Segundo",100000, true, 3, ALL_CLICK],
		["res://textures/storeItemsIcons/cookieArtist.jpg", "+1 Artesanos de las galletas (+600)", 110000, true, 600, ADD_AUTOCLICK],
		["res://textures/storeItemsIcons/cookieLab.jpg", "+1 Laboratorio de galletas (+1000)", 115000, true, 600, ADD_AUTOCLICK],
	]
