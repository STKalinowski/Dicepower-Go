extends Node2D
class_name unitStats

export(String) var unitType
export(Array)var unitSpells = []

var currentHp
export(int) var totalHp
var currentEnergy
export(int) var totalEnergy
export(int) var startArmour 
var currentArmour


func _init(inUnitType="None", inStartArmour=0, inTotalHp=0, inTotalEnergy=0, initUnitSpells=[]):
	self.unitType = inUnitType
	self.startArmour = inStartArmour
	self.totalEnergy = inTotalEnergy
	self.totalHp = inTotalHp
	self.unitSpells = initUnitSpells
	
	self.currentArmour = self.startArmour
	self.currentHp = self.totalHp
	self.currentEnergy = self.totalEnergy
