extends Node2D
const PALETTE = {
	"ceaser":{
		"cursor":Vector3(255,255,255),
		"main":Vector3(28,159,255),
		"fade":Vector3(105,191, 255),
		"back":Vector3(182,196, 46),
		"contrast":Vector3(240,243, 203),
	},
	'test':{
		"cursor":Vector3(255,255,255),
		"main":Vector3(255, 159,28),
		"fade":Vector3(182,196, 46),
		"back":Vector3(105,191, 255),
		"contrast":Vector3(240,243, 203),
	}
}


func getPalette(itemName):
	if itemName in PALETTE:
		return PALETTE[itemName]
	else:
		return PALETTE[itemName]
	pass
