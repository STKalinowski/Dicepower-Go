extends Node2D


onready var unitSprite = $UnitSprite
onready var unitUi = $UnitUi
onready var panel = $Panel
var stats
var objType = 'unit'
var currentTeam

func _ready():
	unitSprite.set_texture(load(IconDb.getItem(self.stats.unitType)["img"]))
	unitSprite.region_rect = IconDb.getItem(self.stats.unitType)["region_rect"]
	unitUi.updateStats(self.stats)
	pass

func get_global_rect():
	return panel.get_global_rect()
	
func updateStats():
	pass
	
func setStats(newStats):
	self.stats = newStats
	#self.unitUi.updateStats()

func getSpellUi(die:Node2D = null):
	if die == null:
		return currentTeam.getSpellUi(self)
	else:
		if die.currentTeam == currentTeam:
			return currentTeam.getSpellUi(self, die)
		else:
			return false

func grab(assignedTeam):
	getSpellUi()
	return null

func drop(item):
	if item.objType == 'target':
		#We are targeted for something, input self into target and let it manage
		return item.drop(self)
	elif item.objType == 'die':
		#Get the spell ui here and put the die into that!
		return getSpellUi(item)
	else:
		#Base Case, we do not know what to do with item and we drop it???
		return false
