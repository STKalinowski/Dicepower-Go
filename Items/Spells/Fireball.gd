extends Node2D

onready var utilFuncs = $UtilNode

var effectChart = [1,2,3,4,5,6]
var teams
var actor
var inputDie
var target

var spellName
var spellDescription

func needTarget():
	return true

#Fireball targets only enemies:
func isTargetValid(inTarget):
	return utilFuncs.isEnemyTeam(actor, inTarget)

#Run through the spell
func cast():
	#Damage the target
	var dmg = utilFuncs.getEffectFromChart(effectChart, inputDie)
	target.takeDmg(dmg) 
	#
