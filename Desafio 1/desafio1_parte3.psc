Funcion mostrarMensaje(mensaje,num por referencia)
	Escribir mensaje
	Leer num
	Borrar Pantalla
FinFuncion

SubProceso solicitarDatoEnRango(nota, mensaje2) 
	si nota<0 o nota>20
		mostrar mensaje2
		mostrar ""
	FinSi
FinSubProceso

Algoritmo sin_titulo
	definir mensaje Como Caracter
	definir num Como Entero
	mensaje = "¿Cuantas notas de ese estudiante desea registrar?"
	mensaje2 = "Por favor ingresa una nota dentro del rango de 0 y 20 ptos."
	
	mostrarMensaje(mensaje,num)
	
	para i=1 hasta num
		repetir
			mostrar "Ingrese la " i "° nota."
			leer nota
			solicitarDatoEnRango(nota, mensaje2)
		mientras que nota<0 o nota>20
	FinPara
FinAlgoritmo
