# Respuestas del reto

Estas son las respuestas esperadas; verifica los resultados ejecutando tu proyecto.

1. **Mantener D dos segundos y soltarla:** el sondeo sube más: aproximadamente 120 cuadros si la física trabaja a 60 ticks/s. En «Solo derecha» se reciben 2 eventos: presionar y soltar, porque usamos `is_action()` e ignoramos el eco. En el contador compartido se suma 1 pulsación, porque usa `is_action_pressed()`.
2. **Mantener A sin D:** `get_axis("move_left", "move_right")` muestra -1.00 y `get_action_strength("move_right")` muestra 0.00. El eje resta fuerza izquierda a fuerza derecha, mientras que la segunda consulta solo mide la derecha.
3. **Girar la rueda:** aparece `InputEventMouseButton`. Dentro de esa clase se comprueba primero si el índice corresponde a la rueda; de lo contrario, una rama genérica de botones la trataría como un clic. No muevas el ratón después si deseas leer ese último evento en pantalla.
