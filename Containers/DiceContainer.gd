extends Node2D

onready var holdDice = $HoldDice

var startPos = Vector2(40,30)
var containerLimit = 5
var spotSize = 32
var margin = 5
var curChildCount = 0

func insertDie(die):
	if die.get_parent():
		die.get_parent().remove_child(die)
	elif len(holdDice.get_children()) >= containerLimit or die.objType != 'die' or die.getTeam() != self.getTeam():
		return false
	var currentChildren = holdDice.get_children()
	var diePos = die.global_position
	var insertPos = len(currentChildren)
	for i in len(currentChildren):
		if currentChildren[i].position[0] > diePos[0]:
			insertPos = i
			break
	holdDice.add_child(die)
	holdDice.move_child(die, insertPos)
	positionDice()
	return true

func removeDie(die):
	holdDice.remove_child(die)

func drop(die):
	insertDie(die)
	return true

func positionDice():
	var curPos = self.global_position + startPos
	for i in holdDice.get_children():
		i.global_position = curPos
		curPos = curPos + Vector2(spotSize+margin,0)

func rollDice():
	for i in holdDice.get_children():
		i.roll()

func rollDie(die):
	holdDice.get_child(die).roll()
	
func getTeam():
	return self.get_parent()

func _process(_delta):
	#BandAid to fix romval of children, we update position
	if curChildCount != len(holdDice.get_children()):
		curChildCount = len(holdDice.get_children())
		positionDice()
