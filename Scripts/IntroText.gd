extends Label

# Exported variables
export (float) var transition_time = 1
export (String) var text_1 = "Hello!"
export (String) var text_2 = "Move using WASD and Shoot using SPACE"

# Creating helper variables
var text_list = [text_1, text_2]
var n_changed = 0

func _ready():
	$"Text Timer".set_wait_time(transition_time)
	$"Text Timer".start()

func _process(delta):
	pass

func _Timer_timeout():
	_change_text()

func _change_text():
	
	if n_changed == len(text_list):
		$"Text Timer".stop()
		self.text = ""
	
	else:
		self.text = text_list[n_changed]
		n_changed += 1
