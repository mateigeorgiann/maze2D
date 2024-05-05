extends CharacterBody2D

var SPEED = 100.0

func _process(delta):
	
	#movement, pretty simple every frame it has an empty velocity and it changes it based on input.
	# switched from move_and_collide to move_and_slide because i woud have to manually manage collisions
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("move_right"):
		velocity.x +=1
	if Input.is_action_pressed("move_left"):
		velocity.x -=1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1

	if velocity.y != 0 and velocity.x != 0:
		velocity.y = velocity.y / 1.4
		velocity.x = velocity.x / 1.4
		
	velocity=velocity * SPEED
	##move_and_collide(velocity * delta)
	move_and_slide()
