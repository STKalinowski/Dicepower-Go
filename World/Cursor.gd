extends Node2D

onready var itemHitbox = $Sprite/ItemHitbox
onready var containerHitbox = $Sprite/ContainerHitbox
var spellUi

var assignedTeam
var itemHeld = null
var itemLastPos
var itemOffSet

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	pass # Replace with function body.

func _process(_delta):
	self.position = get_global_mouse_position()
	if Input.is_action_just_pressed("grab"):
		#This second one is for if a grab was sent to cursor!
		if itemHeld == null:
			grab(itemHitbox.get_overlapping_areas())
	if Input.is_action_just_released("grab"):
		drop(containerHitbox.get_overlapping_areas())
	if itemHeld != null:
		#itemHeld.global_position = self.position+itemOffSet
		itemHeld.position = self.position+itemOffSet
		#print(itemHeld.global_position)

func _notification(what):
	match what:
		NOTIFICATION_WM_MOUSE_EXIT:
			self.visible = false
		NOTIFICATION_WM_MOUSE_ENTER:
			self.visible = true

func grab(collisionList):
	if collisionList != []:
		itemHeld = collisionList[0].get_parent().grab(assignedTeam)
		if itemHeld != null:
			itemLastPos = itemHeld.position
			itemOffSet = itemHeld.position-self.position
	else:
		spellUi.hideUi()

func drop(collisionList):
	if itemHeld != null:
		if collisionList == []:
			itemHeld.position = itemLastPos
			itemHeld = null
		else:
			var res = collisionList[0].get_parent().drop(itemHeld)
			if res == false:
				itemHeld.position = itemLastPos
			itemHeld = null
	pass

#If a function needs to send the player a grab/item to drop!
func sendGrab(dropItem):
	if itemHeld == null:
		itemHeld = dropItem
		itemHeld.position = self.position
		itemOffSet = Vector2(0,0)
		return true
	else:
		return false

#---
#extends Control
#
#
#onready var playerRef
#onready var enemyRef
#
#var itemHeld = null
#var itemOffset = Vector2()
#var lastContainer = null
#
#
#
## Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.
#
#func _process(delta):
#	var curPos = get_global_mouse_position()
#	if Input.is_action_just_pressed("grab"):
#		grab(curPos)
#	if Input.is_action_just_released("grab"):
#		release(curPos)
#	if itemHeld != null: 
#		if itemHeld.objType == 'die':
#			itemHeld.position = curPos + itemOffset
#		else:
#			itemHeld.rect_global_position = curPos + itemOffset
#
#func grab(curPos):
#	var retCont = getContainerUnderMouse(curPos)
#	if retCont != null and retCont.has_method('grabItem'):
#		print(curPos)
#		itemHeld = retCont.grabItem(curPos)
#		print(itemHeld)
#		if itemHeld != null:
#			if itemHeld.objType == 'die':
#				lastContainer = retCont
#				itemOffset = itemHeld.global_position - curPos
#				var holdGlobPod = itemHeld.global_position
#				itemHeld.position = holdGlobPod
#				self.add_child(itemHeld)
#			if itemHeld.objType == 'spell':
#				pass#need to check for die in unitUI & 
#			if itemHeld.objType == 'unit':
#				#Call Unit UI
#				pass
#	pass
#
#func release(curPos):
#	if itemHeld != null:
#		if itemHeld.objType == 'die':
#			self.remove_child(itemHeld)
#			if lastContainer.insertDie(itemHeld):
#				itemHeld = null
#	pass
#
#func getContainerUnderMouse(curPos):
#	var containers = playerRef.getContainers() #+ enemyRef.getContainers()
#	print(containers)
#	for i in containers:
#		if i.get_global_rect().has_point(curPos):
#			return i
#	return null
