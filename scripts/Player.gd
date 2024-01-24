extends CharacterBody2D

var speed = 100

var doing: int

var player_state

@export var inv: Inv

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	if direction == Vector2.ZERO:
		if doing == 1:
			player_state = "axe"
		else:
			player_state = "idle"
	else:
		player_state = "moving"

	velocity = direction * speed
	move_and_slide()

	play_anim(direction)
	
func play_anim(direction):
	print(doing)
	if player_state == "idle":
		$AnimatedSprite2D.play("idle")
		
	if player_state == "axe":
		$AnimatedSprite2D.play("z_axe")
		
	if player_state == "moving":
		if direction.y == -1:
			$AnimatedSprite2D.play("mov north")
			
		if direction.y == 1:
			$AnimatedSprite2D.play("mov south")
			
		if direction.x == -1:
			$AnimatedSprite2D.play("mov west")
			
		if direction.x == 1:
			$AnimatedSprite2D.play("mov east")
			
		if direction.x > 0.5 and direction.y < -0.5:
			$AnimatedSprite2D.play("mov north")
			
		if direction.x > 0.5 and direction.y > 0.5:
			$AnimatedSprite2D.play("mov south")
			
		if direction.x < -0.5 and direction.y > 0.5:
			$AnimatedSprite2D.play("mov south")
			
		if direction.x > 0.5 and direction.y < -0.5:
			$AnimatedSprite2D.play("mov north")
			
func player():
	pass
	
func collect(item):
	inv.insert(item)
	
func axe():
	inv.remove()
	doing = 1
	await get_tree().create_timer(0.7).timeout
	doing = 0


