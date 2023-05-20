extends Node

var currentScore = 0
var currentAddingScore = 1
var autoClicks = 0

func addScore():
	currentScore+=currentAddingScore

func addAutoClickScore():
	currentScore+= autoClicks * currentAddingScore

func cookies_per_seccond():
	return str(autoClicks * currentAddingScore)
