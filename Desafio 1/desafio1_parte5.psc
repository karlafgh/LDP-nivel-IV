SubProceso mostrarMensaje(mensaje)
	mostrar mensaje 
FinSubProceso

funcion usuario_existe <- func_buscar_usuario(nombres, name, mensaje, cant_p)
	usuario_existe = Falso
	
	i = 1
	
	Repetir
		si nombres[i] = name Entonces
			usuario_existe = Verdadero
			mostrar mensaje
		SiNo
			i = i+1
		FinSi
	Hasta Que (usuario_existe = Verdadero) o (i>cant_p)
FinFuncion

subproceso registrarUsuario(clave)
	si clave<6 y clave>12 Entonces
		mostrar "Recuerda que el rango de la clave es entre 6 y 12 caracteres."
	FinSi
FinSubProceso

Algoritmo sin_titulo
	definir mensaje, mensaje2, name, nuevoNombre, mensaje3, mensaje4, clav, prefijoClav como caracter
	definir no_registrado Como Logico
	definir longMaxClave, clave como entero
	definir cant_p Como Entero
	
	clav = prefijoClav+ConvertirATexto(clave)
	longMaxClave = Longitud("123456123456")

	mensaje = "Ups. esta persona ya habia sido registrada."
	mensaje2 = "Para registrar una nueva persona presione cualquier tecla."
	mensaje3 = "Por favor, indicame el nombre de la persona nuevo ingreso"
	mensaje4 = "Ahora, ingresa la nueva clave de esa persona"
	
	mostrar "Feliz día, querido usuario."
	mostrar "¿Cuantos personas se registraron hoy?"
	leer cant_p
	mostrar ""
	Dimension nombres[cant_p]
	
	para i = 1 hasta cant_p
		no_registrado = falso
		
		Repetir
			mostrar "Indicame el nombre de la persona " i "/" cant_p " registrada"
			leer name
			no_registrado = func_buscar_usuario(nombres, name, mensaje, cant_p)
			usuario_existe = Verdadero
		Mientras Que no_registrado = Verdadero
		
		Si no_registrado = Verdadero Entonces
			nombres[i] = name
		FinSi
	FinPara
	
	mostrarMensaje(mensaje2)
	esperar tecla 
	Borrar Pantalla
	
	no_registrado = Falso
	
	repetir
		mostrarMensaje(mensaje3)
		leer nuevoNombre
		no_registrado = func_buscar_usuario(nombres, nuevoNombre, mensaje, cant_p)
		usuario_existe = verdadero
	Mientras Que suario_existe = Verdadero
	
	Repetir
		mostrarMensaje(mensaje4)
		Leer clave
		clav = Mayusculas(clav)
		longClave = Longitud(clav)
		claveVacia = (clav="")
		registrarUsuario(clave)
	Hasta Que (clave<=longMaxClave) o ~(claveVacia)
	
	mostrar ""
	mostrar "El nombre del nuevo ingreso: " nuevoNombre
	mostrar "Clave del nuevo ingreso: " clave
FinAlgoritmo
