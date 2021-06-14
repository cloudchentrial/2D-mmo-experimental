extends Control
	
onready var _log_dest = get_node("Dialog")
onready var _line_edit = get_node("LineEdit")
var line_edit_flag = false;
	
#Signal to Client node.
signal chatText_bc
	
func _ready():
	pass

func _on_LineEdit_text_entered(newText):
	if not line_edit_flag:
		line_edit_flag = true;
		$Dialog.show()
		return
	
	if newText == "":
		$LineEdit.release_focus()
		line_edit_flag = false;
		$Dialog.hide()
		return
		
	_log(_log_dest, newText)
	emit_signal("chatText_bc", newText)
	if newText.length() > 0:
		_line_edit.clear()

func _received_slaves_text(newSlaveText):
	_log(_log_dest, newSlaveText)
	
#Dialog log.
func _log(node, msg):
	node.add_text(str(msg) + "\n")
