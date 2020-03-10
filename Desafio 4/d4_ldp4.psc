SubProceso mostrarMensaje(mensaje)
	mostrar mensaje
FinSubProceso

//modulo para determinar si se quiere salir del programa.
subproceso preguntar(mensaje, mensaje2, answer Por Referencia)
	mostrar mensaje
	Repetir
		leer answer
		answer = Mayusculas(answer)
		
		si ~(answer = "S" o answer = "N")
			mostrar mensaje2
		FinSi
		
		si answer = "S" Entonces
			mostrar "¡Hasta pronto!"
		SiNo
			si answer = "N" Entonces
				esperar 1 Segundo 
				Borrar Pantalla
			FinSi
		FinSi
	hasta que answer = "S" o answer = "N"
FinSubProceso

//funcion resable para validar dato entre dos rangos
Funcion opc = validarDato(num1, num2, mensaje)
	repetir
		leer opc
		si opc<num1 o opc>num2
			mostrar mensaje
		FinSi
	Hasta Que opc>=num1 y opc<=num2
FinFuncion

SubProceso registrarAlum(cantAlum,nombres,cedulas)
	mostrar ""
	mostrar "A continuación se registrarán " cantAlum " alumnos:"
	para i = 1 hasta cantAlum Hacer
		mostrar "Indique el nombre del " i "° alumno"
		leer nombres[i]
		mostrar "indique el nro de cédula de <"+nombres[i]+">"
		leer cedulas[i]
		mostrar ""
	FinPara
FinSubProceso

SubProceso procesarNotas(cedulas, notas, ciEncontrada, posicion)
	si ciEncontrada = verdadero entonces
		mostrar "¿Que nota desea registrar?"
		dato = validarDato(1, 5, "Número invalido. Intente ingresar un número entre 1 y 5")
		mostrar "Ingrese calificación:"
		notas[posicion,dato] = validarDato(0, 100, "Número invalido. Intente ingresar una calificación entre 0 y 100 ptos")
	SiNo
		mostrar "No existe ningún estudiante con ese nro de cédula."
	FinSi
FinSubProceso

//modulo para encontrar cedula.
SubProceso encontrar_ci(cedulas, cantAlum, posicion Por Referencia, ciEncontrada Por Referencia)
	leer cedula
	ciEncontrada = Falso
	
	posicion = 1
	Repetir
		si cedulas[posicion] = cedula Entonces
			ciEncontrada = Verdadero
			mostrar "La cédula le pertenece al estudiante #" posicion
			mostrar ""
		SiNo
			posicion = posicion + 1
		FinSi 
	hasta que (ciEncontrada = Verdadero) O (posicion > cantAlum)
FinSubProceso

//para la opción 3
subproceso listarALumnos(cantAlum, cedulas, nombres, notas)
	Mostrar "Cedula  Nombre   Nota 1   Nota 2   Nota 3   Nota 4   Nota 5 "
	Para a = 1 hasta cantAlum
		mostrar cedulas[a]+"   "+nombres[a]+"   "Sin Saltar
		Para n = 1 hasta 5
			Si n<5
				Mostrar "   " notas[a,n] "     "Sin Saltar
			Sino
				Mostrar "   " notas[a,n] 
			FinSi
		FinPara
	FinPara
	mostrar ""
FinSubProceso

//para la opción 4
SubProceso listarUnAlumno(ciEncontrada, posicion, cantAlum, cedulas, nombres, notas)
	si ciEncontrada = Verdadero Entonces
		Mostrar "Cedula    Nombre   Nota 1   Nota 2    Nota 3   Nota 4   Nota 5 "
		a = posicion 
		mostrar cedulas[a]+" "+nombres[a]+"    "Sin Saltar
		Para n = 1 hasta 5
			Si n<5
				Mostrar "  " notas[a,n] "      "Sin Saltar
			Sino
				Mostrar "  " notas[a,n]
			FinSi
		FinPara
	SiNo
		mostrar "No existe ningún estudiante con ese nro de cédula."
	FinSi
	mostrar ""
FinSubProceso

SubProceso detPromIndividual(cantAlum, notas, prom)
	para f = 1 hasta cantAlum
		acum_notas = 0
		para c = 1 hasta 5
			acum_notas = acum_notas + notas[f,c]
		FinPara
		prom[f] = acum_notas/5
	FinPara
FinSubProceso

//para la opción 5
SubProceso listarAlumPorProm(cantAlum, cedulas, nombres, notas, prom)
	Mostrar "Cédula    Nombre   Nota 1   Nota 2    Nota 3   Nota 4   Nota 5   Promedio"
	Para f = 1 hasta cantAlum
		si prom[f]>prom[1] Entonces
			mostrar cedulas[f]+"  "+nombres[f] Sin Saltar
			para c = 1 hasta 5
				mostrar "     " notas[f,c] "   "Sin Saltar
			FinPara
			mostrar "     " prom[f]
		FinSi
	FinPara
	para f = 1 hasta cantAlum
		si prom[f]<=prom[1] Entonces
			mostrar cedulas[f]+"  "+nombres[f] Sin Saltar
			para c = 1 hasta 5
				mostrar "     " notas[f,c] "   "Sin Saltar
			FinPara
			mostrar "     " prom[f]
		FinSi
	FinPara
FinSubProceso

Algoritmo ult_desafio_ldp
	definir opc, cantAlum Como Entero
	definir respt Como Caracter
	
	mostrarMensaje("Bienvenido al sistema educativo de La Alianza Francesa")
	mostrarMensaje("Alumnos para registrar el día de hoy:")
	cantAlum = validarDato(1,100,"Ups.Debes registrar al menos 1 alumno")
	Dimension nombres[cantAlum]
	Dimension cedulas[cantAlum]
	Dimension prom[cantAlum]
	Dimension notas[cantAlum,5]
	
	Borrar Pantalla
	
	repetir
		mostrar "Para continuar, seleccione una de las opciones mostradas:"
		mostrar ""
		mostrar "1- Registrar un alumno"
		mostrar "2- Registrar nota de un alumno"
		mostrar "3- Mostrar alumnos"
		mostrar "4- Mostrar un alumno según su C.I"
		mostrar "5- Mostrar promedio de alumnos"
		mostrar "6- Salir"
		opc = validarDato(1,6,"Error. Debe seleccionar una opción valida.")
		
		segun opc hacer
			1:	Borrar Pantalla
				mostrarMensaje("Usted seleccionó la opción <Registrar un alumno>")
				registrarAlum(cantAlum,nombres,cedulas)
				preguntar("¿Desea salir del sistema (S/N)?", "Debe ingresar S o N", answer)
				
			2:	Borrar Pantalla
				mostrarMensaje("Usted seleccionó la opción <Registrar nota de un alumno>")
				mostrarMensaje("Ingrese la cedula del estudiante")
				encontrar_ci(cedulas, cantAlum, posicion, ciEncontrada)
				procesarNotas(cedulas,notas,ciEncontrada, posicion)
				preguntar("¿Desea salir del sistema (S/N)?", "Debe ingresar S o N",answer)
				
			3:	Borrar Pantalla
				mostrarMensaje("Usted seleccionó la opción <Mostrar alumnos>")
				mostrar ""
				listarALumnos(cantAlum, cedulas, nombres, notas)
				preguntar("¿Desea salir del sistema (S/N)?", "Debe ingresar S o N",answer)
				
			4:	Borrar Pantalla
				mostrarMensaje("Usted seleccionó la opción <Mostrar un alumno según su C.I>")
				mostrarMensaje("Ingrese la C.I del estudiante")
				encontrar_ci(cedulas, cantAlum, posicion, ciEncontrada)
				listarUnAlumno(ciEncontrada, posicion, cantAlum, cedulas, nombres, notas)
				preguntar("¿Desea salir del sistema (S/N)?", "Debe ingresar S o N",answer)
				
			5:	Borrar Pantalla
				mostrarMensaje("Usted seleccionó la opción <Mostrar promedio de Alumnos>")
				mostrar ""
				detPromIndividual(cantAlum, notas, prom)
				listarAlumPorProm(cantAlum, cedulas, nombres, notas, prom)
				mostrar ""
				preguntar("¿Desea salir del sistema (S/N)?", "Debe ingresar S o N",answer)
				
			6:	Borrar Pantalla
				mostrarMensaje("Usted seleccionó la opción <salir>")
				mostrarMensaje("¡Hasta pronto!")
		FinSegun
	mientras que opc<>6 y answer = "N"
FinAlgoritmo
