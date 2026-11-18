extends Node2D

const ACCIONES = ["move_left", "move_right", "move_up", "move_down"]
@onready var hud: Label = $Hud
var cuadros_pulsado := 0
var pulsaciones_totales := 0
var cuadros_derecha := 0
var eventos_derecha := 0
var ultima_clase := "Sin eventos"
var dispositivo := "Teclado (seleccionado)"
var senal := "Digital"
var detalle := "Pulsa una tecla"

func _physics_process(_delta: float) -> void:
	for accion in ACCIONES:
		if Input.is_action_pressed(accion):
			cuadros_pulsado += 1
			break
	if Input.is_action_pressed("move_right"):
		cuadros_derecha += 1
	actualizar_hud()

func _input(event: InputEvent) -> void:
	if event.is_echo():
		return
	ultima_clase = event.get_class()
	if event is InputEventKey:
		dispositivo = "Teclado | ID %d" % event.device
		senal = "Digital"
		detalle = "Pulsación" if event.pressed else "Liberación"
	elif event is InputEventMouseButton:
		dispositivo = "Ratón | ID %d" % event.device
		senal = "Digital"
		if event.button_index in [MOUSE_BUTTON_WHEEL_UP, MOUSE_BUTTON_WHEEL_DOWN, MOUSE_BUTTON_WHEEL_LEFT, MOUSE_BUTTON_WHEEL_RIGHT]:
			detalle = "Rueda del ratón | dirección %d" % event.button_index
		else:
			detalle = "Clic / liberación | botón %d" % event.button_index
	elif event is InputEventMouseMotion:
		dispositivo = "Ratón | ID %d" % event.device
		senal = "Posición"
		detalle = "Movimiento: %s" % event.position
	else:
		dispositivo = "Otro | ID %d" % event.device
		senal = "No clasificada"
		detalle = "Evento recibido"
	for accion in ACCIONES:
		if event.is_action_pressed(accion):
			pulsaciones_totales += 1
			break
	if event.is_action("move_right"):
		eventos_derecha += 1

func actualizar_hud() -> void:
	hud.text = ("CENTRO DE CONTROL DE ENTRADAS\n"
		+ "W A S D: mover | Espacio: consultar jump\n\n"
		+ "jump: %s   |   get_axis: %.2f   |   fuerza derecha: %.2f\n\n"
		+ "CUATRO DIRECCIONES\nSondeo: %d cuadros   |   Pulsaciones: %d\n\n"
		+ "SOLO DERECHA (GUÍA)\nSondeo: %d cuadros   |   Eventos (presionar/soltar): %d\n\n"
		+ "Último evento: %s\nDispositivo: %s\nSeñal: %s   |   %s") % [
		"verdadero" if Input.is_action_pressed("jump") else "falso",
		Input.get_axis("move_left", "move_right"),
		Input.get_action_strength("move_right"),
		cuadros_pulsado, pulsaciones_totales, cuadros_derecha, eventos_derecha,
		ultima_clase, dispositivo, senal, detalle]
