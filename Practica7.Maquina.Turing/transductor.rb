load 'maquina_de_turing.rb'

unless ARGV.size == 1
	STDERR.puts "Porfavor agregue un argumento de ejecución.\nUSO: ruby mt1.rb <Palabra>"
	exit(-1)
end


# Diseñar una Máquina de Turing que calcule el complemento a 1 de un número 
# 	binario. (Es decir, que sustituya los 0’s por 1’s y los 1’s por 0’s).

# Mapea los caracteres del primer argumento de ejecución y los transforma en simbolos
cadena = ARGV.first.split(//).map{ |ch| ch.intern }

maquina = MaquinaDeTuring.new
maquina.estado_inicial = :q0
maquina.estado_de_aceptacion << :q2
maquina.transiciones[[:q0,:a]] = [:q0,:a,:derecha]
maquina.transiciones[[:q0,:b]] = [:q1,:b,:derecha]
maquina.transiciones[[:q0,:B]] = [:q2,:B,:derecha]
maquina.transiciones[[:q1,:a]] = [:q1,:a,:derecha]
maquina.transiciones[[:q1,:b]] = [:q1,:b,:derecha]
maquina.transiciones[[:q1,:B]] = [:q1,:B,:derecha]


# Define mapa de ruteo
mapa = {
	:blanco => '#',
	:a     => 'a',
	:b     => 'b',
	:B 		=> 'B'
}

# Simulacion
maquina.simular(cadena, mapa)