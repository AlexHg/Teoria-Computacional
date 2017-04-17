def is_array(a)
    a.class == Array
end
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
			if not is_array(@ww) 
				if @hash[@state][@ww.to_s]
					@is = true
					@state = @hash[@state][@ww.to_s]
					print " -> "+@state

					else
						@ww.each do |w2|
							@ww2 = w2 
							@ww2 = "@" if is_number?(@ww2) && mode == "digit"
							if @hash[@state][@ww2]
								@is = true
								@state = @hash[@state][@ww2]
								print " -> "+@state
								break
							else
								@is = false
							end
						end

				
				else
					@is = false
					break
				end
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
			"q0" => {"a" => (["q0","q3"]), "b" => ["q0", "q1"]},
			"q1" => {"a" => "q2"},
			"q2" => {"a" => "q2", "b" => "q2"},
			"q3" => {"a" => "q4"},
			"q4" => {"a" => "q4", "b" => "q4"}
		}, ["q2","q4"], "@( @*,( (.,@)|( .,@,E,(-|+|@),@ ) ) )");
puts "\n\nA)\n\n"
inciso_a.verificar 'aaabbbaabaa', "normal"
puts "\n\n\n"
inciso_a.verificar 'aab', "normal"
puts "\n\n\n"
inciso_a.verificar 'aaaaa', "normal"
puts "\n\n\n"
inciso_a.verificar 'baab', "normal"
