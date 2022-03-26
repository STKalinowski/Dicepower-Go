extends Node2D

###Hold Util Functions for spells
func isEnemyTeam(actor, target):
	if actor.currentTeam != target.currentTeam:
		return true
	else:
		return false

func getEffectFromChart(effectChart, inputDie):
	if inputDie.currentVal == 'dice1':
		return effectChart[0]
	elif inputDie.currentVal == 'dice2':
		return effectChart[1]
	elif inputDie.currentVal == 'dice3':
		return effectChart[2]
	elif inputDie.currentVal == 'dice4':
		return effectChart[3]
	elif inputDie.currentVal == 'dice5':
		return effectChart[4]
	elif inputDie.currentVal == 'dice6':
		return effectChart[5]
	#Base Case
	else:
		return null
