//asi debe ser
Subproceso Mostrar_Arr(vi,vf,ArrNum)
	Si vi<vf
		entonces ult_pos=vf
	sino ult_pos=vi
	FinSi
	Para k=vi hasta vf
		Mostrar ArrNum[k] Sin Saltar
		Si vi<vf Y k<10
			Mostrar "," Sin Saltar
		FinSi
		Si vi>vf Y k>1
			Mostrar "," Sin Saltar
		FinSi
	FinPara
	Mostrar ""
FinSubProceso

SubAlgoritmo Burbuja_Descendente(ArrNum)
	definir aux como entero
	// Mostrado de los valores según cargados
	Mostrar_Arr(1,10,ArrNum)
	// Ordenamiento descendente
	Para i=1 hasta 9
		Para j=1 hasta 9
			Si ArrNum[j]<ArrNum[j+1] Entonces
				aux=ArrNum[j]
				ArrNum[j]=ArrNum[j+1]
				ArrNum[j+1]=aux
			FinSi
		FinPara
	FinPara
	// Mostrado de los valores ordenados descendentemente
	Mostrar_Arr(1,10,ArrNum)
FinSubAlgoritmo

Algoritmo sin_titulo
	
	para i= 1 hasta cantAlumnos-1
		Para j=1 hasta  cantAlumnos-1
			si notas[i]>notas[j+1]
				Entonces
				aux = notas[i]
				aux = nombres[i]
				notas [i] = notas[j+1]
				notas[j+1] = aux
			finsi
		finpara
	FinPara
	
	Mostrar mostrar_arre(1,10)

FinAlgoritmo
