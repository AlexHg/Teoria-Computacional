import sys
alfabeto = ['a','b']
print "El Alfabeto definido para trabajar el automata es:\n\n",alfabeto
index = 0
nodo = 0
nodoaux = 0

class AFND():
	def ValidarAlfabeto(self,L1):
		print "\nEl lenguaje ingresado es: ",L1
		for x in range(len(L1)):
			if(L1[x] in alfabeto):
				print L1[x],"Si esta en el alfabeto"
			else:
				print L1[x]," No esta en el alfabeto\nFin del Programa"
				sys.exit(0)
		return L1

	def Automata(self,L1):
		instance.Nodo0(index, nodo, L1),"\n"

	def Nodo0(self, index, nodo, L1):
		print "\nEstoy en el nodo",nodo
		if(L1[index] == 'a'):
			nodo = 1
			nodoaux = 2
			print "\nEntra '",L1[index],"' Secuencia correcta \nEstoy en el nodo ",nodo," y en el nodo ",nodoaux
			index = index + 1
			print "El index es",index
			if(index >= len(L1)):
				print"\nEl Lenguaje no cumple las condiciones del Automata, fin del programa.\n"
				#print("\nSecuencia correcta\nFin del Automata")
				sys.exit(0)
			else:
				instance1.Nodo1(index, nodo, L1)
				instance.Nodo2(index, nodoaux, L1)
		elif(L1[index] == 'b'):
			print "\nEl Lenguaje no cumple las condiciones del Automata, fin del programa.\n"
			#print("\nSecuencia correcta\nFin del Automata")
			sys.exit(0)

	def Nodo1(self, index, nodo, L1):
		print "\nEstoy en el nodo",nodo,"\n"

		if(L1[index] == 'b'):
			nodo = 1
			nodoaux = 3
			print "\nEntra '",L1[index],"' Secuencia correcta\nEstoy en el nodo",nodo,"y en el nodo",nodoaux
			index = index + 1
			print "El index es",index
			if(index >= len(L1)):
				#print("\nEl Lenguaje no cumple las condiciones del Automata, fin del programa.\n")
				print "\nSecuencia correcta\nFin del Automata en el nodo",nodoaux
				sys.exit(0)
			else:
				instance.Nodo1(index, nodo, L1)
				instance.Nodo3(index, nodoaux, L1)

		if(L1[index] == 'a'):
			if(index >= len(L1)):
				print "\nEl Lenguaje no cumple las condiciones del automata, fin del programa.\n"
				#print("\nSecuencia correcta\nFin del automata en el nodo",nodoaux)
				sys.exit(0)
			else:
				print "Fin del Hilo a en el nodo 1"
				#instance.Nodo0(index, nodo, L1)

	def Nodo2(self, index, nodo, L1):
		print "\nEstoy en el nodo",nodo

		if(L1[index] == 'a'):
			nodo = 2
			print "\nEntra '",L1[index],"' Secuencia correcta\nEstoy en el nodo",nodo
			index = index + 1
			print("El index es",index)
			if(index >= len(L1)):
				print "\nEl Lenguaje no cumple las condiciones del automata, fin del programa.\n"
				#print("\nSecuencia correcta\nFin del automata en el nodo",nodoaux)
				sys.exit(0)
			else:
				instance.Nodo2(index, nodo, L1)

		if(L1[index] == 'b'):
			nodoaux = 3
			index = index + 1
			print("El index es",index)
			if(index >= len(L1)):
				#print("\nEl Lenguaje no cumple las condiciones del automata, fin del programa.\n")
				print "\nSecuencia correcta\nFin del automata en el nodo",nodoaux
				sys.exit(0)

	def Nodo3(self, index, nodo, L1):
		print "\nEstoy en el nodo",nodo

		if(L1[index] == 'a'):
			nodoaux = 3
			print "\nEntra '",L1[index],"' Secuencia correcta\nEstoy en el nodo",nodoaux
			index = index + 1
			print "El index es",index
			if(index >= len(L1)):
				#print("\nEl Lenguaje no cumple las condiciones del automata, fin del programa.\n")
				print "\nSecuencia correcta\nFin del automata en el nodo",nodoaux
				sys.exit(0)
			else:
				instance.Nodo3(index, nodoaux, L1)

		elif(L1[index] == 'b'):
			nodoaux = 3
			if(index >= len(L1)):
				#print("\nEl Lenguaje no cumple las condiciones del automata, fin del programa.\n")
				print"\nSecuencia correcta\nFin del automata en el nodo",nodoaux
				sys.exit(0)
			else:
				print "Fin del Hilo b en nodo 3",nodoaux
				#instance.Nodo3(index, nodoaux, L1)


instance = AFND()
instance1 = AFND()

aux = raw_input("Ingresa un lenguaje del alfabeto.\n\n")
Lenguaje1 = instance.ValidarAlfabeto(aux)
instance.Automata(Lenguaje1)
