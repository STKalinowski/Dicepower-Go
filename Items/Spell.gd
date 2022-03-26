extends Node2D

onready var Icon = $Visual/Icon
onready var spellLabel = $Visual/Label

var spell = null

# Called when the node enters the scene tree for the first time.
func _ready():
	spellLabel.text = spell
	pass # Replace with function body.

func init(spellName):
	spell = load(IconDb.SPELLPATH+spellName+'.tscn').instance()
	pass

func grab():
	print("Spell Grabed")
	return null
