extends Label

var default_text = "Previous: "

func _process(delta):
	var text = str(default_text, str(Score.previous_score))
	self.text = (text)
