extends Node

var currentScore = 0
var currentAddingScore = 1
var autoClicks = 0

func addScore():
	currentScore+=currentAddingScore

func addAutoClickScore():
	currentScore+= autoClicks * currentAddingScore

func cookies_per_seccond():
	return format_score_output(autoClicks * currentAddingScore)

func format_score_output(score):
	if(score > 999 and score < 1000000):
		return str(int(score / 1000)) + "." + validateIsUnity(float(score)/1000 - (score / 1000)).substr(0,2) + " K"
	if(score > 999999):
		return str(int(score / 1000000)) + "." + validateIsUnity(float(score)/1000000 - (score / 1000000)).substr(0,2) + " M"
	return str(score)

func validateIsUnity(result):
	if(result < 0.1):
		return "0"
	if(result >= 0.1 and result < 1):
		return str(result).substr(2,1)
	else:
		return str(result)
