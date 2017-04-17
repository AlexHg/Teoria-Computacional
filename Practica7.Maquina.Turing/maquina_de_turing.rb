class Estado
	attr_reader :cinta
	attr_reader :cabecera
	attr_reader :control_estado

	def initialize(estado_inicial, cadena)
		# Copia la cadena
		@cinta = cadena.dup 
		# Define inicio de la cabecera
		@cabecera = 0
		# Configura estado inicial
		@control_estado = estado_inicial
	end

	# Actualiza el estado
	def actualiza(siguiente_estado,escribir,direccion)
		raise "\n\tEstado: Palabra no valida" if siguiente_estado == :invalido
		@control_estado = siguiente_estado
		@cinta[@cabecera] = escribir
		case direccion
			when :izquierda
				raise "\n\tEstado: Palabra no valida" if @cabecera <= 0
				@cabecera -= 1
			when :derecha
				@cabecera += 1
		end
	end

	# Evita cadenas infinitas
	def ruteo(mapa)
		if @cabecera < 60
			puts " " * (@cabecera + 17) + "v"
		else
			puts
		end
		# Crea una cinta interna, que es como un mapa que va de 0 a 59 Y blanquea el espacio
		cinta = (0..60).collect{ |i| mapa[donde_esta_cinta(i)] }.join
		puts "%15s: %s" % [ @control_estado, cinta ]
	end

	# Posicion actual en x 
	def donde_esta_cinta(x)
		@cinta[x] || :H
	end

	# Simbolo actual
	def simbolo_actual;
		donde_esta_cinta(@cabecera)
	end

end

class MaquinaDeTuring
	attr_accessor :estado_inicial
	attr_reader :estado_de_aceptacion
	attr_reader :transiciones

	def initialize
		@estado_de_aceptacion = []
		@transiciones = Hash.new{ [ :invalido, :H, :izquierda, :derecha] }
	end

	# Start: Simulacion
	def simular(cadena, mapa)
		estado = Estado.new(@estado_inicial, cadena)
		estado.ruteo(mapa) 
		until @estado_de_aceptacion.include?(estado.control_estado) 
			# Retorna: arreglo de transiciones
			estado_siguiente, escribir, direccion = @transiciones[[estado.control_estado, estado.simbolo_actual]]
			begin
				# Actualizar estados
				estado.actualiza(estado_siguiente,escribir,direccion)
			rescue Exception => e
				puts e
				return
			end
			estado.ruteo(mapa)
		end
		puts "\n\tEstado: Palabra valida"
	end

end
