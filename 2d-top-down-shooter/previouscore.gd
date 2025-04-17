extends Label

#var default_text = "Previous: "

#func _process(delta):
##	var text = str(default_text, str(Score.previous_score))
#	self.text = (text)

func _ready():
	Score.previous_score_changed.connect(_update_display)
	_update_display(Score.previous_score)

func _update_display(score: int):
	self.text = "Previous: %d" % score 
