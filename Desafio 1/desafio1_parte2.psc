SubProceso mostrarMensaje(mensaje)
	mostrar mensaje
FinSubProceso

SubProceso calcularPromedio(nota, mensaje2) 
	si nota<=0 entonces
		mostrar mensaje2
	FinSi
FinSubProceso

Funcion promedio = calcularProm(acumNota, cantNota)
	promedio = acumNota/cantNota
FinFuncion

Algoritmo sin_titulo
	definir cantNota, acumNota Como Entero
	definir mensaje, mensaje2, mensaje3 como caracter
	mensaje = "¿Cuantas notas desea registrar?"
	mensaje2 = "Error. Debe registrar una nota valida."
	mensaje3 = "El promedio de tus notas es: "
	
	mostrarMensaje(mensaje)
	leer cantNota
	Dimension notas[cantNota]
	Limpiar Pantalla
	
	acumNota= 0
	para i = 1 hasta cantNota
		
		Repetir
			mostrar "Ingrese la nota #" i
			leer nota
			calcularPromedio(nota, mensaje2)
			mostrar ""
		Mientras Que nota=0
		notas[i] = nota
		
		acumNota = acumNota + notas[i]
	FinPara
	Borrar Pantalla
	
	Mostrar mensaje3 calcularProm(acumNota, cantNota) " ptos."
FinAlgoritmo
