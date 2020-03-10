SubProceso cuantos_superaron_prom(a,b,matriz_temp)
	definir superaron, termina, p como entero
	definir promedio como real
	promedio = a+b/31
	
	superaron = 0
	para i = 1 hasta 4 hacer
		para j =  1 hasta 7 hacer
			si matriz_temp[i,j]>promedio entonces
			superaron = superaron + 1
		FinSi
		FinPara
	FinPara
	termina = 0 
	p = 1
	repetir 
		si matriz_temp[5,p]>promedio entonces
			superaron = superaron + 1
		FinSi
		termina = termina + 1
		p = p + 1
	Hasta Que termina = 3
	
	mostrar "Promedio de temperatura en Barquisimeto en el mes de Diciembre: " promedio
	mostrar "Cantidad de días que superó ese promedio: " superaron
FinSubProceso

Funcion porc_menor_25 <- fun_ident_menor_25(menor_temp)
	porc_menor_25 = menor_temp/31* 100
FinFuncion

//cuerpo principal
Algoritmo desafio3_ldp4
	definir a, b, j, num_a, p, termina, num_dia como entero
	Dimension matriz_temp[5,7]
	a = 19
	b = 34
	
	mostrar "¡Bienvenido a tu pronostico del clima favorito de Barquisimeto!"
	Mostrar "Presione una tecla para ver las temperaturas del mes actual."
	Esperar Tecla
	Limpiar Pantalla

	j = 1
	menor_temp = 0
	para i = 1 hasta 4 hacer
		para k = 1 hasta 7 hacer
			num_a = ALEATORIO(19,34)
			matriz_temp[i,k] = num_a
			si matriz_temp[i,k]<25 entonces
				menor_temp = menor_temp + 1
			FinSi
			j = j+ 1
		FinPara
		mostrar ""
	FinPara
	
	// la variable <p> significará la posición de la columna en el ciclo de la matriz.
	p = 1
	//la variable <termina> determinará cuando se acabará el ciclo.
	termina= 0
	//la variable <num_dia> llevará el conteo hasta 31
	num_dia = 29
	repetir 
		num_a = ALEATORIO(19,34)
		matriz_temp[5,p] = num_a   
		si matriz_temp[5,p]<25 entonces
			menor_temp = menor_temp + 1
		FinSi
		termina = termina + 1
		num_dia = num_dia + 1
		p = p + 1
	Hasta Que termina = 3

	porc_menor_25 <- fun_ident_menor_25(menor_temp)
	mostrar "------------------------------------------------------------------"
	mostrar "                            DICIEMBRE                                     "
	Mostrar " DO     " "   LU     " "   MA     "	"   MI    " 	  "    JU    "	   "    VI    " "    SA"
	para i = 1 hasta 4 hacer
		Para n = 1 hasta 7
			Si n<7
				Mostrar matriz_temp[i,n] "°C      " Sin Saltar
			Sino
				Mostrar matriz_temp[i,n] "°C"
			FinSi
		FinPara
	FinPara
	para i = 1 hasta 1
		para n = 1 hasta 3
			mostrar matriz_temp[i,n] "°C      " Sin Saltar
		FinPara
	FinPara
	
	mostrar ""
	mostrar "------------------------------------------------------------------"
	mostrar "Información de interés: "
	Mostrar ""
	cuantos_superaron_prom(a, b, matriz_temp)
	mostrar "Porcentaje de días que obtuvieron temperaturas menores a 25°C: " porc_menor_25 "%"
FinAlgoritmo
