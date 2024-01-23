extends Node2D

var state = "empty"
var burning = false

@export var item: InvItem

func _ready():
	if state == "empty":
		pass

func _process(delta):
	if state == "empty":
		$AnimatedSprite2D.play("empty")
	if state == "burning":
		$AnimatedSprite2D.play("burning")
		if burning:
			if Input.is_action_just_pressed("E"):
				state = "burning"
				$Timer.start()
