require_relative 'tasklist'  # Cargar la clase TaskList desde otro archivo

tasklist = TaskList.new  # Crear una nueva instancia de la clase TaskList

loop do
  # Mostrar el menú de opciones
  puts "\n--- MENU DE TAREAS ---"
  puts "1. Agregar tarea"
  puts "2. Marcar tarea como completada"
  puts "3. Eliminar tarea"
  puts "4. Ver tareas"
  puts "5. Guardar tareas en archivo"
  puts "6. Cargar tareas desde archivo"
  puts "7. Salir"
  print "Seleccione una opcion: "
  opcion = gets.chomp  # Leer la opcion del usuario

  case opcion
  when "1"
    # Agregar nueva tarea
    print "Ingrese la descripcion de la tarea: "
    descripcion = gets.chomp
    tasklist.agregar_tarea(descripcion)

  when "2"
    # Marcar tarea como completada
    tasklist.ver_tareas
    print "Ingrese el numero de la tarea a completar: "
    indice = gets.chomp.to_i
    tasklist.marcar_completada(indice)

  when "3"
    # Eliminar una tarea
    tasklist.ver_tareas
    print "Ingrese el numero de la tarea a eliminar: "
    indice = gets.chomp.to_i
    tasklist.eliminar_tarea(indice)

  when "4"
    # Ver todas las tareas
    tasklist.ver_tareas

  when "5"
    # Guardar tareas en archivo
    print "Nombre del archivo para guardar (ej: tareas.txt): "
    archivo = gets.chomp
    tasklist.guardar_en_archivo(archivo)

  when "6"
    # Cargar tareas desde archivo
    print "Nombre del archivo para cargar (ej: tareas.txt): "
    archivo = gets.chomp
    tasklist.cargar_desde_archivo(archivo)

  when "7"
    # Salir del programa
    puts "Saliendo del programa..."
    break

  else
    # Mensaje si el usuario entra una opcion incorrecta
    puts "Opcion invalida. Intente de nuevo."
  end
end
