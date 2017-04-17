alfabeto = ["a","b"]

class AFND
	attr_accessor :alfabeto
	def initialize alfabeto 
		@alfabeto = alfabeto
		@index = 0
		@nodo = 0
		@nodoaux = 0
	end
	def validarAlfabeto  l1
		print "la palabra: #{l1}"
		l1.split("").each do |x|
			if @alfabeto.include? x 
				puts x+" es valido"
			else 
				abort x+" no es valido"
			end
		end
		return l1
	end
	def automata  l1
		$ins.nodo0 @index, @nodo, l1
	end
	def nodo0  index, nodo, l1 
		puts "Nodo actual "+@nodo.to_s
		if l1[index] == "a"
			nodo = 0
			nodoaux = 3
			puts "\n"
			puts "Entrada: #{l1[index]}. La secuencia es correcta\n\t q#{nodo} -> q#{nodoaux}"
			index = index +1
			puts "palabra[ #{index}]"

			if index >= l1.length
				abort "\nEl lenguaje no es valido"
			elsif index == 1
				$ins1.nodo3 index, nodoaux, l1 
			else
				$ins1.nodo3 index, nodoaux, l1
				$ins.nodo0 index, nodo. l1
			end
		end

		if l1[index] == "b"
			nodo = 0
			nodoaux = 1
			puts "\n"
			puts "Entrada: #{l1[index]}. La secuencia es correcta\n\t q#{nodo} -> q#{nodoaux}"
			index = index +1
			puts "palabra[ #{index}]"

			if index >= l1.length
				abort "\nEl lenguaje no es valido"
			else
				$ins1.nodo1 index, nodoaux, l1
				$ins.nodo0 index, nodo, l1
			end
		end
	end
	def nodo1  index, nodo, l1 
		puts "Nodo actual "+nodo.to_s

		if l1[index] == "b"
			nodoaux = 2
			puts "\n"
			puts "Entrada: #{l1[index]}. La secuencia es correcta\n\t q#{nodoaux}"
			index = index +1
			puts "palabra[ #{index}]"

			if index >= l1.length
				abort "\nEl lenguaje es valido"
			else
				$ins.nodo2 index, nodo, l1
			end
		end
		if l1[index] == "a"
			nodo = 0
			if index >= l1.length
				abort "\nEl lenguaje no es valido"
			elsif index == 1
				$ins1.nodo3 index, nodoaux, l1 
			else
				puts "fin de hilo"
				$ins.nodo0 index, nodo. l1
			end
		end
	end
	def nodo2  index, nodo, l1 
		puts "Nodo actual "+nodo.to_s

		if l1[index] == "a"
			nodoaux = 2
			puts "\n"
			puts "Entrada: #{l1[index]}. La secuencia es correcta\n\t q#{nodo} -> q#{nodoaux}"
			index = index +1
			puts "palabra[ #{index}]"
			if index >= l1.length
				abort "\nEl lenguaje es valido"
			else
				$ins.nodo2 index, nodo, l1
			end
		elsif l1[index] == "b"
			nodoaux = 2
			puts "\n"
			puts "Entrada: #{l1[index]}. La secuencia es correcta\n\t q#{nodoaux}"
			index = index +1
			puts "palabra[ #{index}]"

			if index >= l1.length
				abort "\nEl lenguaje es valido"
			else
				$ins.nodo2 index, nodo. l1
			end
		end
	end
	def nodo3  index, nodo, l1 
		puts "Nodo actual "+nodo.to_s

		if l1[index] == "a"
			nodoaux = 4
			nodo = 0
			puts "\n"
			puts "Entrada: #{l1[index]}. La secuencia es correcta\n\t q#{nodoaux}"
			index = index +1
			puts "palabra[ #{index}]"
			if index >= l1.length
				abort "\nEl lenguaje es valido"
			else
				$ins.nodo4 index, nodo, l1
			end
		elsif l1[index] == "b"
			nodo = 0
			if index >= l1.length
				abort "\nEl lenguaje no es valido"
			else
				puts "Fin del hilo"
				$ins.nodo0 index, nodo. l1
			end
		end
	end
	def nodo4  index, nodo, l1 
		puts "Nodo actual "+nodo.to_s

		if l1[index] == "a"
			nodoaux = 4
			puts "\n"
			puts "Entrada: #{l1[index]}. La secuencia es correcta\n\t q#{nodoaux}"
			index = index +1
			puts "palabra[ #{index}]"
			if index >= l1.length
				abort "\nEl lenguaje es valido"
			else
				$ins.nodo2 index, nodo, l1
			end
		elsif l1[index] == "b"
			nodoaux = 4
			puts "\n"
			puts "Entrada: #{l1[index]}. La secuencia es correcta\n\t q#{nodoaux}"
			index = index +1
			puts "palabra[ #{index}]"

			if index >= l1.length
				abort "\nEl lenguaje es valido"
			else
				$ins.nodo2 index, nodo. l1
			end
		end
	end
end

$ins = AFND.new(alfabeto)
$ins1 = AFND.new(alfabeto)

puts "ingresa una palabra"
aux = gets.chomp
lenguaje1 = $ins.validarAlfabeto(aux)
$ins.automata(lenguaje1)