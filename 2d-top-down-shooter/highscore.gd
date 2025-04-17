extends Label


#var default_text = "Highscore: "

#func _process(delta):
#	var text = str(default_text, str(Score.high_score))
#	self.text = (text)
func _ready():
	Score.high_score_changed.connect(_update_display)
	_update_display(Score.high_score)

func _update_display(score: int):
	self.text = "High: %d" % score
