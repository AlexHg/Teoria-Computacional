class AStack
	attr_accessor :cinta_entrada, :stack 
	def initialize rules, lang, states_desc
		@unionRules
		@rules = rules
		@lang = lang
		@states_desc = states_desc
		@stack = Array.new
		@valid = true
		@union = false
		puts "Se ha descrito un nuevo automata de pila para el lenguaje #{@lang}"
	end
	def show_stack
		#puts "\nPILA:"
		#puts @stack
		if @stack.length == 0 
			#puts "Pila vacia"
			#puts
			return true
		else
			#puts "\n"
			return false
		end
	end
	def unionRules rules, type, states_desc
		@unionRules = rules
		@union = true
		@stackType = type
	end
	def unionValidate cinta_entrada
		begin
			puts "ENTRO A UNIONVALIDATE"
			@state = 0
			@stack = Array.new
			@stack.push "z0"
			@cinta_entrada = cinta_entrada.split("")
			@valid = true 
			#puts "_____________________________________"
			#puts "ESTADO: #{@state}, ENTRADA: sin entrada"
			show_stack
			count_a = 0
			count_b = 0
			@cinta_entrada.each do |l|
				if l == "a"
					count_a = count_a + 1
				end
				if l == "b"
					count_b = count_b + 1
				end
								
				#show_stack
				#puts @stack.last
				#puts @rules[@state][l][@stack.last]

				if @unionRules[@state][l].nil? && !@unionRules[@state+1][l].nil? 
					@state = @state + 1
				elsif @unionRules[@state][l].nil? && @unionRules[@state+1][l].nil?
					puts "RESULTADO: La palabra no es valida"
					return
				end
				
				to_stack = @unionRules[@state][l][@stack.last]
				if (defined? to_stack || defined? @unionRules[@state][l]["x*2"]) && (to_stack != "#") && (to_stack != "=")
					#puts @unionRules[0]["a"]["x*2"]
					if count_a%2 != 0 && count_a > count_b
						@stack.push to_stack
					elsif count_b%2 != 0 && count_a < count_b
					end
					if @states_desc[@state] != "*"
						@state = @state + 1
					end
				elsif to_stack == "#"
					@stack.pop
				elsif !defined? to_stack
					@valid = false
				end

				#puts "\n_____________________________________"
				#puts "ESTADO: #{@state}, ENTRADA: #{l}"
				show_stack
			end
			if @valid
				@stack.reverse_each do |top|
					unless @unionRules[@state]["#"].nil?
						if @unionRules[@state]["#"][top] == "#"
							@stack.pop
							#puts "\n_____________________________________"
							#puts "ESTADO: #{@state}, ENTRADA: #"		
						end
					else 
						puts "RESULTADO: La palabra no es valida"
						return
					end
					if @stack.length != 0 
						show_stack
					end
				end
				if show_stack
					puts "RESULTADO: La palabra es valida"
				else
					puts "RESULTADO: La palabra no es valida"
					return
				end
			end
		rescue
			puts "RESULTADO: La palabra no es valida"
			return
		end
	end
	def validate cinta_entrada
		begin 
			puts "\nPalabra ingresada: #{cinta_entrada}"
			@state = 0
			@stack = Array.new
			@stack.push "z0"
			@cinta_entrada = cinta_entrada.split("")
			@valid = true
			#puts "_____________________________________"
			#puts "ESTADO: #{@state}, ENTRADA: sin entrada"
			#show_stack
			@cinta_entrada.each do |l|

				#show_stack
				#puts @stack.last
				#puts @rules[@state][l][@stack.last]

				if @rules[@state][l].nil? && !@rules[@state+1][l].nil? 
					@state = @state + 1
				elsif @rules[@state][l].nil? && @rules[@state+1][l].nil?
					if not @union 
						puts "RESULTADO: La palabra no es valida"
						return
					else
						unionValidate cinta_entrada
						return
					end
				end
				
				to_stack = @rules[@state][l][@stack.last]
				if (defined? to_stack) && (to_stack != "#") && (to_stack != "=")
					@stack.push to_stack
					if @states_desc[@state] != "*"
						@state = @state + 1
					end
				elsif to_stack == "#"
					@stack.pop
				elsif !defined? to_stack
					@valid = false
				end

				#puts "\n_____________________________________"
				#puts "ESTADO: #{@state}, ENTRADA: #{l}"
				#show_stack
			end
			if @valid
				@stack.reverse_each do |top|
					unless @rules[@state]["#"].nil?
						if @rules[@state]["#"][top] == "#"
							@stack.pop
							#puts "\n_____________________________________"
							#puts "ESTADO: #{@state}, ENTRADA: #"		
						end
					else 
						if not @union 
							puts "RESULTADO: La palabra no es valida"
							return
						else
							unionValidate cinta_entrada
							return
						end
					end
					if @stack.length != 0 
						#show_stack
					end
				end
				if show_stack
					puts "RESULTADO: La palabra es valida"
				else
					if not @union 
						puts "RESULTADO: La palabra no es valida"
						return
					else
						unionValidate cinta_entrada
						return
					end
				end
			end
		rescue
			if not @union 
				puts "RESULTADO: La palabra no es valida"
				return
			else
				unionValidate cinta_entrada
				return
			end
		end
	end
end 
=begin 
{"<caracter de la cinta de ingreso>" => {"<tope en pila>" => "<se agrega como tope(si tiene # se elimina, si tiene = lo deja como esta)>", "<tope en pila>" => "<se agrega como tope (si tiene # se elimina, si tiene = lo deja como esta)>"}} ----- Estado q0
=end 

puts "\ninciso A"
lang1 = AStack.new([
	{
		"a" => {"z0" => "x", "x" => "x"},
		"b" => {"z0" => "x", "x" => "x"}
	},
	{
		"c" => {"z0" => "y", "x" => "y"},
		"#" => {"y" => "#",  "x" => "#", "z0" => "#"}
	},
	{
		"a" => {"y" => "#",  "x" => "#", "z0" => "="},
		"b" => {"y" => "#",  "x" => "#", "z0" => "="},
		"#" => {"y" => "#",  "x" => "#", "z0" => "#"}
	}
], "L1 = {WcW ^-1} | W ج {a,b}*}", ["*", "", "*"])

lang1.validate "aa"
puts "_________________________________________________\n"
lang1.validate "aac"
puts "_________________________________________________\n"
lang1.validate "abbbbaaaac"
puts "_________________________________________________\n"
lang1.validate "aka"
puts "_________________________________________________\n"
lang1.validate "caa"
puts "_________________________________________________\n"
lang1.validate "bacb"
puts "_________________________________________________\n"
lang1.validate "aacc"
puts "_________________________________________________\n"


puts "\ninciso B"
lang2 = AStack.new([
	{
		"a" => {"z0" => "x", "x" => "x"},
	},
	{
		"b" => {"z0" => "y", "x" => "y"},
	},
	{
		"c" => {"y" => "#",  "x" => "#", "z0" => "="},
		"#" => {"z0" => "#"}
	}
], "L2 = { a^i b c^k | i, k ≥ 1 y i < k } ", ["*", "", "*"])

lang2.validate "aaabcccc"
puts "_________________________________________________\n"
lang2.validate "abccc"
puts "_________________________________________________\n"
lang2.validate "bc"
puts "_________________________________________________\n"
lang2.validate "aaabbcccc"
puts "_________________________________________________\n"
lang2.validate "bb"
puts "_________________________________________________\n"
lang2.validate "aaacccc"
puts "_________________________________________________\n"



puts "\ninciso C"
lang3 = AStack.new([
	{
		"0" => {"z0" => "x", "x" => "x"},
		"3" => {"z0" => "k", "k" => "k"},
		"#" => {"k" => "#", "z0" => "#"}
	},
	{
		"1" => {"x" => "#", "z0" => "y"}
	},
	{
		"2" => {"y" => "#", "z0" => "w"}
	},
	{
		"3" => {"z0" => "k", "k" => "k"},
		"#" => {"k" => "#", "z0" => "#"}
	},
	{
		"#" => {"k" => "#", "z0" => "#"}
	}
], "L3 = { 0^i 1^i+k 2^k 3^n+1 | i, k, n ≥ 0 } ", ["*", "*", "*", "*", "*"])
#lang3.ent_jumping true

lang3.validate "01122333"
puts "_________________________________________________\n"
lang3.validate "0112333"
puts "_________________________________________________\n"
lang3.validate "01123"
puts "_________________________________________________\n"
lang3.validate "12333"
puts "_________________________________________________\n"
lang3.validate "11333"
puts "_________________________________________________\n"
lang3.validate "333"
puts "_________________________________________________\n"


puts "\ninciso D"
lang4 = AStack.new([
	{
		"a" => {"z0" => "x", "x" => "x"}
	},
	{
		"b" => {"x" => "x", "z0" => "x"}
	},
	{
		"c" => {"x" => "#", "z0" => "y"},
		"#" => {"z0" => "#"}
	},
	{
		"#" => {"k" => "#", "z0" => "#"}
	}
], "L4 = { a^m b^p c^(p+m)| m, p ≥ 1} U {a^2i b^i | i ≥1} ", ["*", "*", "*", "*", "*"])
lang4.unionRules [
	{
		"a" => {"z0" => "x", "x" => "x", "x*2" => "="}
	},
	{
		"b" => {"x" => "#", "z0" => "y"},
		"#" => {"z0" => "#"}
	}
], "ND", ["*", "*"]
#lang3.ent_jumping true

lang4.validate "aabbbccccc"
puts "_________________________________________________\n"
lang4.validate "abcc"
puts "_________________________________________________\n"
lang4.validate "aab"
puts "_________________________________________________\n"
lang4.validate "aaaabb"
puts "_________________________________________________\n"
lang4.validate "aaaaabb"
puts "_________________________________________________\n"
lang4.validate "aabcccc"
puts "_________________________________________________\n"


puts "\ninciso E"
lang5 = AStack.new([
	{
		"a" => {"z0" => "x", "x" => "x"}
	},
	{
		"b" => {"x" => "x", "z0" => "x"}
	},
	{
		"c" => {"x" => "#", "z0" => "y"},
		"#" => {"z0" => "#"}
	},
	{
		"#" => {"k" => "#", "z0" => "#"}
	}
], "L5 = { a^m b^p c^(p+m)| m, p ≥ 1} U {a^i b^2i | i ≥1} ", ["*", "*", "*", "*", "*"])
lang5.unionRules [
	{
		"a" => {"z0" => "x", "x" => "x"}
	},
	{
		"b" => {"x" => "#", "z0" => "y", "x*2" => "="},
		"#" => {"z0" => "#"}
	}
], "ND", ["*", "*"]
#lang3.ent_jumping true

lang5.validate "aabbbcccccc"
puts "_________________________________________________\n"
lang5.validate "abcc"
puts "_________________________________________________\n"
lang5.validate "aaab"
puts "_________________________________________________\n"
lang5.validate "aabbbb"
puts "_________________________________________________\n"
lang5.validate "abb"
puts "_________________________________________________\n"
lang5.validate "aabcccc"
puts "_________________________________________________\n"
