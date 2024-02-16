extends Control

@onready var Energybar: TextureProgressBar = $EnergyBar
@onready var Healthbar: TextureProgressBar = $Healthbar
@onready var Experiencebar: TextureProgressBar = $ExperienceBar
@onready var StaminaBar: TextureProgressBar = $StaminaBar
@onready var ThirstBar: TextureProgressBar = $ThirstBar
@onready var HungerBar: TextureProgressBar = $Hungerbar
@export var CharacterInformation: Character

signal onlevelup(int)
signal HUDUpdate()
signal Characterset(Character)

# Called when the node enters the scene tree for the first time.
func _ready():
	Energybar.set_value(CharacterInformation.Energy)
	Energybar.set_max(CharacterInformation.Max_Energy)
	Healthbar.set_value(CharacterInformation.Health)
	Healthbar.set_max(CharacterInformation.Max_Health)
	Experiencebar.set_value(CharacterInformation.Experience)
	Experiencebar.set_max(CharacterInformation.Experience_needed_for_next_level)
	StaminaBar.set_value(CharacterInformation.Stamina)
	StaminaBar.set_max(CharacterInformation.Max_Stamina)
	ThirstBar.set_value(CharacterInformation.Thirst)
	ThirstBar.set_max(CharacterInformation.max_thirst)
	HungerBar.set_value(CharacterInformation.Hunger)
	HungerBar.set_max(CharacterInformation.max_Hunger)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Energybar.set_value(CharacterInformation.Energy)
	Energybar.set_max(CharacterInformation.Max_Energy)
	Healthbar.set_value(CharacterInformation.Health)
	Healthbar.set_max(CharacterInformation.Max_Health)
	Experiencebar.set_value(CharacterInformation.Experience)
	Experiencebar.set_max(CharacterInformation.Experience_needed_for_next_level)
	if StaminaBar.value == CharacterInformation.Max_Stamina:
		StaminaBar.visible = false
	StaminaBar.set_value(CharacterInformation.Stamina)
	StaminaBar.set_max(CharacterInformation.Max_Stamina)
	ThirstBar.set_value(CharacterInformation.Thirst)
	ThirstBar.set_max(CharacterInformation.max_thirst)
	HungerBar.set_value(CharacterInformation.Hunger)
	HungerBar.set_max(CharacterInformation.max_Hunger)


func _onlevelup(Level: int): 
	pass
	
func _HUDUpdate():
	pass
	
func _onstartsprinting():
	pass

func setCharacter(player: Character):
	self.CharacterInformation = player
	Characterset.emit()
