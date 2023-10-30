extends Control

var username = null
var password = null




func _on_Username_text_changed(new_text):
	username = new_text
	

func _on_Password_text_changed(new_text):
	password = new_text



func _on_LoginButton_pressed():
	print(username)
	print(password)
