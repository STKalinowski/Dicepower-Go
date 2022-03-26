extends Node2D

onready var palette = $Palette
onready var spellUi = $SpellUiContainer
onready var holdTeams = $HoldTeams
onready var playControl = $Cursor
onready var que = []

# Called when the node enters the scene tree for the first time.
func _ready():
	palette.setPalette('test')
	#Control Setup
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	playControl.spellUi = spellUi
	spellUi.hideUi()
	#Team Setup
	var playerTeam = team.new()
	holdTeams.add_child(playerTeam)
	var enemyTeam = team.new()
	holdTeams.add_child(enemyTeam)
	playerTeam.diceUi.global_position = Vector2(-100, 175)
	enemyTeam.diceUi.global_position = Vector2(-100, -250)
	playControl.assignedTeam = playerTeam
	playerTeam.turnStatus = true

	playerTeam.spellUi = spellUi
	enemyTeam.spellUi = spellUi
	
	#Die
	var dieInst
	for i in range(5):
		dieInst = load("res://Items/Die.tscn").instance()
		dieInst.setFaces(['dice5', 'dice6', 'dice4', 'dice1', 'shield'])
		dieInst.currentTeam = playerTeam
		playerTeam.diceUi.insertDie(dieInst)
	playerTeam.diceUi.rollDice()
	
	for i in range(5):
		dieInst = load("res://Items/Die.tscn").instance()
		dieInst.setFaces(['dice5', 'dice6', 'dice4', 'dice1', 'dice2'])
		dieInst.currentTeam = enemyTeam
		enemyTeam.diceUi.insertDie(dieInst)
	pass 

	#Units
	var unitInst
	var inputStats
	var chars = ['wizard', 'spearman', 'knight', 'priestess']
	for i in range(4):
		unitInst = load("res://Containers/Unit.tscn").instance()
		inputStats = unitStats.new(chars[i], 5, 15, 1, ['Fireball', 'Electric Shock', 'Ice Barrier'])
		unitInst.setStats(inputStats)
		playerTeam.units.add_child(unitInst)
		unitInst.currentTeam = playerTeam
		
	playerTeam.positionUnits(Vector2(-300,20))
	
	chars = ['duck', 'skeleton', 'bandit', 'goblin']
	for i in range(4):
		unitInst = load("res://Containers/Unit.tscn").instance()
		inputStats = unitStats.new(chars[i], 0, 5*(i+1), 1, ['Fireball', 'Electric Shock', 'Ice Barrier'])
		unitInst.setStats(inputStats)
		enemyTeam.units.add_child(unitInst)
		unitInst.currentTeam = enemyTeam
	enemyTeam.positionUnits(Vector2(-300, -150))

func fightLoop():
	while true:
		var currentTurn = holdTeams.get_child(0)
		#For doAction, will trigger AI !
		var res = yield(currentTurn.doAction(), "Action Done")
		holdTeams.move_child(currentTurn, len(holdTeams.get_children)-1)
		if self.endComabt():
			break

func endComabt():
	return true
