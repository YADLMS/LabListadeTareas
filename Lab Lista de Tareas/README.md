# Gestor de Tareas en Ruby

Este proyecto permite gestionar una lista de tareas usando Ruby a través de la consola. Incluye funciones para agregar, completar, eliminar, ver y guardar tareas en archivo.

## Requisitos

- Ruby instalado en el sistema
- Editor de texto o consola (Cmd, Terminal, note++, VsCode)

## Archivos

- `tasklist.rb`: Contiene la clase TaskList con toda la logica del manejo de tareas.
- `main.rb`: Contiene el menu interactivo para ejecutar desde consola.

## Instrucciones de uso

1. Abre la terminal o consola.
2. Ve al directorio donde estan los archivos.
3. Ejecuta el programa con:

```bash
ruby main.rb
```

4. Sigue las instrucciones en pantalla para usar el gestor.

## Opciones del menu

1. Agregar tarea  
2. Marcar tarea como completada  
3. Eliminar tarea  
4. Ver tareas  
5. Guardar tareas en archivo  
6. Cargar tareas desde archivo  
7. Salir

## Notas

- Las tareas se guardan en archivos `.txt` con formato separado por `|`.
- Al cargar un archivo, se reemplaza la lista actual.
