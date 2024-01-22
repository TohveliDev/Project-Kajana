extends Node2D

var state = "no wood"
var picking = false

var wood = preload("res://scenes/wood_collectable.tscn")

@export var item: InvItem
var player = null

func _ready():
	if state == "no wood":
		$Timer.start()
		
func _process(delta):
	if state == "no wood":
		$AnimatedSprite2D.play("no wood")
	if state == "wood":
		$AnimatedSprite2D.play("wood")
		if picking:
			if Input.is_action_just_pressed("E"):
				state = "no wood"
				drop_wood()

func _on_pickable_body_entered(body):
	if body.has_method("player"):
		picking = true
		player = body


func _on_pickable_body_exited(body):
	if body.has_method("player"):
		picking = false


func _on_timer_timeout():
	if state == "no wood":
		state = "wood"

func drop_wood():
	var wood_inst = wood.instantiate()
	wood_inst.global_position = $Marker2D.global_position
	get_parent().add_child(wood_inst)
	player.collect(item)
	await get_tree().create_timer(3).timeout
	$Timer.start()
