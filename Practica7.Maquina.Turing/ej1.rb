load 'maquina_de_turing.rb'

unless ARGV.size == 1
	STDERR.puts "Porfavor agregue un argumento de ejecución.\nUSO: ruby mt1.rb <Palabra>"
	exit(-1)
end


# *5.1. Diseñe una máquina de Turing que acepte el lenguaje regular a* sobre S ={a, b}, pero que rechace las cadenas que no pertenecen al lenguaje por medio de un bucle infinito.
# 		Q ={q1, q2, q3}, S ={a, b}, G ={a, b, B}, F ={q3}, q0 =q1 y d


Leer más: http://www.monografias.com/trabajos16/automatas-y-gramaticas/automatas-y-gramaticas.shtml#ixzz4AU8RCfxD

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