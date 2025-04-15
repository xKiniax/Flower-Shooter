extends Label

var default_text = "Flowers Flourished: "

func _process(delta):
	var text = str(default_text, str(Score.current_score))
	self.text = (text)
