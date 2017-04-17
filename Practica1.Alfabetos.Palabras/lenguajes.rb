# encoding: UTF-8
class Lenguaje
	attr_accessor :alfabeto
	def initialize inicio, fin, extra
		@alfabeto = create_alphabet(inicio,fin)
		@alfabeto |= add_to_alphabet(extra);
		while @alfabeto.length < 5
			print "\n\nERROR: El alfabeto tiene que ser de almenos 5 caracteres, porfavor ingrese nuevos caracteres separados por comas (Si ya ha agregado nuevos caracteres y el error persiste es posible que los caracteres ingresados ya se encuentren dentro del alfabeto)\nIngrese los nuevos caracteres:"
			chars = gets.chomp
			@alfabeto |= add_to_alphabet(chars.split(","))
		end
	end
	def on_alphabet? word
		return @alfabeto.length == (@alfabeto | (word.to_s).split("")).length
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
			return alfabeto
		else
			puts "No se pueden usar otros tipos de datos que no sean alfanumericos enteros"
		end
	end
	def add_to_alphabet array
		agregados = []
		array.each do
			|i| agregados << i
		end
		return agregados
	end
	def show_alphabet
		alfabeto_to_print = String.new
		alfabeto.each do |char|
			alfabeto_to_print += "#{char} "
		end
		return alfabeto_to_print
	end
	def alphabet_derived length, pre
		if length == 0
			return []
		end
		@new_alphabet = Array.new
		@alfabeto.each do |a|
			@new_pre = pre+a
			if(pre).length>=length || length == 1
				@new_alphabet << @new_pre 
			end
			@new_alphabet += alphabet_derived(length-1, @new_pre)

		end 
		return @new_alphabet.sort
	end
	def suffix_of word
		@word = ("¿"+word)
		temp = ""
		(0..@word.length-1).each do |i|
			temp += @word[0..i]+", "
		end
		return temp
	end
	def prefix_of word
		@word = (word+"¿")
		temp = ""
		(1..@word.length).each do |i|
			temp += @word[(@word.length-i)..@word.length]+", "
		end
		return temp
	end
	def is_suffix? word, word2
		@suffixes = "¿"+word2
		temp_suff = []
		@word = "¿"+word
		(0..@suffixes.length-1).each do |i|
			temp_suff << @suffixes[0..i]
		end
		return temp_suff.include? @word
	end
	def is_prefix? word, word2
		@prefixes = word2+'?'
		temp_pre = []
		@word = word+'?'
		(1..@prefixes.length).each do |i|
			temp_pre << @prefixes[(@prefixes.length-i)..@prefixes.length]
		end
		return temp_pre.include? @word
	end
	def own_suffix_of word
		@word = word
		temp = ""
		(0..@word.length-2).each do |i|
			temp += @word[0..i]+", "
		end
		return temp
	end
	def own_prefix_of word
		@word = word
		temp = ""
		(1..@word.length-1).each do |i|
			temp += @word[(@word.length-i)..@word.length]+", "
		end
		return temp
	end
	def is_own_suffix? word, word2
		@suffixes = word2
		temp_suff = []
		@word = word
		(0..@suffixes.length-2).each do |i|
			temp_suff << @suffixes[0..i]
		end
		return temp_suff.include? @word
	end
	def is_own_prefix? word, word2
		@prefixes = word2
		temp_pre = []
		@word = word
		(1..@prefixes.length-1).each do |i|
			temp_pre << @prefixes[(@prefixes.length-i)..@prefixes.length]
		end
		return temp_pre.include? @word
	end
end

# Inciso A)
	# argumentos: inicio, final, extras

lang = Lenguaje.new "0", "a", ["O","i","I"]

	## Imprime alfabeto generado
puts "\n\t__________________________\n\tInciso A)\n\t__________________________\n"
puts "Alfabeto:"
puts lang.show_alphabet


# Inciso B)
puts "\n\t__________________________\n\tInciso B)\n\t__________________________\n"
puts "\nIngrese W1:"
w1 = gets.chomp
puts "\nIngrese W2:"
w2 = gets.chomp

# Inciso C)
puts "\n\t__________________________\n\tInciso C)\n\t__________________________\n"
puts "\nIngrese z para (W1W2)^z"
z1 = gets.to_i
if(z1 >= 0)
	puts " (W1W2)^z: "+((w1+w2)*z1)
	# Inciso D)
	puts "\n\t__________________________\n\tInciso D)\n\t__________________________\n"
	puts "|(W1W2)^z|: "+(((w1+w2)*z1).length).to_s
elsif z1 < 0
	puts " (W1W2)^z: "+((w1+w2).reverse)*(-z1)
	# Inciso D)
	puts "\n\t__________________________\n\tInciso D)\n\t__________________________\n"
	puts "|(W1W2)^z|: "+(((w1+w2)*(-z1)).length).to_s
end


# Inciso E)
puts "\n\t__________________________\n\tInciso E)\n\t__________________________\n"
begin
	print "Ingrese un caracter x perteneciente al alfabeto para |W1|x: "
	x1 = gets.chomp
end while not lang.on_alphabet? x1.to_s
puts "\nW1 contiene "+(w1.count(x1)).to_s+" '#{x1}'"

# Inciso F)
puts "\n\t__________________________\n\tInciso F)\n\t__________________________\n"
puts "\nIngrese z para W1^z"
z3 = gets.to_i
if(z3 >= 0)
	puts w1*z3
elsif z3 < 0
	puts (w1).reverse*(-z3)
end

# Inciso G)
puts "\n\t__________________________\n\tInciso G)\n\t__________________________\n"
puts "\nIngrese W3: "
w3 = gets.chomp

if lang.on_alphabet? w3 
	puts "La cadena es valida para este alfabeto" 
else 
	puts "La cadena NO es valida para este alfabeto"
end

# Inciso H) 
puts "\n\t__________________________\n\tInciso H)\n\t__________________________\n"
puts "\nIngrese una cadena, se verificará si es sufijo y/o prefijo de W1"
w4 = gets.chomp
if lang.is_suffix? w4, w1
	print "\n"+w4.to_s+" es un sufijo "
	if lang.is_own_suffix? w4, w1
		print "propio de w1\n"
	end
elsif lang.is_prefix? w4, w1
	print "\n"+w4.to_s+" es un prefijo "
	if lang.is_own_prefix? w4, w1
		print "propio de w1\n"
	end
else
	puts "NO ES NI SUFIJO NI PREFIJO"
end
puts "\n"
	

# Inciso I)
puts "\n\t__________________________\n\tInciso I)\n\t__________________________\n"
	##Sufijos
puts "\nSufijos de W1 (¿ = lambda)"
puts lang.suffix_of w1
	##Prefijos
puts "\nPrefijos de W1 (¿ = lambda)"
puts lang.prefix_of w1
	##Sufijos Propios
puts "\nSufijos propios"
puts lang.own_suffix_of w1
	##Prefijos Propios
puts "\nPrefijos propios"
puts lang.own_prefix_of w1
	
# Inciso J)
puts "\n\t__________________________\n\tInciso J)\n\t__________________________\n"
puts "\nIngrese n para generar un alfabeto derivado"
n = gets.to_i
(lang.alphabet_derived n,"").each do |i|
	print (i.sub(" ","{esp}")).to_s+", "
end