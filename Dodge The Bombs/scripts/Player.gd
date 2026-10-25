const DASH_COOLDOWN = 5.0

func _physics_process(delta):
	if not alive:
		return
	
	if dash_timer > 0.0:
		dash_timer -= delta
	else:
		dash_timer = 0.0
	
	if dash_cooldown > 0.0:
		dash_cooldown -= delta
	else:
		dash_cooldown = 0.0
	
	var move = Vector2.ZERO
	if player_id == 1:
		if Input.is_key_pressed(KEY_W):
			move.y -= 1
		if Input.is_key_pressed(KEY_S):
			move.y += 1
		if Input.is_key_pressed(KEY_A):
			move.x -= 1
		if Input.is_key_pressed(KEY_D):
			move.x += 1
		if Input.is_key_pressed(KEY_SHIFT) and dash_cooldown <= 0.0:
			dash_timer = DASH_TIME
			dash_cooldown = DASH_COOLDOWN
	else:
		if Input.is_key_pressed(KEY_UP):
			move.y -= 1
		if Input.is_key_pressed(KEY_DOWN):
			move.y += 1
		if Input.is_key_pressed(KEY_LEFT):
			move.x -= 1
		if Input.is_key_pressed(KEY_RIGHT):
			move.x += 1
		if Input.is_key_pressed(KEY_SPACE) and dash_cooldown <= 0.0:
			dash_timer = DASH_TIME
			dash_cooldown = DASH_COOLDOWN
	
	if move.length() > 0:
		move = move.normalized()
	
	var current_speed = SPEED
	if dash_timer > 0.0:
		current_speed = DASH_SPEED
	
	velocity = move * current_speed
	move_and_slide()
