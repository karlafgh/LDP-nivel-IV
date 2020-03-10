Funcion mostrarMensaje(mensaje)
	Escribir mensaje
FinFuncion

// vallidación de notas.
Funcion nota <- fun_val_nota(mensaje3,mensaje4)
	Repetir
		Leer nota
		Si nota<0 O nota>150 Entonces
			Escribir mensaje3
			Escribir mensaje4
		FinSi
	Hasta Que nota>=0 Y nota<=150
FinFuncion

SubProceso burbuja_descendente(cant_alum,notas,nombres)
	Esperar 1 segundo
	Borrar Pantalla
	Definir aux Como Entero
	Definir aux2 Como Caracter
	
	Para i<-1 Hasta cant_alum Hacer
		Para j<-1 Hasta cant_alum-1 Hacer
			Si notas[j]<notas[j+1] Entonces
				aux <- notas[j]
				notas[j] <- notas[j+1]
				notas[j+1]<-aux
				
				aux2 = nombres[j]
				nombres[j] = nombres[j+1]
				nombres[j+1] = aux2
			FinSi
		FinPara
	FinPara
	
	mostrar "A continuación se mostrará el arreglo con orden descendente..."
	esperar 1 segundo
	
	para i=1 hasta cant_alum
		mostrar nombres[i] " — " notas[i]
	FinPara
	mostrar ""
FinSubProceso 

Funcion calcular_mayor_y_menor(cant_alum,notas,nombres,nomb_nota_mayor Por Referencia,nomb_nota_menor Por Referencia, mayor_nota Por Referencia, menor_nota Por Referencia)
	mayor_nota <- notas[1]
	menor_nota <- notas[1]
	
	Para i<-2 Hasta cant_alum Hacer
		Si notas[i] > mayor_nota Entonces
			mayor_nota = notas[i]
			nomb_nota_mayor = nombres[i]
		SiNo
			Si notas[i] < menor_nota Entonces
				menor_nota = notas[i]
				nomb_nota_menor = nombres[i]
			FinSi
		FinSi
	FinPara
FinFuncion

SubProceso calcularPromNotas(cant_alum, notas, promedio por referencia)
	definir acumulador como real
	
	acumulador = 0
	para i=1 hasta cant_alum
		acumulador = acumulador + notas[i]
	FinPara
	
	promedio = acumulador/cant_alum
FinSubProceso

Funcion mostrarSiSuperaPromedio(cant_alum, notas, promedio, nombres)
	Para i<-1 Hasta cant_alum Hacer
		Si notas[i]>promedio Entonces
			Escribir '• El alumno <',nombres[i],'> superó el promedio con una calificación de ',notas[i],' ptos.'
			Escribir ''
		FinSi
	FinPara
FinFuncion

Funcion mostrarSalidas(nomb_nota_mayor,mayor_nota, nomb_nota_menor,menor_nota, promedio)
	Escribir 'La mayor nota la obtuvo: ',nomb_nota_mayor " con " mayor_nota " ptos"
	Escribir ""
	Escribir 'La menor nota la obtuvo: ',nomb_nota_menor " con " menor_nota " ptos"
	Escribir ""
	Escribir 'Promedio de la sección : ',promedio,' ptos'
	Escribir ""
	Escribir 'Alumnos que superaron el promedio: ',nombreSuperan
FinFuncion

// cuerpo principal del algoritmo.
Algoritmo desafio2_ldp4
	Definir mensaje,mensaje2,mensaje3,mensaje4,mensaje5 Como Caracter
	Definir acum_notas Como entero
	Definir cant_alum Como Entero
	mensaje <- 'Bienvenido al sistema de notas de cadi f1.'
	mensaje2 <- '¿Cuantos alumnos desea registrar?'
	mensaje3 <- 'Me parece que has ingresado una nota invalida.'
	mensaje4 <- 'Por favor ingresa una nota entre 0 y 150 ptos'
	mensaje5 <- 'Para ver los resultados presione cualquier tecla.'
	
	mostrarMensaje(mensaje)
	mostrarMensaje(mensaje2)
	Leer cant_alum
	Dimension nombres[cant_alum]
	Dimension notas[cant_alum]
	
	Borrar Pantalla
	
	acum_notas <- 0
	Para j<-1 Hasta cant_alum Hacer
		Escribir 'Indicame el nombre del estudiante #',j
		Escribir '' Sin Saltar
		Leer nombres[j]
		Escribir ''
		Escribir 'Ahora ingresa la nota de <',nombres[j],'>'
		notas[j] <- fun_val_nota(mensaje3,mensaje4)
		Escribir ''
	FinPara
	
	// llamado de módulos.
	calcular_mayor_y_menor(cant_alum,notas,nombres,nomb_nota_mayor,nomb_nota_menor, mayor_nota, menor_nota)
	calcularPromNotas(cant_alum, notas, promedio)
	burbuja_descendente(cant_alum,notas,nombres)
	
	mostrarMensaje(mensaje5)
	esperar Tecla
	Borrar Pantalla
	
	mostrarSalidas(nomb_nota_mayor,mayor_nota, nomb_nota_menor, menor_nota, promedio)
	mostrarSiSuperaPromedio(cant_alum,notas,promedio,nombres)
FinAlgoritmo

