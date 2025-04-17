extends Node

#var zombie_number = 0

#var high_score = 0
#var current_score: int
#var previous_score: int

# Scores
var current_score := 0:
	set(value):
		current_score = value
		current_score_changed.emit(value)

var previous_score := 0:
	set(value):
		previous_score = value
		previous_score_changed.emit(value)

var high_score := 0:
	set(value):
		high_score = value
		high_score_changed.emit(value)

# Signals
signal current_score_changed(new_score)
signal previous_score_changed(new_score)
signal high_score_changed(new_score)

const SAVE_PATH := "user://highscore.save"

func _ready():
	load_high_score()
	# Debug: Print loaded high score
	print("Loaded high score: ", high_score)

func add_points(points: int):
	current_score += points  # Uses setter to auto-emit signal

func finalize_scores():
	previous_score = current_score
	
	if current_score > high_score:
		high_score = current_score
		save_high_score()
	
	current_score = 0

func save_high_score():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_var(high_score)
	# Debug: Confirm save
	print("Saved high score: ", high_score)

func load_high_score():
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		high_score = file.get_var()
		# Debug: Confirm load
		print("Loaded high score: ", high_score)
