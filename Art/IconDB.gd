extends Node2D

const SPELLPATH = 'res://Items/Spells/'
const ICONIMGPATH = 'res://Art/monochrome-transparent_packed.png'

const ICONS = {
	"wizard":{
		"region_rect": Rect2(384,16,16,16),
		"img": ICONIMGPATH
	},
	"spearman":{
		"region_rect": Rect2(416,0,16,16),
		"img": ICONIMGPATH
	},
	"knight":{
		"region_rect": Rect2(448,0,16,16),
		"img": ICONIMGPATH
	},
	"priestess":{
		"region_rect": Rect2(416,16,16,16),
		"img": ICONIMGPATH
	},
	
	"lobster":{
		"region_rect": Rect2(384,80,16,16),
		"img": ICONIMGPATH
	},
	"duck":{
		"region_rect": Rect2(400,112,16,16),
		"img": ICONIMGPATH
	},
	"goblin":{
		"region_rect": Rect2(464,32,16,16),
		"img": ICONIMGPATH
	},
	"skeleton":{
		"region_rect": Rect2(464,96,16,16),
		"img": ICONIMGPATH
	},
	
	"golem":{
		"region_rect": Rect2(480,96,16,16),
		"img": ICONIMGPATH
	},
	"farmer":{
		"region_rect": Rect2(496,32,16,16),
		"img": ICONIMGPATH
	},
	"littlegirl":{
		"region_rect": Rect2(496,48,16,16),
		"img": ICONIMGPATH
	},
	"bandit":{
		"region_rect": Rect2(480,32,16,16),
		"img": ICONIMGPATH
	},
	"dice1":{
		"region_rect": Rect2(672,240,16,16),
		"img": ICONIMGPATH
	},
	"dice2":{
		"region_rect": Rect2(688,240,16,16),
		"img": ICONIMGPATH
	},
	"dice3":{
		"region_rect": Rect2(704,240,16,16),
		"img": ICONIMGPATH
	},
	"dice4":{
		"region_rect": Rect2(720,240,16,16),
		"img": ICONIMGPATH
	},
	"dice5":{
		"region_rect": Rect2(736,240,16,16),
		"img": ICONIMGPATH
	},
	"dice6":{
		"region_rect": Rect2(752,240,16,16),
		"img": ICONIMGPATH
	},
	"empty":{
		"region_rect": Rect2(624,224,16,16),
		"img": ICONIMGPATH
	},
	
	"potion":{
		"region_rect": Rect2(672,176,16,16),
		"img": ICONIMGPATH
	},
	"shield":{
		"region_rect": Rect2(640,32,16,16),
		"img": ICONIMGPATH
	},
	"boots":{
		"region_rect": Rect2(640,16,16,16),
		"img": ICONIMGPATH
	},
	"sword":{
		"region_rect": Rect2(512, 128,16,16),
		"img": ICONIMGPATH
	},
	"hourglass":{
		"region_rect": Rect2(656, 192,16,16),
		"img": ICONIMGPATH
	},
	"skull":{
		"region_rect": Rect2(608,176,16,16),
		"img": ICONIMGPATH
	},
	"heart":{
		"region_rect": Rect2(672,160,16,16),
		"img": ICONIMGPATH
	},
	"pluseffect":{
		"region_rect": Rect2(464,192,16,16),
		"img": ICONIMGPATH
	},
	"sparkleeffect":{
		"region_rect": Rect2(480,192,16,16),
		"img": ICONIMGPATH
	},
	"slash":{
		"region_rect": Rect2(384,176,16,16),
		"img": ICONIMGPATH
	},
	"fire":{
		"region_rect": Rect2(448,176,16,16),
		"img": ICONIMGPATH
	},
	"error":{
		"region_rect": Rect2(560,320,16,16),
		"img": ICONIMGPATH
	},
}


func getItem(item_id):
	if item_id in ICONS:
		return ICONS[item_id]
	else:
		return ICONS["error"]
