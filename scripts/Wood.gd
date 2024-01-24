extends Node2D

var player_in_area = false
var currentFrame: int = 0

var wood = preload("res://scenes/wood_collectable.tscn")

func _ready():
	if currentFrame != 0:
		$timer.start()

func _process(delta):
	$AnimatedSprite2D.frame = currentFrame
	if currentFrame < 20:
		if player_in_area:
			if Input.is_action_just_pressed("E"):
				currentFrame += 1
				pick_wood()


func _on_pickable_body_entered(body):
	if body.has_method("player"):
		player_in_area = true


func _on_pickable_body_exited(body):
	if body.has_method("player"):
		player_in_area = false

func _on_timer_timeout():
	currentFrame -= 1

	if currentFrame == 0:
		pass
	elif currentFrame >= 20:
		currentFrame = 20
		$timer.start()
	else:
		$timer.start()

func pick_wood():
	var wood_instance = wood.instantiate()
	wood_instance.global_position = $Marker2D.global_position
	get_parent().add_child(wood_instance)
	await get_tree().create_timer(1).timeout
	$timer.start()
