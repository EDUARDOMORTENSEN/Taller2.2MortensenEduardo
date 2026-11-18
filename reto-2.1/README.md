# Reto 2.1 — Panel de controles

Proyecto en **Godot 4** que muestra en pantalla, en tiempo real, cómo el motor recibe y procesa las entradas del jugador. Combina un HUD de diagnóstico con un personaje que se mueve en cuatro direcciones usando el Input Map.

## Objetivo

Comparar las dos formas de leer entradas en Godot:

- **Sondeo (polling):** consultar cada tick de física si una acción está activa con `Input.is_action_pressed()`, `Input.get_axis()` y `Input.get_action_strength()`.
- **Eventos:** reaccionar en `_input(event)` a cada `InputEvent` que llega (teclado, botones del ratón, rueda y movimiento), clasificando el dispositivo y el tipo de señal.

## Estructura

| Archivo | Descripción |
|---|---|
| `project.godot` | Configuración del proyecto, ventana de 1152×720 e Input Map. |
| `main.tscn` | Escena principal: nodo `Main` con el `Hud` (Label) y una instancia de `Player`. |
| `main.gd` | Lógica del HUD: contadores de sondeo y de eventos, clasificación del último evento recibido. |
| `player_base.tscn` | Personaje: `CharacterBody2D` con un cuadrado de color, ojos y colisión. |
| `player.gd` | Movimiento en cuatro direcciones con velocidad configurable desde el Inspector. |
| `ficha.md` | Ficha técnica del teclado como dispositivo de entrada. |
| `respuestas.md` | Respuestas a las preguntas del reto. |

## Input Map

| Acción | Tecla |
|---|---|
| `move_left` | A |
| `move_right` | D |
| `move_up` | W |
| `move_down` | S |
| `jump` | Espacio |

## Qué muestra el HUD

- Estado de `jump`, valor de `get_axis("move_left", "move_right")` y fuerza de `move_right`.
- **Cuatro direcciones:** cuadros en los que hay al menos una dirección activa (suma una vez por tick, aunque haya dos teclas a la vez) y pulsaciones totales (una por evento de presión, sin eco).
- **Solo derecha:** cuadros con D mantenida y eventos de presionar/soltar D.
- **Último evento:** clase del evento, dispositivo con su ID, tipo de señal (digital o posición) y detalle. La rueda del ratón se distingue de un clic aunque ambos sean `InputEventMouseButton`.

## Movimiento del personaje

`player.gd` construye un vector de dirección a partir de las cuatro acciones, lo normaliza para que el movimiento diagonal no sea más rápido y lo multiplica por `speed` (260 por defecto, editable en el Inspector). La posición se limita al área inferior de la pantalla para no tapar el HUD.

## Cómo ejecutarlo

1. Abre Godot 4 y pulsa **Importar**.
2. Selecciona `reto-2.1/project.godot`.
3. Ejecuta con **F5** (o abre `main.tscn` y pulsa **F6**).
4. Da foco a la ventana y prueba WASD, Espacio, clics y la rueda del ratón.

## Pruebas sugeridas

- Mantén D unos dos segundos: unos 120 cuadros de sondeo, 2 eventos (presionar y soltar) y 1 pulsación compartida.
- Mantén A: el eje marca -1.00 y la fuerza derecha 0.00.
- Pulsa W o S: el personaje se mueve y suma al contador compartido.
- Mantén Espacio: `jump` pasa a verdadero.
- Gira la rueda sin mover el ratón: aparece `InputEventMouseButton` con el detalle «Rueda del ratón».
- Cambia `Speed` en el Inspector y comprueba la nueva velocidad.

## Referencias

- [Clase Input — Godot Docs](https://docs.godotengine.org/en/stable/classes/class_input.html)
- [InputEventKey — Godot Docs](https://docs.godotengine.org/en/stable/classes/class_inputeventkey.html)

**Autor:** Eduardo Mortensen
