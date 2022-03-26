extends VBoxContainer

onready var CurrentHp = $UnitHealth/CurrentHp
onready var TotalHp = $UnitHealth/TotalHp

onready var CurrentArmour = $UnitArmour/CurrentArmour

onready var CurrentEnergy = $UnitEnergy/CurrentEnergy
onready var TotalEnergy = $UnitEnergy/TotalEnergy

func _ready():
	pass # Replace with function body.


func updateStats(inSt):
	CurrentHp.text = String(inSt.currentHp)
	TotalHp.text = String(inSt.totalHp)
	CurrentArmour.text = String(inSt.currentArmour)
	CurrentEnergy.text = String(inSt.currentEnergy)
	TotalEnergy.text = String(inSt.totalEnergy)
	
