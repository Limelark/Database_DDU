extends Control

var email = null
var password = null


func _ready():
	$HTTPRequest.connect("request_completed", self, "_on_request_completed")

func _on_Username_text_changed(new_text):
	email = new_text
	

func _on_Password_text_changed(new_text):
	password = new_text



func _on_LoginButton_pressed():
	$HTTPRequest.request("http://localhost/apps/Godot%20Server/login.php?email="+email+"&password="+password)

func _on_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	print(json.result)
