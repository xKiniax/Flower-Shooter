extends Label


var default_text = "Highscore: "

func _process(delta):
	var text = str(default_text, str(Score.high_score))
	self.text = (text)
