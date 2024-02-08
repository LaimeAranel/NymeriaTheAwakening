extends Resource
class_name Character

@export var Name: String
enum EnumRace{ Human, Darkelf, Woodelf,}
@export var Race: EnumRace
enum EnumElement{ Fire, Water, Air, Nature, }
@export var Element: EnumElement

@export_category("leveling")
@export var Level: int
@export var Experience: float
@export var Experience_needed_for_next_level: float
@export var Skillpoints: float

@export var Elemental_Level: int
@export var Elemental_Experiencce: float
@export var Elemental_Experience_needed_for_next_level: float
@export var Elemental_Skillpoints: float


@export_category("needs")
@export var Health: float
@export var Max_Health: float
@export var Healthregen: float
@export var waitTimeHealth: int

@export var Energy: float
@export var Max_Energy: float

@export var Stamina: float
@export var Max_Stamina: float
@export var StaminaReduction: float = 0.050
@export var Staminaregeneration: float = 0.025

@export var Sleep: float
@export var max_sleep: float
@export var SleepReduction: float = 0.050

@export var Hunger: float
@export var max_Hunger: float
@export var HungerReduction: float = 0.050

@export var Thirst: float
@export var max_thirst: float
@export var ThirstReduction: float = 0.050

@export_category("stats")
@export var Intelligence: int
@export var Strength: int
@export var Agillity: int
@export var Charisma: int
@export var additional_movement_speed: float

@export_category("Player_state")
@export var PlayerPos: Vector3

signal saveCharacter
signal loadCharacter
signal updateStats
signal DealDamagetoPlayer(float)
signal ReduceStamina
signal StaminaEmpty
signal stopSprinting

func _onstartsprinting():
	while await stopSprinting:
		if Stamina != 0:
			Stamina = Stamina - StaminaReduction
			print(Stamina)
		else: 
			stopSprinting.emit()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Health < Max_Health:
		regenerateHealth()
	if delta == 100:
		if Hunger > 0:
			Hunger = Hunger - 1
		if Thirst > 0:
			Thirst = Thirst - 1
		if Sleep > 0 and Sleep != max_sleep:
			Sleep = Sleep - 0.5

func regenerateHealth():
	while Health < Max_Health:
		if Timer.time_left == 0:
			Health = Health + Healthregen
			Hunger = Hunger - 1
			Thirst = Thirst - 0.5
		else:
			continue
		

