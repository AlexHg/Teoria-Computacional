class AStack
	attr_accessor :cinta_entrada, :stack 
	def initialize rules, lang, states_desc
		@rules = rules
		@lang = lang
		@states_desc = states_desc
		@stack = Array.new
		@valid = true
		puts "Se ha descrito un nuevo automata de pila para el lenguaje #{@lang}"
	end
	def show_stack
		puts "\n"
		if @stack.length == 0 
			puts "Pila vacia"
		end
		puts @stack
		puts "\n"
	end
	def validate cinta_entrada
		@state = 0
		@stack.push "z0"
		@cinta_entrada = cinta_entrada.split("")

		@cinta_entrada.each do |l|

			puts l
			show_stack

			if @rules[@state][l].nil?
				@state = @state + 1
			end
			
			if @rules[@state][l][@stack[@stack.length-1]] == "#"
				if @states_desc[@state] != "*"
					@state = @state + 1
				end
				@stack.pop
			end
			if (defined? @rules[@state][l][@stack[@stack.length-1]]) && (@rules[@state][l][@stack[@stack.length-1]] != "#") && (@rules[@state][l][@stack[@stack.length-1]] != "=")
				begin 
					#puts @rules[@state][l][@stack[@stack.length-1]]
					@stack.push(@rules[@state][l][@stack[@stack.length-1]])
					if @states_desc[@state] != "*"
						@state = @state + 1
					end
				rescue  
				    puts 'La palabra no es valida' 
				    @valid = false
				    break
				end  
			end
		end
		if @valid
			@stack.reverse_each do |top|


				unless @rules[@rules.length-1]["#"].nil?
					if @rules[@rules.length-1]["#"][top] == "#"
						@stack.pop
						puts "#"		
					end
				end
				show_stack
			end
			show_stack
			if @stack.length == 0 
				puts "Palabra valida"
			end
		end
	end
end 
# {"<caracter de la cinta de ingreso>" => {"<tope en pila>" => "<se agrega como tope(si tiene # se elimina, si tiene = lo deja como esta)>", "<tope en pila>" => "<se agrega como tope (si tiene # se elimina, si tiene = lo deja como esta)>"}} ----- Estado q0
puts "inciso A"
lang1 = AStack.new([
	{
		"a" => {"z0" => "x", "x" => "x"},
		"b" => {"z0" => "x", "x" => "x"}
	},
	{
		"c" => {"z0" => "y", "x" => "y"}
	},
	{
		"a" => {"y" => "#",  "x" => "#", "z0" => "="},
		"b" => {"y" => "#",  "x" => "#", "z0" => "="},
		"#" => {"y" => "#",  "x" => "#", "z0" => "#"}
	}
], "L1 = {WcW ^-1} | W ج {a,b}*}", ["*", "", "*"])

lang1.validate "aacba"
