Subproceso leer_dat(nomb_vend Por Referencia,cant_aut_vend Por Referencia,total_vtas Por Referencia)
	Mostrar "¿Nombre del Empleado?" Sin Saltar
	Leer nomb_vend
	Mostrar "¿Cantidad de autos vendidos?" Sin Saltar
	Leer cant_aut_vend
	Mostrar "¿Monto total de ventas?" Sin Saltar
	Leer total_vtas 
FinSubProceso

//función reusable.
Funcion res_multip <- func_multip_2fact(Factor1,Factor2)
	res_multip = Factor1*Factor2
FinFuncion

//determinando comisiones.
Subproceso det_com(cantAutVend, total_vtas, com_total Por Referencia)
	com_aut_vend = func_multip_2fact(cant_aut_vend,100000)
	com_total_ventas = func_multip_2fact(total_vtas,0.18)
	com_total = com_aut_vend+com_total_ventas
FinSubProceso

SubProceso calc_salario(com_total, sal_neto Por Referencia)
	sal_neto = 700000 + com_total
FinSubProceso

SubProceso mostrar_salidas(nomb_vend,sal_neto)
	Borrar Pantalla
	Mostrar nomb_vend " debe percibir como salario neto " sal_neto " Bs."
FinSubProceso

Algoritmo buenas_practicas
	leer_dat(nomb_vend,cant_aut_vend,total_vtas)
	det_com(cant_aut_vend,total_vtas,com_total)
	calc_salario(com_total,sal_neto)
	mostrar_salidas(nombVend,salNeto)
FinAlgoritmo
