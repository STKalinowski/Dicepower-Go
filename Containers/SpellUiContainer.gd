extends Node2D

var currentUnit
onready var holdDie = $HoldDie
onready var holdSpells = $HoldSpells
var lastDieVal = null

const DIEPOS =  Vector2(57,22)
const SPELLPOS = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func drop(die):
	if die.objType != 'die': #or currentUnit.getTeam() != die.getTeam() or not(currentUnit.getTeam().isTurn()):
		return false
	if die.get_parent():
		die.get_parent().remove_child(die)
	if holdDie.get_children():
		#Bellow is a bit messy, but its just we insert the die back to its teams dice holder
		returnDie(holdDie.get_children()[0])
	holdDie.add_child(die)
	die.position = DIEPOS
	return true

func reposition(newUnit):
	if currentUnit == newUnit:
		return
	if holdDie.get_children():
		returnDie(holdDie.get_children()[0])
	currentUnit = newUnit
	self.position = newUnit.global_position
	self.setSpells(currentUnit.stats.unitSpells)

func setSpells(spellList):
	#for i in spellList:
	pass	
func clearSpells():
	pass
func returnDie(die):
	die.currentTeam.diceUi.insertDie(die)

#Seperating out the processing of input die our of drop, so we allow drop to finish and spell cast happens after
func _process(delta):
	if holdDie.get_children():
		var childDie = holdDie.get_children()[0]
		if not(childDie.currentVal in ['dice1', 'dice2', 'dice3', 'dice4', 'dice5', 'dice6']):
			pass

func hideUi():
	if holdDie.get_children():
		returnDie(holdDie.get_children()[0])
	currentUnit = null
	self.position = Vector2(1000,1000)

