extends Control

var email = null
var password = null


func _ready():
	$HTTPRequest.connect("request_completed", self, "_on_request_completed")

func _on_Username_text_changed(new_text):
	email = new_text
	

func _on_Password_text_changed(new_text):
	password = new_text

func _on_Signup_pressed():
	var scene_to_load = "res://SignupScreen.tscn"
	get_tree().change_scene(scene_to_load)

func _on_LoginButton_pressed():
	$HTTPRequest.request("http://localhost/apps/Godot%20Server/login.php?email="+email+"&password="+password)



func _on_request_completed(result, response_code, headers, body):
	if response_code == 200:
		# The request was successful (HTTP status code 200).
		var response_string = body.get_string_from_utf8()
		print("Response:", response_string)
	else:
		# Handle the error or display an error message.
		print("Error: HTTP response code", response_code)
