extends Node2D

var hour
var minute
var second
var schedule

signal scene_changed(scene_name)

@export var scene_name = "main"

@onready var audio = $AudioStreamPlayer

@onready var Current_Time = get_node("Current_Time")
@onready var hourLabel = Current_Time.get_node("Hour")
@onready var minuteLabel = Current_Time.get_node("Minute")
@onready var secondLabel = Current_Time.get_node("Second")
@onready var statusLabel = $CenterContainer/StatusLabel
# Called when the node enters the scene tree for the first time.
func _ready():
	get_window().set_title("Main")
	
func _process(_delta):
	hour = Time.get_time_dict_from_system()["hour"]
	minute = Time.get_time_dict_from_system()["minute"]
	second = Time.get_time_dict_from_system()["second"]
	
	hourLabel.text = str(hour) + "시 "
	minuteLabel.text = str(minute) + "분 "
	secondLabel.text = str(second) + "초 "
	
	# Track 001: 
	if hour == 8 and minute == 5 and second == 0 and !audio.playing:
		audio.stream = load("res://sources/mp3/001 0805 1교시 입실준비.mp3")
		statusLabel.text = statusLabel.text + "001 0805 1교시 입실준비"
		audio.play()
	# Track 002: 
	elif hour == 8 and minute == 10 and second == 0 and !audio.playing:
		audio.stream = load("res://sources/mp3/002 0810 1교시 입실완료.mp3")
		statusLabel.text = statusLabel.text + "002 0810 1교시 입실완료"
		audio.play()
	# Track 003: 
	elif hour == 8 and minute == 25 and second == 0 and !audio.playing:
		audio.stream = load("res://sources/mp3/003 0825 1교시 예비령.mp3")
		statusLabel.text = statusLabel.text + "003 0825 1교시 예비령"
		audio.play()
	# Track 004: 
	elif hour == 8 and minute == 35 and second == 0 and !audio.playing:
		audio.stream = load("res://sources/mp3/004 0835 1교시 준비령.mp3")
		statusLabel.text = statusLabel.text + "004 0835 1교시 준비령"
		audio.play()
	# Track 005
	elif hour == 8 and minute == 40 and second == 0 and !audio.playing:
		audio.stream = load("res://sources/mp3/005 0840 1교시 본령.mp3")
		statusLabel.text = statusLabel.text + "005 0840 1교시 본령"
		audio.play()
	# Track 006
	elif hour == 9 and minute == 50 and second == 0 and !audio.playing:
		audio.stream = load("res://sources/mp3/006 0950 1교시 종료10분전.mp3")
		statusLabel.text = statusLabel.text + "006 0950 1교시 종료10분전"
		audio.play()
	# Track 007
	elif hour == 10 and minute == 0 and second == 0 and !audio.playing:
		audio.stream = load("res://sources/mp3/007 1000 1교시 종료령.mp3")
		statusLabel.text = statusLabel.text + "007 1000 1교시 종료령"
		audio.play()
	# Track 008
	elif hour == 10 and minute == 15 and second == 0 and !audio.playing:
		audio.stream = load("res://sources/mp3/008 1015 2교시 입실.mp3")
		statusLabel.text = statusLabel.text + "008 1015 2교시 입실"
		audio.play()
	# Track 009
	elif hour == 10 and minute == 20 and second == 0 and !audio.playing:
		audio.stream = load("res://sources/mp3/009 1020 2교시 예비령.mp3")
		statusLabel.text = statusLabel.text + "009 1020 2교시 예비령"
		audio.play()
	# Track 010
	elif hour == 10 and minute == 25 and second == 0 and !audio.playing:
		audio.stream = load("res://sources/mp3/010 1025 2교시 준비령.mp3")
		statusLabel.text = statusLabel.text + "010 1025 2교시 준비령"
		audio.play()
	# Track 011
	elif hour == 10 and minute == 30 and second == 0 and !audio.playing:
		audio.stream = load("res://sources/mp3/011 1030 2교시 본령.mp3")
		statusLabel.text = statusLabel.text + "011 1030 2교시 본령"
		audio.play()

	# Track 012
	elif hour == 12 and minute == 0 and second == 0 and !audio.playing:
		audio.stream = load("res://sources/mp3/012 1200 2교시 종료10분전.mp3")
		statusLabel.text = statusLabel.text + "012 1200 2교시 종료10분전"
		audio.play()
	# Track 013
	elif hour == 12 and minute == 10 and second == 0 and !audio.playing:
		audio.stream = load("res://sources/mp3/013 1210 2교시 종료령.mp3")
		statusLabel.text = statusLabel.text + "013 1210 2교시 종료령"
		audio.play()
	# Track 014
	elif hour == 12 and minute == 55 and second == 0 and !audio.playing:
		audio.stream = load("res://sources/mp3/014 1255 3교시 입실.mp3")
		statusLabel.text = statusLabel.text + "014 1255 3교시 입실"
		audio.play()
		
	# Track 015
	elif hour == 13 and minute == 0 and second == 0 and !audio.playing:
		audio.stream = load("res://sources/mp3/015 1300 3교시 예비령.mp3")
		statusLabel.text = statusLabel.text + "015 1300 3교시 예비령"
		audio.play()
		
	# Track 016
	elif hour == 13 and minute == 5 and second == 0 and !audio.playing:
		audio.stream = load("res://sources/mp3/016 1305 3교시 준비령.mp3")
		statusLabel.text = statusLabel.text + "016 1305 3교시 준비령"
		audio.play()

	# Track 017
	elif hour == 14 and minute == 10 and second == 0 and !audio.playing:
		audio.stream = load("res://sources/mp3/017 1410 3교시 종료10분전.mp3")
		statusLabel.text = statusLabel.text + "017 1410 3교시 종료10분전"
		audio.play()
		
	# Track 018
	elif hour == 14 and minute == 20 and second == 0 and !audio.playing:
		audio.stream = load("res://sources/mp3/018 1420 3교시 종료령.mp3")
		statusLabel.text = statusLabel.text + "018 1420 3교시 종료령"
		audio.play()
		
	# Track 019
	elif hour == 14 and minute == 35 and second == 0 and !audio.playing:
		audio.stream = load("res://sources/mp3/019 1435 4교시 입실.mp3")
		statusLabel.text = statusLabel.text + "019 1435 4교시 입실"
		audio.play()
		
	# Track 020
	elif hour == 14 and minute == 40 and second == 0 and !audio.playing:
		audio.stream = load("res://sources/mp3/020 1440 4교시 한국사 예비령.mp3")
		statusLabel.text = statusLabel.text + "020 1440 4교시 한국사 예비령"
		audio.play()
		
	# Track 021
	elif hour == 14 and minute == 45 and second == 0 and !audio.playing:
		audio.stream = load("res://sources/mp3/021 1445 4교시 한국사 준비령.mp3")
		statusLabel.text = statusLabel.text + "021 1445 4교시 한국사 준비령"
		audio.play()
		
	# Track 022
	elif hour == 14 and minute == 50 and second == 0 and !audio.playing:
		audio.stream = load("res://sources/mp3/022 1450 4교시 한국사 본령.mp3")
		statusLabel.text = statusLabel.text + "022 1450 4교시 한국사 본령"
		audio.play()
		
	# Track 023
	elif hour == 15 and minute == 15 and second == 0 and !audio.playing:
		audio.stream = load("res://sources/mp3/023 1515 4교시 한국사 종료5분전.mp3")
		statusLabel.text = statusLabel.text + "023 1515 4교시 한국사 종료5분전"
		audio.play()
		
	# Track 024
	elif hour == 15 and minute == 20 and second == 0 and !audio.playing:
		audio.stream = load("res://sources/mp3/024 1520 4교시 한국사 종료령.mp3")
		statusLabel.text = statusLabel.text + "024 1520 4교시 한국사 종료령"
		audio.play()
		
	# Track 025
	elif hour == 15 and minute == 25 and second == 0 and !audio.playing:
		audio.stream = load("res://sources/mp3/025 1525 4교시 탐구 예비령.mp3")
		statusLabel.text = statusLabel.text + "025 1525 4교시 탐구 예비령"
		audio.play()
		
	# Track 026
	elif hour == 15 and minute == 30 and second == 0 and !audio.playing:
		audio.stream = load("res://sources/mp3/026 1530 4교시 탐구 준비령.mp3")
		statusLabel.text = statusLabel.text + "026 1530 4교시 탐구 준비령"
		audio.play()
		
	# Track 027
	elif hour == 15 and minute == 35 and second == 0 and !audio.playing:
		audio.stream = load("res://sources/mp3/027 1535 4교시 탐구 첫번째 본령.mp3")
		statusLabel.text = statusLabel.text + "027 1535 4교시 탐구 첫번째 본령"
		audio.play()

	# Track 028
	elif hour == 16 and minute == 0 and second == 0 and !audio.playing:
		audio.stream = load("res://sources/mp3/028 1600 4교시 탐구 첫번째 종료5분전.mp3")
		statusLabel.text = statusLabel.text + "028 1600 4교시 탐구 첫번째 종료5분전"
		audio.play()
		
	# Track 029
	elif hour == 16 and minute == 5 and second == 0 and !audio.playing:
		audio.stream = load("res://sources/mp3/029 1605 4교시 탐구 첫번째 종료령.mp3")
		statusLabel.text = statusLabel.text + "029 1605 4교시 탐구 첫번째 종료령"
		audio.play()
		
	# Track 030
	elif hour == 16 and minute == 7 and second == 0 and !audio.playing:
		audio.stream = load("res://sources/mp3/030 1607 4교시 탐구 두번째 본령.mp3")
		statusLabel.text = statusLabel.text + "030 1607 4교시 탐구 두번째 본령"
		audio.play()
		
	# Track 031
	elif hour == 16 and minute == 32 and second == 0 and !audio.playing:
		audio.stream = load("res://sources/mp3/031 1632 4교시 탐구 두번째 종료5분전.mp3")
		statusLabel.text = statusLabel.text + "031 1632 4교시 탐구 두번째 종료5분전"
		audio.play()
		
	# Track 032
	elif hour == 16 and minute == 37 and second == 0 and !audio.playing:
		audio.stream = load("res://sources/mp3/032 1637 4교시 탐구 두번째 종료령 시험장 종료.mp3")
		statusLabel.text = statusLabel.text + "032 1637 4교시 탐구 두번째 종료령 시험장 종료"
		audio.play()
		
func _on_AudioStreamPlayer_finished():
	statusLabel.text = "Status: "

func _on_SetupButton_pressed():
	print("Scene change button has been pressed.")
	
