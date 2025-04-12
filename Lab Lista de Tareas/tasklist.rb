require 'time'

class TaskList
  def initialize
    # Arreglo para almacenar las tareas
    @tareas = []
  end

  def agregar_tarea(descripcion)
    # Validar que la descripcion no este vacia
    if descripcion.strip.empty?
      puts "La descripcion no puede estar vacia."
      return
    end

    # Crear una nueva tarea como hash
    tarea = {
      fecha_creacion: Time.now.strftime("%m/%d/%Y"), # Fecha actual
      descripcion: descripcion.strip,
      estado: "Pendiente",
      fecha_finalizacion: nil
    }

    # Agregar la tarea al arreglo
    @tareas << tarea
    puts "Tarea agregada con exito."
  end

  def marcar_completada(indice)
    # Validar que el indice este en rango
    if indice < 0 || indice >= @tareas.length
      puts "Indice invalido."
      return
    end

    tarea = @tareas[indice]

    # Verificar si ya esta completada
    if tarea[:estado] == "Completado"
      puts "La tarea ya esta completada."
      return
    end

    # Marcar como completado y guardar la fecha
    tarea[:estado] = "Completado"
    tarea[:fecha_finalizacion] = Time.now.strftime("%m/%d/%Y %H:%M:%S")

    puts "Tarea marcada como completada."
  end

  def eliminar_tarea(indice)
    # Validar que el indice este en rango
    if indice < 0 || indice >= @tareas.length
      puts "Indice invalido."
      return
    end

    tarea = @tareas[indice]
    puts "Tarea seleccionada: #{tarea[:descripcion]}"

    # Pedir confirmacion antes de eliminar
    print "Seguro que desea eliminar esta tarea? (s/n): "
    confirmacion = gets.chomp.downcase

    if confirmacion == 's'
      @tareas.delete_at(indice)
      puts "Tarea eliminada con exito."
    else
      puts "Operacion cancelada."
    end
  end

  def ver_tareas
    # Mostrar todas las tareas con su estado y fechas
    if @tareas.empty?
      puts "No hay tareas registradas."
      return
    end

    puts "Lista de tareas:\n\n"

    @tareas.each_with_index do |tarea, index|
      print "#{index}. #{tarea[:fecha_creacion]} - #{tarea[:descripcion]}: #{tarea[:estado]}"
      if tarea[:estado] == "Completado"
        print " (#{tarea[:fecha_finalizacion]})"
      end
      puts
    end
  end

  def guardar_en_archivo(nombre_archivo)
    # Guardar todas las tareas en un archivo de texto
    begin
      File.open(nombre_archivo, 'w') do |file|
        @tareas.each do |tarea|
          linea = [
            tarea[:fecha_creacion],
            tarea[:descripcion],
            tarea[:estado],
            tarea[:fecha_finalizacion]
          ].join('|')
          file.puts(linea)
        end
      end
      puts "Tareas guardadas en #{nombre_archivo}."
    rescue
      puts "Error al guardar el archivo."
    end
  end

  def cargar_desde_archivo(nombre_archivo)
    # Cargar tareas desde un archivo de texto
    if !File.exist?(nombre_archivo)
      puts "El archivo no existe."
      return
    end

    @tareas.clear

    File.foreach(nombre_archivo) do |linea|
      datos = linea.strip.split('|')
      tarea = {
        fecha_creacion: datos[0],
        descripcion: datos[1],
        estado: datos[2],
        fecha_finalizacion: datos[3]
      }
      @tareas << tarea
    end

    puts "Tareas cargadas desde #{nombre_archivo}."
  end
end
