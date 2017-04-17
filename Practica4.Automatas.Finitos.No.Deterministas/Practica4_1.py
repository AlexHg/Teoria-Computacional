import sys

alfabeto = ['a','b']
print("El Alfabeto definido para trabajar el automata es:\n\n",alfabeto)

index = nodo = nodoaux = 0

class AFND():

	def ValidarAlfabeto(self,L1):
		print("\nEl lenguaje ingresado es: ",L1,"\n")
		for x in range(len(L1)):
			if(L1[x] in alfabeto):
				print(L1[x],"Si esta en el alfabeto")
			else:
				print(L1[x],"No esta en el alfabeto\nFin del Programa")
				sys.exit(0)
		return L1

	def Automata(self,L1):
		instance.Nodo0(index, nodo, L1),"\n"

	def Nodo0(self, index, nodo, L1):
		print("\nq",nodo,"\n")

		if(L1[index] == 'a'):
			nodo = 0
			nodoaux = 3
			print("\nEntrada: '",L1[index],"' La secuencia es correcta\n\t q",nodo," -> q",nodoaux)
			index = index + 1
			print ("palabra[",index,"]")

			if(index >= len(L1)):
				print("\nEl lenguaje no es valido.\n")
				#print(("\nLa secuencia es correcta\nFin del automata"))
				sys.exit(0)
			elif(index == 1):
				instance1.Nodo3(index, nodoaux, L1)
			else:
				instance1.Nodo3(index, nodoaux, L1)
				instance.Nodo0(index, nodo, L1)


		if(L1[index] == 'b'):
			nodo = 0
			nodoaux = 1
			print("\nEntrada: '",L1[index],"' La secuencia es correcta\n\t q",nodo," -> q",nodoaux)
			index = index + 1
			print ("palabra[",index,"]")

			if(index >= len(L1)):
				print("\nEl lenguaje no es valido.\n")
				#print(("\nLa secuencia es correcta\nFin del automata"))
				sys.exit(0)
			else:
				instance1.Nodo1(index, nodoaux, L1)
				instance.Nodo0(index, nodo, L1)

	def Nodo1(self, index, nodo, L1):
		print("\nq",nodo,"\n")

		if(L1[index] == 'b'):
			nodoaux = 2
			print ("\nEntrada: '",L1[index],"' La secuencia es correcta\n\t q",nodoaux)
			index = index + 1
			print ("palabra[",index,"]")
			if(index >= len(L1)):
				#print(("\nEl lenguaje no es valido.\n"))
				print ("\nLa secuencia es correcta\nFin del automata")
				sys.exit(0)
			else:
				instance.Nodo2(index, nodo, L1)

		if(L1[index] == 'a'):
			nodo = 0
			if(index >= len(L1)):
				print("\nEl lenguaje no es valido.\n")
				#print("\nLa secuencia es correcta\nFin del automata en el nodo",nodoaux)
				sys.exit(0)
			else:
				print("fin del hilo")
				instance.Nodo0(index, nodo, L1)

	def Nodo2(self, index, nodo, L1):
		print("\nq",nodo,"\n")

		if(L1[index] == 'a'):
			nodoaux = 2
			print ("\nEntrada: '",L1[index],"' La secuencia es correcta\n\t q",nodoaux)
			index = index + 1
			print ("palabra[",index,"]")
			if(index >= len(L1)):
				#print(("\nEl lenguaje no es valido.\n"))
				print("\nLa secuencia es correcta\nFin del automata en el nodo",nodoaux)
				sys.exit(0)
			else:
				instance.Nodo2(index, nodoaux, L1)

		elif(L1[index] == 'b'):
			nodoaux = 2
			print(("\nEntrada: '",L1[index],"' La secuencia es correcta\n\t q",nodoaux))
			index = index + 1
			print ("palabra[",index,"]")
			if(index >= len(L1)):
				#print(("\nEl lenguaje no es valido.\n"))
				print("\nLa secuencia es correcta\nFin del automata en el nodo",nodoaux)
				sys.exit(0)
			else:
				instance.Nodo2(index, nodoaux, L1)

	def Nodo3(self, index, nodo, L1):
		print("\nq",nodo,"\n")

		if(L1[index] == 'a'):
			nodoaux = 4
			nodo = 0
			print("\nEntrada: '",L1[index],"' La secuencia es correcta\n q",nodoaux)
			index = index + 1
			print ("palabra[",index,"]")
			if(index >= len(L1)):
				#print(("\nEl lenguaje no es valido.\n"))
				print(("\nLa secuencia es correcta\nFin del automata"))
				sys.exit(0)
			else:
				instance.Nodo4(index, nodoaux, L1)

		if(L1[index] == 'b'):
			nodo = 0
			if(index >= len(L1)):
				print("\nEl lenguaje no es valido.\n")
				#print("\nLa secuencia es correcta\nFin del automata en el nodo",nodoaux)
				sys.exit(0)
			else:
				print("fin del hilo")
				instance.Nodo0(index, nodo, L1)

	def Nodo4(self, index, nodo, L1):
		print("\nq",nodo)

		if(L1[index] == 'a'):
			nodoaux = 4
			print("\nEntrada: '",L1[index],"' La secuencia es correcta\n\t q",nodoaux)
			index = index + 1
			print ("palabra[",index,"]")
			if(index >= len(L1)):
				#print(("\nEl lenguaje no es valido.\n"))
				print("\nLa secuencia es correcta\nFin del automata en el nodo",nodoaux)
				sys.exit(0)
			else:
				instance.Nodo4(index, nodoaux, L1)

		elif(L1[index] == 'b'):
			nodoaux = 4
			print ("\nEntrada: '",L1[index],"' La secuencia es correcta\n q",nodoaux)
			index = index + 1
			print ("palabra[",index,"]")
			if(index >= len(L1)):
				#print(("\nEl lenguaje no es valido.\n"))
				print("\nLa secuencia es correcta\nFin del automata en el nodo",nodoaux)
				sys.exit(0)
			else:
				instance.Nodo4(index, nodoaux, L1)

instance = AFND()
instance1 = AFND()

aux = input("Ingresa un lenguaje del alfabeto.\n\n")
Lenguaje1 = instance.ValidarAlfabeto(aux)
instance.Automata(Lenguaje1)
