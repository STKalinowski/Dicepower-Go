extends Node2D


onready var main = $Main.material
onready var sub = $Sub.material
onready var cursor = $Cursor.material
onready var contrast = $Contrast.material
onready var back = $Back.material
var currentPalette

func setPalette(palName):
	var pal = PaletteDb.getPalette(palName)
	var objs = [main, sub, cursor, contrast, back]
	var objNames = ['main', 'fade', 'cursor', 'contrast', 'back']
	var tmp
	for i in range(len(objs)):
		tmp = objs[i].get_shader_param('col')
		tmp.x = float(pal[objNames[i]][0]/255)
		tmp.y = float(pal[objNames[i]][1]/255)
		tmp.z = float(pal[objNames[i]][2]/255)
		objs[i].set_shader_param('col', tmp)
		print(tmp)
	print(cursor.get_shader_param('col'))
