extends Control

@export var CharacterInformation: Character

@onready var Energybar: TextureProgressBar = $EnergyBar
@onready var Healthbar: TextureProgressBar = $Healthbar
@onready var Experiencebar: TextureProgressBar = $ExperienceBar

signal onlevelup
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if CharacterInformation != null:
		Energybar.set_value(CharacterInformation.Energy)
		Energybar.set_max(CharacterInformation.Max_Energy)
		Healthbar.set_value(CharacterInformation.Health)
		Healthbar.set_max(CharacterInformation.Max_Health)
		Experiencebar.set_value(CharacterInformation.Experiencce)
		Experiencebar.set_max(CharacterInformation.Experience_needed_for_next_level)
	
func _onlevelup(): 
	pass

func setCharacterinformation(Characterplayer: Character):
	CharacterInformation = Characterplayer
