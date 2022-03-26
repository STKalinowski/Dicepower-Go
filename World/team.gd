extends Node2D
class_name team

var units
var diceUi
var turnStatus = false
var spellUi
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init():
	self.diceUi = load('res://Containers/DiceContainer.tscn').instance()
	self.units = Node2D.new()
	self.add_child(diceUi)
	self.add_child(units)
	
func getContainers():
	return [diceUi] + self.units.get_children()

func isTurn():
	return turnStatus

func getSpellUi(unit, die:Node2D = null):
	spellUi.reposition(unit)
	if die != null:
		return spellUi.drop(die)
	return true
	
func positionUnits(startPos):
	var curPos = startPos
	for i in units.get_children():
		i.position = curPos
		curPos = curPos + Vector2(164,0)
		
		
