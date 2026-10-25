func find_valid_bomb_position() -> Vector2:
	for i in range(150):
		var x = randf_range(90, ARENA_WIDTH - 90)
		var y = randf_range(90, ARENA_HEIGHT - 180)
		var pos = Vector2(x, y)
		var valid = true
		for player in players:
			if player != null and player.is_inside_tree():
				if player.global_position.distance_to(pos) < 140:
					valid = false
					break
		if valid:
			for bomb in bombs:
				if bomb != null and bomb.is_inside_tree():
					if bomb.global_position.distance_to(pos) < 90:
						valid = false
						break
		if valid:
			return pos
	return Vector2.ZERO
