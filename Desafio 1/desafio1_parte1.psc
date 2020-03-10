Funcion mostrarMensaje (mensaje,n por referencia)
	Escribir mensaje
	Leer n
FinFuncion

Funcion no_se_repite <- Func_no_se_repite(arreglo, datoUsuario, mensaje2, n)
	no_se_repite=Verdadero
	m=1
	
	Repetir
		
		Si arreglo[m] = datoUsuario
			no_se_repite=Falso
			mostrar mensaje2
			mostrar ""
		SiNo
			m=m+1
		FinSi
		
	Hasta Que (no_se_repite=Falso) o (m>N)
FinFuncion 

Algoritmo Busqueda_arreglos
	//Bloque de Declaraciones
	Definir n Como Entero
	Definir no_repite Como Logico
	Definir mensaje, mensaje2, datoUsuario Como Caracter
	mensaje <- 'Dime la cantidad de numeros a registrar en el arreglo.'
	mensaje2 <- 'El número ya ha sido registrado.'
	
	//Inidio del Algoritmo
	mostrarMensaje(mensaje, n)
	Dimension arreglo[n]
	Borrar Pantalla

	
	//Bloque de registro de codigos y verificacion de anti-repeticion
	Para i=1 hasta N
		no_repite = Falso
		
		Repetir
			Mostrar "Ingrese el " i "° codigo"
			Leer datoUsuario
			no_repite = Func_no_se_repite(arreglo, datoUsuario, mensaje2, n)
			no_se_repite=Verdadero
		Hasta Que no_repite = Verdadero
		
		Si no_repite = Verdadero Entonces
			arreglo[i]=datoUsuario
		FinSi
		
	FinPara
FinAlgoritmo
