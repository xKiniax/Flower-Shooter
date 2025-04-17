extends Label

#var default_text = "Flowers Flourished: "

#func _process(delta):
#	var display_text = default_text + str(Score.current_score)
#	print("Current score: ", Score.current_score)
#	self.text = display_text  # or just `text = display_text` without self
#	print("counting...")

func _ready():
	Score.current_score_changed.connect(_update_display)
	_update_display(Score.current_score) # Initialize display

func _update_display(score: int):
	self.text = "Current: %d" % score 
