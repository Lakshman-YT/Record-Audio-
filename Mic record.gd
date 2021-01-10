extends Control

var effect
var recording

func _ready():
	var index = AudioServer.get_bus_index("Record")
	effect = AudioServer.get_bus_effect(index, 0)
	
	
func _on_RecordButton_pressed():
	if effect.is_recording_active():
		recording = effect.get_recording()
		effect.set_recording_active(false)
		$RecordButton.text = "Record"
	
	else:
		effect.set_recording_active(true)
		$RecordButton.text = "Stop"
		
		


func _on_PlayButton_pressed():
	$AudioStreamPlayer.stream = recording
	$AudioStreamPlayer.play()
	recording = null

