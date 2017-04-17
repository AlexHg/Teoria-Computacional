class Lenguaje
	attr_accessor :alfabeto, :simbolos	
	def initialize inicio, fin, extra
		@alfabeto = create_alphabet(inicio,fin).to_a-@true_simbolos.to_a
		@true_simbolos = ("!".."/").to_a|(":".."@").to_a|("[".."'").to_a|("{".."~").to_a
		@simbolos = add_to_alphabet(extra)&@true_simbolos;
		while @alfabeto.length < 5
			print "\n\nERROR: El alfabeto tiene que ser de almenos 5 caracteres, porfavor ingrese nuevos caracteres separados por comas (Si ya ha agregado nuevos caracteres y el error persiste es posible que los caracteres ingresados ya se encuentren dentro del alfabeto)\nIngrese los nuevos caracteres:"
			chars = gets.chomp
			@alfabeto |= add_to_alphabet(chars.split(","))-@true_simbolos
		end
		while @simbolos.length < 5
			print "\n\nERROR: El alfabeto tiene que ser de almenos 5 simbolos, porfavor ingrese nuevos caracteres separados por comas (Si ya ha agregado nuevos caracteres y el error persiste es posible que los caracteres ingresados ya se encuentren dentro del alfabeto)\nIngrese los nuevos caracteres:"
			chars = gets.chomp
			@simbolos |= add_to_alphabet(chars.split(","))&@true_simbolos
		end
	end
	def on_alphabet? word
		@alfabeto.length == (@alfabeto | (word.to_s).split("")).length
	end
	def create_alphabet inicio , fin
		alfabeto = []
		if (inicio.instance_of?(String) || inicio.instance_of?(Fixnum)) && (fin.instance_of?(String) || fin.instance_of?(Fixnum))
			if (inicio.class == fin.class)
				(inicio..fin).each do
					|i| alfabeto << i
				end
			elsif inicio.instance_of?(Fixnum) && inicio < 10
				(inicio..9).each do
					|i| alfabeto << i.to_s
				end
				if fin.instance_of?(String) 
					('a'..fin).each do
						|i| if !alfabeto.include?(i.to_s) 
							alfabeto << i
						end
					end
				end
			elsif inicio.instance_of?(String) && inicio < 'aa'
				(inicio..'z').each do
					|i| alfabeto << i
				end
				if fin.instance_of?(Fixnum)
					(0..fin).each do
						|i| if !alfabeto.include?(i.to_s) 
							alfabeto << i.to_s
						end
					end
				end
			end
			alfabeto
		else
			puts "No se pueden usar otros tipos de datos que no sean alfanumericos enteros"
		end
	end
	def add_to_alphabet array
		agregados = []
		array.each do
			|i| agregados << i
		end
		agregados
	end
	def show_alphabet
		alfabeto_to_print = String.new
		alfabeto.each do |char|
			alfabeto_to_print += "#{char} "
		end
		simbolos.each do |char|
			alfabeto_to_print += "#{char} "
		end
		alfabeto_to_print
	end
	def alphabet_derived length, pre
		if length == 0
			[]
		end
		@new_alphabet = Array.new
		@alfabeto.each do |a|
			@new_pre = pre+a
			if(pre).length>=length || length == 1
				@new_alphabet << @new_pre 
			end
			@new_alphabet += alphabet_derived(length-1, @new_pre)

		end 
		@new_alphabet.sort
	end
	def alphabet_random
		new_alphabet = Array.new
		(0..rand(3..@simbolos.length-1)).each do |s|
			random_char = rand(0..@simbolos.length-1)
			if not new_alphabet.include? @simbolos[random_char]
				new_alphabet << @simbolos[random_char]
				#puts @simbolos[random_char]
			end
		end
		(0..rand(1..@alfabeto.length-1)).each do |r|
			random_char = rand(0..@alfabeto.length-1)
			if not new_alphabet.include? @alfabeto[random_char]
				new_alphabet << @alfabeto[random_char]
				#puts @alfabeto[random_char]
			end
		end
		new_alphabet
	end
end

lang = Lenguaje.new 2, "k", ["{","}",";","+",".","_"]

# g
	## Imprime alfabeto generado

puts "\n\t__________________________\n\tInciso A)\n\t__________________________\n"
puts "Alfabeto:"
puts lang.show_alphabet
puts "\n\n"

l1 = lang.alphabet_random
l2 = lang.alphabet_random

def palabras lang
	palabras = Array.new
	(0..rand(3..10)).each do 
		palabra = String.new
		(0..rand(2..lang.length-1)).each do |i|
			palabra += lang[rand(0..lang.length-1)]
		end
		palabras << palabra
	end
	return palabras
end

l1_palabras = palabras l1
l2_palabras = palabras l2

puts "Lenguaje 1"
print l1 
puts "\n\n"

puts "Lenguaje 2"
print l2
puts "\n"

puts "\n\nPalabras l1"
print l1_palabras
puts "\n\nPalabras l2"
print l2_palabras
puts "\n\n"

def concatenar l1, l2 
	l3 = Array.new
	(0..l1.length-1).each do |i|
		(0..l2.length-1).each do |j|
			l3 << l1[i].to_s+l2[j].to_s
		end
	end
	return l3
end

lu = l1_palabras|l2_palabras
ls = l1_palabras+l2_palabras
lc = concatenar l1_palabras, l2_palabras
li = l1_palabras&l2_palabras
ld1 = l1_palabras.to_a-l2_palabras.to_a
ld2 = l2_palabras.to_a-l1_palabras.to_a

puts "Union de lenguaje 1 y 2"
print lu 
puts "\n\n"

puts "Concatenacion de lenguajes 1 y 2"
print lc
puts "\n\n"

puts "Interseccion de lenguajes 1 y 2"
print li
puts "\n\n"


def potencia length, pre, lang
	if length == 0
		return []
	end
	new_alphabet = Array.new
	lang.each do |a|
		new_pre = pre+a
		if(pre).length>=length || length == 1
			new_alphabet << new_pre 
		end
		new_alphabet += potencia(length-1, new_pre, lang)
	end 
	return new_alphabet
end
puts "Elige el lenguaje que quieras sacar potencia (1/2)"
op = gets.to_i
puts "elige la potencia a la que L"+op.to_s+" se multiplicara"
z3 = gets.to_i
w1 = []
if op == 1
	w1 = l1_palabras 
elsif op == 2
	w1 = l2_palabras
end
if(z3 >= 0 && z3 <= 5)
	print potencia z3,"",w1
elsif z3 < 0 && z3 >= -5
	print potencia -z3,"",(w1).reverse
else 
	puts "El rango de la multiplicacion tiene que se de -5 a 5"
end

puts "\n\nl1 - l2"
print ld1
puts "\n\nl2 - l1"
print ld2

def create_curp name, last_name, last_name_two, day, month, year, lang 
	curp = String.new
	curp += last_name[0,2] + last_name_two[0] + name[0] + year.to_s[2,3] + month.to_s[0,2] + day.to_s[0,2]
	(0..7).each do |i|
		curp += lang.alfabeto[rand(0..lang.alfabeto.length-1)]
	end
	curp.upcase
end


def gen_curp 
	letras = ("A".."Z").to_a
	numeros = ("0".."9").to_a
	genero = ["H","M"]
	entidad = ["AS","BC","BS","CC","CS","CH","CL","CM","DF","DG","GT","GR","HG","JC","MC","MN","MS","NT","NL","OC","PL","QT","QR","SP","SL","SR","TC","TS","TL","VZ","YN","ZS"]
	curp = ""
	(0..3).each do
		curp += letras[rand(0..letras.length-1)]
	end
	curp += rand(30..99).to_s
	num = rand(1..12).to_s
	if num.length == 1
		num = "0"+num
	end
	curp += num
	curp += rand(1..31).to_s
	curp += genero[rand(0..1)]
	curp += entidad[rand(0..entidad.length-1)]
	(0..3).each do
		curp += letras[rand(0..letras.length-1)]
	end
	curp += "0"+numeros[rand(0..numeros.length-1)]
end
curp1 = gen_curp
puts "\n\n\nCURP GENERADO"
puts curp1