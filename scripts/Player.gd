extends CharacterBody2D

var speed = 100

var player_state

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if direction.x == 0 and direction.y == 0:
		player_state = "idle"
	elif direction.x != 0 or direction.y != 0:
		player_state = "moving"
		
	velocity = direction * speed
	move_and_slide()

	play_anim(direction)
	
func play_anim(direction):
	if player_state == "idle":
		$AnimatedSprite2D.play("idle")
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
			$AnimatedSprite2D.play("mov ne")
			
		if direction.x > 0.5 and direction.y > 0.5:
			$AnimatedSprite2D.play("mov se")
			
		if direction.x < -0.5 and direction.y > 0.5:
			$AnimatedSprite2D.play("mov sw")
			
		if direction.x > 0.5 and direction.y < -0.5:
			$AnimatedSprite2D.play("mov nw")
			
func player():
	pass
