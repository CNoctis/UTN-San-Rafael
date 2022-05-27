SubProceso link()
	Definir key Como Caracter;
	Escribir "*******************";
	Escribir "*** Link GitHub ***";
	Escribir "*******************";
	Escribir "";
	Escribir "Link:";
	Escribir "https://github.com/CNoctis/UTN-San-Rafael/blob/main/Proyecto_PSeInt/pingpong_fix.psc";
	Escribir "";
	Escribir "";
	Escribir "Precione 1 para volver al menu o cualquier otra tecla para finalizar";
	Leer key;
	Si key == '1' Entonces
		declaracion_variables();
	FinSi
FinSubProceso

SubProceso nombres ()
	Definir key Como Caracter;
	Escribir "*************************";
	Escribir "*** Nombre del equipo ***";
	Escribir "*************************";
	Escribir "";
	Escribir "Equipo alfa buena maravilla onda dinamita escuadron lobo";
	Escribir "(E.A.B.M.O.D.E.L)";
	Escribir "";
	Escribir "";
	Escribir "****************************";
	Escribir "*** Nombre de ingrantes *** ";
	Escribir "****************************";
	Escribir "";
	Escribir "G. Hernán Osores";
	Escribir "G. Enzo Gramajo";
	Escribir "C. J. Rosas Guaina";
	Escribir "A. Damián Monza";
	Escribir "A Nahuel Saravia";
	Escribir "M. R. Campora Lorenzo";
	Escribir "S. L. Castellani";
	Escribir "R. Belén Noceti";
	Escribir "L. A. Saint Bonnet";
	Escribir "E Gaudino";
	Escribir "E Marte";
	Escribir "";
	Escribir "";
	Escribir "Precione 1 para volver al menu o cualquier otra tecla para finalizar";
	
	Leer key;
	Si key == '1' Entonces
		declaracion_variables();
	FinSi
FinSubProceso

Funcion opcion <- menu ()
	Definir  opcion Como Entero;
	Escribir "**************************************";
	Escribir "*** Bienvenido al menú de opciones ***";
	Escribir "**************************************";
	Escribir "";
	Escribir "";
	Escribir "1. Jugador vs IA";
	Escribir "2. IA vs IA";
	Escribir "3. Integrantes del grupo";
	Escribir "4. GitHub (Código)";
	Escribir "5. Salir";
	Leer opcion;
FinFuncion

SubProceso j_ia (campo Por Referencia, inijug Por Referencia, finjueg Por Referencia, modia Por Referencia)
	Definir  i, j Como Entero;
	Para i<-inijug Hasta finjueg Con Paso 1 Hacer
		Para j<-2 Hasta 3 Con Paso 1 Hacer
			campo[i,j] <- ' ';
		FinPara
	FinPara
	inijug <- inijug + modia;
	finjueg <- finjueg + modia;
	
	Para i<-inijug Hasta finjueg Con Paso 1 Hacer
		Para j<-2 Hasta 3 Con Paso 1 Hacer
			campo[i,j] <- 'X';
		FinPara
	FinPara
	
FinSubProceso

SubProceso gameloop_ia(campo Por Referencia, inijug Por Referencia, finjueg Por Referencia, iniia Por Referencia, finia Por Referencia, pelX Por Referencia, pelY Por Referencia, gol Por Referencia, modX Por Referencia , modY Por Referencia , modia Por Referencia)
	Mientras gol <> 1 Hacer
		//Limpieza de pantalla
		pantalla_l();
		
		//verificaciones:
		
		//Verificar el estado de la pelota
		v_pelota(inijug, finjueg, iniia, finia, pelX, pelY, modX, modY, gol);
		
		//Verificamos el estado de la raqueta de la IA
		v_ia(iniia,finia,modia);
		
		// Verificamos el estado de la raqueta del jugador
		v_jg(campo, inijug, finjueg);
		
		// modificadores
		
		// Limpiamos el rastro de la pelota y cargamos su nuevo valor
		m_pelota(campo, pelX, pelY, modX, modY);
		
		// Limpias rastros y cargamos nuevos valores de la raqueta IA según su posición
		m_ia(campo, iniia, finia, modia);
		
		// Impresión de campo
		imprimir(campo);
		
		// jugabilidad vs IA
		j_ia(campo, inijug, finjueg, modia);
		
	FinMientras
FinSubProceso

SubProceso j_jugar(campo Por Referencia, inijug Por Referencia, finjueg Por Referencia)
	Definir  i, j, jugar Como Entero;
	
	Leer jugar;
	
	Si jugar == 1 Entonces
		Para i<-inijug Hasta finjueg Con Paso 1 Hacer
			Para j<-2 Hasta 3 Con Paso 1 Hacer
				campo[i,j] <- ' ';
			FinPara
		FinPara
		
		inijug <- inijug - 1;
		finjueg <- finjueg - 1;
		
		Para i<-inijug Hasta finjueg Con Paso 1 Hacer
			Para j<-2 Hasta 3 Con Paso 1 Hacer
				campo[i,j] <- 'X';
			FinPara
		FinPara
		
	SiNo
		Para i<-inijug Hasta finjueg Con Paso 1 Hacer
			Para j<-2 Hasta 3 Con Paso 1 Hacer
				campo[i,j] <- ' ';
			FinPara
		FinPara
		
		inijug <- inijug + 1;
		finjueg <- finjueg + 1;
		
		Para i<-inijug Hasta finjueg Con Paso 1 Hacer
			Para j<-2 Hasta 3 Con Paso 1 Hacer
				campo[i,j] <- 'X';
			FinPara
		FinPara
	FinSi
FinSubProceso

SubProceso imprimir (campo)
	//Iniciar contador
	Definir i, j Como Entero;
	
	Para i<-0 Hasta 20 Con Paso 1 Hacer
		Para j<-0 Hasta 73 Con Paso 1 Hacer
			Escribir campo[i,j] Sin Saltar;
		FinPara
		Escribir " ";
	FinPara
FinSubProceso

SubProceso m_ia(campo Por Referencia, iniia Por Referencia, finia Por Referencia, modia Por Referencia)
	//Iniciar contador
	Definir i, j Como Entero;
	
	Para i<-iniia Hasta finia Con Paso 1 Hacer
		Para j<-71 Hasta 71 Con Paso 1 Hacer
			campo[i,j] <- ' ';
		FinPara
	FinPara
	iniia <- iniia + modia;
	finia <- finia + modia;
	
	Para i<-iniia Hasta finia Con Paso 1 Hacer
		Para j<-71 Hasta 71 Con Paso 1 Hacer
			campo[i,j] <- 'X';
		FinPara
	FinPara
FinSubProceso

SubProceso m_pelota(campo Por Referencia, pelX Por Referencia, pelY Por Referencia, modX Por Referencia, modY Por Referencia)
	//Limpieza y carga de los nuevos valores de la pelota
	campo[pelY,pelX] <- ' ';
	pelX <- pelX + modX;
	pelY <- pelY + modY;
	campo[pelY,pelX] <- 'o';
FinSubProceso

SubProceso v_jg(campo Por Referencia, inijug Por Referencia, finjueg Por Referencia)
	//Definir contador
	Definir i, j Como Entero;
	// Verificamos si esta arriba de todo o abajo para realizar un reset.
	Si inijug == 0 o inijug == 19 Entonces
		Para i<-inijug Hasta finjueg Con Paso 1 Hacer
			Para j<-2 Hasta 3 Con Paso 1 Hacer
				campo[i,j] <- ' ';
			FinPara
		FinPara
		Para i<-0 Hasta 20 Con Paso 1 Hacer
			Para j<-0 Hasta 73 Con Paso 1 Hacer
				Si i == 0 o i == 20 Entonces
					campo[i,j]<- '-';
				SiNo
					Si j == 0 o j == 73 Entonces
						campo[i,j]<- '|';
					SiNo
						campo[i,j]<- ' ';
					FinSi
				FinSi
			FinPara
		FinPara
		inijug <- 8;
		finjueg <- 12;
	FinSi
	//Mismo procedimiento pero con el final de la raqueta
	Si finjueg == 0 o finjueg == 19 Entonces
		Para i<-inijug Hasta finjueg Con Paso 1 Hacer
			Para j<-2 Hasta 3 Con Paso 1 Hacer
				campo[i,j] <- ' ';
			FinPara
		FinPara
		inijug <- 8;
		finjueg <- 12;
	FinSi
	
FinSubProceso

SubProceso v_ia (iniia Por Referencia,finia Por Referencia,modia Por Referencia)
	
	// Si choca algun lateral horizontal ya sea arriba o abajo, irá restando para en su futura modificación dal el sentido contrario
	Si iniia  == 1 o iniia == 19 Entonces
		modia <- modia * (-1);
	FinSi
	
	// También se mueve la final de la raqueta
	Si finia  == 1 o finia == 19 Entonces
		modia <- modia * (-1);
	FinSi
	
FinSubProceso

SubProceso v_pelota(inijug Por Referencia, finjueg Por Referencia, iniia Por Referencia, finia Por Referencia, pelX Por Referencia, pelY Por Referencia, modX Por Referencia, modY Por Referencia,  gol Por Referencia)
	// Iniciando contador
	Definir  i, j Como Entero;
	// Verifica el estado de la pelota si no ha chocado con alguna banda laterales horizontales
	Si pelY  == 1 o pelY == 19 Entonces
		modY <- modY * (-1);
	FinSi
	// Verificamos si no se ha realizado un gol en alguno de las dos bandas verticales
	Si pelX == 1 o pelX == 71 Entonces
		gol <- 1;
		Limpiar Pantalla;
		declaracion_variables();
	FinSi
	
	// Verifica el estado de la pelota si no ha tocado alguna banda de las raquetas
	
	// Raqueta izquierda
	Si pelX == 4 Entonces
		Para i<- inijug Hasta finjueg Con Paso 1 Hacer
			Si i == pelY Entonces
				modX <- modX * (-1);
			FinSi
		FinPara
	FinSi
	
	//Raqueta derecha
	Si pelX == 70 Entonces
		Para i <- iniia Hasta finia Con Paso 1 Hacer
			Si i== pelY Entonces
				modX <- modX * (-1);
			FinSi
		FinPara
	FinSi
FinSubProceso

SubProceso pantalla_l ()
	//Tiempo y limpieza de pantalla
	Esperar 80 Milisegundos;;
	Limpiar Pantalla;
FinSubProceso

SubProceso gameloop_jugador(campo Por Referencia, inijug Por Referencia, finjueg Por Referencia, iniia Por Referencia, finia Por Referencia, pelX Por Referencia, pelY Por Referencia, gol Por Referencia, modX Por Referencia , modY Por Referencia , modia Por Referencia)
	Mientras gol <> 1 Hacer
		//Limpieza de pantalla
		pantalla_l();
		
		//verificaciones:
		
		//Verificar el estado de la pelota
		v_pelota(inijug, finjueg, iniia, finia, pelX, pelY, modX, modY, gol);
		
		//Verificamos el estado de la raqueta de la IA
		v_ia(iniia,finia,modia);
		
		// Verificamos el estado de la raqueta del jugador
		v_jg(campo, inijug, finjueg);
		
		// modificadores
		
		// Limpiamos el rastro de la pelota y cargamos su nuevo valor
		m_pelota(campo, pelX, pelY, modX, modY);
		
		// Limpias rastros y cargamos nuevos valores de la raqueta IA según su posición
		m_ia(campo, iniia, finia, modia);
		
		// Impresión de campo
		imprimir(campo);
		
		// jugabilidad
		j_jugar(campo, inijug, finjueg);
	FinMientras
FinSubProceso

SubProceso pelota(campo, pelX, pelY)
	//Cargamos la pelota con el simbolo que deseamos
	campo[pelY,pelX] <- 'o';
FinSubProceso

SubProceso raqueta_ia(campo, iniia, finia)
	// Definir variables del contador
	Definir i, j Como Entero;
	Para i<-iniia Hasta finia Con Paso 1 Hacer
		Para j<-71 Hasta 71 Con Paso 1 Hacer
			campo[i,j] <- 'X';
		FinPara
	FinPara
	
FinSubProceso

SubProceso raqueta_jg(campo, inijug, finjueg)
	// Definir variables del contador
	Definir i, j Como Entero;
	
	Para i<-inijug Hasta finjueg Con Paso 1 Hacer
		Para j<-2 Hasta 3 Con Paso 1 Hacer
			campo[i,j] <- 'X';
		FinPara
	FinPara
	
FinSubProceso

SubProceso ccampo(campo)
	// Definir variables del contador
	Definir i, j Como Entero;
	
	//Proceso de llenar nuestro campo con caracteres
	Para i<-0 Hasta 20 Con Paso 1 Hacer
		Para j<-0 Hasta 73 Con Paso 1 Hacer
			Si i == 0 o i == 20 Entonces
				campo[i,j]<- '-';
			SiNo
				Si j == 0 o j == 73 Entonces
					campo[i,j]<- '|';
				SiNo
					campo[i,j]<- ' ';
				FinSi
			FinSi
		FinPara
	FinPara
FinSubProceso

SubProceso declaracion_variables()
	Limpiar Pantalla;
	// Declaracioón de valores
	
	//Definimos una matriz tipo char
	Definir campo Como Caracter;;
	
	// Dimención de nuestra matriz
	Dimension campo[21,74];
	
	//Definicion de variables de uso del juego
	Definir opcion_e, inijug, finjueg, iniia, finia, pelX, pelY, gol, modX, modY, modia Como Entero;
	
	// Tamaño de la raqueta del jugador
	inijug <- 8;
	finjueg <- 12;
	
	// Tamaño de la raqueta de la IA
	iniia <- 6;
	finia <- 14;
	
	// Posicion donde se encuentra la pelota
	pelX <- 37;
	pelY <- 10;
	
	// Declaracion de variables para el Gameloop
	gol <- 0;
	
	// Modificadores hacia donde irá la pelota
	modX <- -1;
	modY <- 1;
	//Modificara con -1 cuando la IA choque alguna banda
	modia <- -1;
	
	// Llamado a funciones
	ccampo(campo);
	raqueta_jg(campo, inijug, finjueg);
	raqueta_ia(campo, iniia, finia);
	pelota(campo, pelX, pelY);
	
	//Selecion de modo de juego y opciones
	Repetir
		opcion_e <- menu();
		Limpiar Pantalla;
	Hasta Que opcion_e > 0  y opcion_e < 6
	
	// Acción según la selección
	Si opcion_e == 1 Entonces
		gameloop_jugador(campo, inijug, finjueg, iniia, finia, pelX, pelY, gol, modX, modY, modia);
	SiNo
		Si opcion_e == 2 Entonces
			gameloop_ia(campo, inijug, finjueg, iniia, finia, pelX, pelY, gol, modX, modY, modia);
		SiNo
			Si opcion_e == 3 Entonces
				nombres();
			SiNo
				Si opcion_e== 4 Entonces
					link();
				FinSi
			FinSi
		FinSi
	FinSi
	Escribir "********************************";
	Escribir "*** ¡Gracias por estar aqui! ***";
	Escribir "********************************";
	
FinSubProceso



Proceso pingpong_fix
	declaracion_variables();
FinProceso
