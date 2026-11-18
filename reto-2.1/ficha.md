# Ficha del dispositivo: teclado convencional

Borrador para adaptar con tus palabras y con el teclado que realmente usaste.

- **Tecnología de captura:** al pulsar una tecla se cierra un contacto en una matriz de filas y columnas. El controlador detecta el cambio y envía el código al equipo. El mecanismo concreto depende de si el teclado es de membrana o mecánico.
- **Tipo de señal usado en el juego:** digital. Cada tecla tiene dos estados: pulsada o liberada; no medimos cuánto la presionas.
- **Ventaja:** permite asignar varias acciones a teclas fáciles de alcanzar.
- **Limitación:** algunos teclados no detectan ciertas combinaciones simultáneas; además, una tecla convencional no aporta una intensidad gradual.
- **Juego ejemplo:** Minecraft, donde WASD permite desplazarse.
- **Fuente para los eventos de teclado y su estado:** documentación oficial de Godot, https://docs.godotengine.org/en/stable/classes/class_inputeventkey.html

El HUD informa la señal del último evento: teclado = digital; botón o rueda = digital/discreto; movimiento del ratón = posición. Al presionar una tecla coincide con esta ficha.
