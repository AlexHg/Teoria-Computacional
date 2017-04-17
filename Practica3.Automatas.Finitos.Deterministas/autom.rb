class AFD
	attr_accessor :hash
	def initialize hash, fin, expresion
		@hash = hash
		@fin = fin 
		@is = false
		@expresion = expresion
		puts "Se ha creado un nuevo AFD"
		puts "\nEspresión regular: "+@expresion+"\n"
	end
	def is_number? string
	  true if Float(string) rescue false
	end
	def verificar_01 word 
		puts word
		if word.count("0") == word.count("1")
			puts "si es igual el numero de 0 que de 1"
		else
			puts "No es igual el numero de 0 y 1"
		end
	end
	def verificar word, mode
		#@edo_actual = @hash["q0"]
		@is = false
		@finis = false
		@state = "q0"
		print "State log:\n -> q0"
		word.split("").each do |w|
			@ww = w 
			@ww = "@" if is_number?(@ww) && mode == "digit" 
			if @hash[@state][@ww]
				@is = true
				@state = @hash[@state][@ww]
				print " -> "+@state
			else
				@is = false
				break
			end
		end
		puts "\n\nWord: "+word
		@fin.each do |l|
			@finis = true if @state == l
		end
		if @is && @finis
			puts "\nState: Es una palabra valida"
		else 
			puts "\nState: No es una palabra valida"
		end
		return @is
	end
end
puts "\n\n\n"
inciso_a = AFD.new({
			"q0" => {"@" => "q1"},
			"q1" => {"@" => "q1", "." => "q2", "E" => "q4"},
			"q2" => {"@" => "q3"},
			"q3" => {"@" => "q3", "E" => "q4"},
			"q4" => {"+" => "q5", "-" => "q5", "@" => "q6"},
			"q5" => {"@" => "q6"},
			"q6" => {"@" => "q6"}
		}, ["q3","q6"], "@( @*,( (.,@)|( .,@,E,(-|+|@),@ ) ) )");
puts "\n\nA)\n\n"
inciso_a.verificar '031E+1', "digit"
puts "\n\n\n"
inciso_a.verificar '982.112', "digit"
puts "\n\n\n"
inciso_a.verificar '12E+.12', "digit"
puts "\n\n\n"
inciso_a.verificar '982.112E+1654.31', "digit"

puts "\n\n\n"
inciso_b = AFD.new({
			"q0" => {"b" => "q1", "a" => "q4"},
			"q1" => {"c" => "q2", "a" => "q3", "b" => "q3"},
			"q2" => {"a" => "q2", "c" => "q3", "b" => "q3"},
			"q3" => {"a" => "q3", "b" => "q3", "c" => "q3"},
			"q4" => {"c" => "q4", "a" => "q3"},
		}, ["q2","q4"], "( ac*|bca* )");
puts "\n\nB)\n\n"
inciso_b.verificar 'acccccc', "normal"
puts "\n\n\n"
inciso_b.verificar 'bcaaaaaa', "normal"
puts "\n\n\n"
inciso_b.verificar 'bcccaaaa', "normal"
puts "\n\n\n"
inciso_b.verificar 'aaaaccc', "normal"


puts "\n\n\n"
inciso_c = AFD.new({
			"q0" => {"1" => "q0", "0" => "q0"}
		}, ["q0"], "( {0n1n} n > 0 )");
puts "\n\nC)\n\n"
inciso_c.verificar_01 '0000011111'
puts "\n\n\n"
inciso_c.verificar_01 '01010101'
puts "\n\n\n"
inciso_c.verificar_01 '1101'
puts "\n\n\n"
inciso_c.verificar_01 '00111'


puts "\n\n\n"
inciso_d = AFD.new({
			"q0" => {"a" => "q1"},
			"q1" => {"a" => "q3", "b" => "q2"},
			"q2" => {"a" => "q6", "b" => "q2"},
			"q3" => {"a" => "q3", "b" => "q4"},
			"q4" => {"a" => "q5"},
			"q5" => {"a" => "q5"},
			"q6" => {"a" => "q5"}
		}, ["q5"], "a(b+a|a+b)a+");
puts "\n\nD)\n\n"
inciso_d.verificar 'abbbaa', "normal"
puts "\n\n\n"
inciso_d.verificar 'abaa', "normal"
puts "\n\n\n"
inciso_d.verificar 'abaab', "normal"
puts "\n\n\n"
inciso_d.verificar 'baabaa', "normal"


# 10 = X
puts "\n\n\n"
inciso_e = AFD.new({
			"q0" => {"1" => "q1", "2" => "q2", "5" => "q5", "X" => "q10"},
			"q1" => {"1" => "q2", "2" => "q4", "5" => "q6", "X" => "q11"},
			"q2" => {"1" => "q3", "2" => "q5", "5" => "q7", "X" => "q12"},
			"q3" => {"1" => "q4", "2" => "q6", "5" => "q8", "X" => "q12"},
			"q4" => {"1" => "q5", "2" => "q7", "5" => "q9", "X" => "q12"},
			"q5" => {"1" => "q6", "2" => "q8", "5" => "q10", "X" => "q12"},
			"q6" => {"1" => "q7", "2" => "q9", "5" => "q11", "X" => "q12"},
			"q7" => {"1" => "q8", "2" => "q10", "5" => "q12", "X" => "q12"},
			"q8" => {"1" => "q9", "2" => "q11", "5" => "q12", "X" => "q12"},
			"q9" => {"1" => "q10", "2" => "q12", "5" => "q12", "X" => "q12"},
			"q10" => {"1" => "q11", "2" => "q12", "5" => "q12", "X" => "q12"},
			"q11" => {"1" => "q12", "2" => "q12", "5" => "q12", "X" => "q12"},
			"q12" => {"1" => "q12", "2" => "q12", "5" => "q12", "X" => "q12"}
		}, ["q12"], "a(b+a|a+b)a+");
puts "\n\nE)\n\n X=10"
inciso_e.verificar 'X11', "normal"
puts "\n\n\n"
inciso_e.verificar 'X5', "normal"
puts "\n\n\n"
inciso_e.verificar '551', "normal"
puts "\n\n\n"
inciso_e.verificar 'X', "normal"
