extends Node2D


var faceSet
var currentVal
var currentTeam
onready var itemBox = $itemBox
onready var faceSprite = $Face
var used = false
var objType = 'die'

# Called when the node enters the scene tree for the first time.
func _ready():
	faceSprite.set_texture(load(IconDb.getItem(currentVal)['img']))
	faceSprite.region_rect = IconDb.getItem(currentVal)['region_rect']
	pass # Replace with function body.

func roll():
	var randNum = randi() % len(faceSet)
	currentVal = faceSet[randNum]
	faceSprite.set_texture(load(IconDb.getItem(currentVal)['img']))
	faceSprite.region_rect = IconDb.getItem(currentVal)['region_rect']

func setFaces(inFaces):
	#Reset dice for the new faces!
	faceSet = inFaces
	currentVal = faceSet[0]

func setTeam(inputTeam):
	currentTeam = inputTeam
func getTeam():
	return currentTeam

func get_global_rect():
	return itemBox.get_global_rect()

func grab(assignedTeam):
	if currentTeam == assignedTeam:
		return self
	else:
		return null
