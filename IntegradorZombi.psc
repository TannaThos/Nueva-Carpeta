


Funcion ingresoGen(GenZ por referencia,m) // Esta funcion guarda la palabra, la desglosa por letra y la guarda en la matriz.// Funcion 1
	Definir i, j, cont como entero
	Definir palabra como cadena
	cont = 0
	Hacer
		Escribir " Ingrese la palabra, de ",m*m, " dígitos" // m*m es el fromato de la matriz ( 2*2, 3*3, y la palabra tiene que tener ese largo, ( 4, 0 9 en este caso)
		Leer palabra
		palabra = Mayusculas(palabra) // Esto es para que lo cambie a mayúsculas el programa
	Mientras Que Longitud(palabra) <> m*m // Si la palabra es diferente a m*m, es largo de la matiz, debe volver a pedir una nueva palabra hasta que coincida con la matriz
	Para i = 0 hasta m-1  // Este bucle lee la ´palabra letra por letra  con la funcion subcadena y la coloca luego en la matriz, con otra funcion.
		Para j = 0 hasta m-1 
			GenZ(i,j) = Subcadena(palabra, cont, cont) // la matriz se llama GenZ. Y m-1 es para obtener el último lugar de la matriz, porque la matriz comienza en 1, no así el índice en o
			cont = cont + 1 // Es para que de 0,0 que comienza, vaya de uno en uno, 0,1,0,2, 0,3...1,0,1,1... así hasta finalizar las vueltas y así se guarda letra por letra en la matriz
		FinPara
		Fin Para
FinFuncion

Funcion mostrarGen(GenZ,m) // Funcion 2
	Definir i,j como entero	
	Limpiar pantalla
	Escribir " El gen ingresado es: "
	Escribir ""
	Para i = 0 hasta m-1 
		Para j = 0 hasta m-1 
			Escribir  Sin Saltar "[", GenZ(i,j), "]" // Al poner sin saltar, escribe  todas las columnas sin saltar
			FinPara
		Escribir "" // Esto es para saltar de fila en fila " " y  ***después *** del fin para.
	Fin Para
FinFuncion
Funcion buscarCoincidencia(GenZ, m) // Funcion 3
	Definir i, j, contDiag1, contDiag2 Como Entero
	Definir validacionDiagonal2, validacionDiagonal como cadena
	Dimension validacionDiagonal(m), validacionDiagonal2(m) // vectores para guardar las diagonales, deben ser del mismo tamaño que la matriz m, ( si la matriz es 3*3, cada vector
	// será de 3 índices ( 1,2,3), m*m es la matriz, es cuadrada. 
	contDiag1=0
	contDiag2=0
	Escribir " "
	Para i = 0 hasta m-1 
		Para j=0 Hasta m-1
			Si  i = j Entonces
				validacionDiagonal(i) = GenZ(i,j) // Es el dato que tiene i,  estamos guardando en el vector, solo cuando i=j, diagonal de I a D
			FinSi
				
			Si i + j = m-1 Entonces
				validacionDiagonal2(i)= GenZ(i,j) // Guarda los datos de j, la diagonal de D a I la fórmula es i+j = m-1
			FinSi
			
		FinPara
	Fin Para
	
	Para i = 0 hasta m-1 
		Si  validacionDiagonal(i)= GenZ(0,0) Entonces
			contDiag1= contDiag1 + 1
		Fin Si	
		Si	validacionDiagonal2(i)= GenZ(0,m-1) Entonces
			contDiag2 = ContDiag2 + 1	
		Fin Si
	Fin Para
	Si contDiag1 = m Y contDiag2 = m
		Escribir " Se detectó el GenZ, con las letras " , GenZ(0,0) " y " GenZ(0,m-1)
		
	SiNo
		Escribir " No se detectó el GenZ las diagonales son distintas "
	FinSi
	
FinFuncion
Algoritmo IntegradorZombi
	Definir i, j, m, contDiag1, contDiag2, validacionDiagonal, cont como entero
	Definir GenZ como cadena
	Escribir " Ingrese el tamaño de la matriz:"
	Leer m
	Dimension GenZ(m,m)
	ingresoGen(GenZ,m)
	mostrarGen(GenZ,m)
	buscarCoincidencia(GenZ, m)
				
	FinAlgoritmo
