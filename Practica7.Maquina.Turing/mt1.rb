load 'maquina_de_turing.rb'

unless ARGV.size == 1
	STDERR.puts "Porfavor agregue un argumento de ejecución.\nUSO: ruby mt1.rb <Palabra>"
	exit(-1)
end
# Mapea los caracteres del primer argumento de ejecución y los transforma en simbolos
cadena = ARGV.first.split(//).map{ |ch| ch.intern }

maquina = MaquinaDeTuring.new
maquina.estado_inicial = :q0
maquina.estado_de_aceptacion << :q4
maquina.transiciones[[:q0,:a]] = [:q1,:X,:derecha]
maquina.transiciones[[:q0,:Y]] = [:q3,:Y,:derecha]
maquina.transiciones[[:q1,:a]] = [:q1,:a,:derecha]
maquina.transiciones[[:q1,:b]] = [:q2,:Y,:izquierda]
maquina.transiciones[[:q1,:Y]] = [:q1,:Y,:derecha]
maquina.transiciones[[:q2,:a]] = [:q2,:a,:izquierda]
maquina.transiciones[[:q2,:X]] = [:q0,:X,:derecha ]
maquina.transiciones[[:q2,:Y]] = [:q2,:Y,:izquierda ]
maquina.transiciones[[:q3,:Y]] = [:q3,:Y,:derecha ]
maquina.transiciones[[:q3,:a]] = [:q4,:X,:derecha ]


# Define mapa de ruteo
mapa = {
	:blanco => '#',
	:a     => 'a',
	:b     => 'b',
	:X     => 'X',
	:Y     => 'Y',
}

# Simulacion
maquina.simular(cadena, mapa)