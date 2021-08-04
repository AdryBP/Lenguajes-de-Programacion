
;alumno: Adrian Bennasar Polzin

;calculo de las componentes del escenario
(defun x1x2 ()
(move 0 0)
(putprop 'escenari 0 'x1) ;x1
(putprop 'escenari (+ 100 (random 300)) 'x2) ;x2
)

(defun x3x4 ()
(putprop 'escenari (+ (+ 20 (get 'escenari 'x2))(random 130)) 'x3) ;x3
(putprop 'escenari 640 'x4) ;x4
)

(defun y1y2y3 ()
(putprop 'escenari (random 300) 'y2) ;y2
(putprop 'escenari (+ (get 'escenari 'y2) (random (- 300 (get 'escenari 'y2)
 ))) 'y1) ;y1
(putprop 'escenari (random (get 'escenari 'y1)) 'y3) ;y3
)

(defun viento()
(putprop 'escenari (- 5 (random 10)) 'forcaVent) ;forcaVent
)



;calculo de las componentes del cano1
(defun cano ()
(putprop 'cano 20 'dimensioX)

(putprop 'cano 10 'dimensioY)

(putprop 'cano (random (get 'escenari 'x2)) 'posicioX)

(cond ((>= (+ (get 'cano 'posicioX)(get 'cano 'dimensioX)) 
		   (get 'escenari 'x2))
	        (putprop 'cano (- (get 'cano 'posicioX) 20) 'posicioX)
      ) 

)

(putprop 'cano (get 'escenari 'y2) 'posicioY)

(putprop 'cano 45 'angle)

		

)

;calculo de las componentes del cano2
(defun cano2 ()
(putprop 'cano2 20 'dimensioX)

(putprop 'cano2 10 'dimensioY)

(putprop 'cano2 (+(get 'escenari 'x3)(random (- (get 'escenari 'x4)
(get 'escenari 'x3)))) 'posicioX)

(putprop 'cano2 (get 'escenari 'y3) 'posicioY)

(cond ((>= (+ (get 'cano2 'posicioX)(get 'cano2 'dimensioX)) 
		   (get 'escenari 'x4))
		   
	          (putprop 'cano2 (- (get 'cano2 'posicioX) 20) 'posicioX)
      ) 

)

(cond ((<= (+ (get 'cano2 'posicioX) (- 0 (get 'cano2 'dimensioX))) 
		   (get 'escenari 'x3))
		   
	          (putprop 'cano2 (+ (get 'cano2 'posicioX) 30) 'posicioX)
      ) 

)

(putprop 'cano2 135 'angle)


)
;seccion x1<->x2

(defun pintax1x2 ()
(color 0 0 0 255 255 255)
(drawrel (get 'escenari 'x2) 0)
(drawrel 0 (get 'escenari 'y2))
(drawrel  (- 0 (get 'escenari 'x2)) 0)
(drawrel  0 (- 0 (get 'escenari 'y2)))
)
;seccion x2<->x3

(defun pintax2x3 ()
(color 0 0 0 255 255 255)
(move 0 0)
(drawrel (get 'escenari 'x3) 0)
(drawrel 0 (get 'escenari 'y1))
(drawrel (- 0 (- (get 'escenari 'x3)(get 'escenari 'x2)))0)
(drawrel 0 (- 0 (get 'escenari 'y1)))
)

;seccion x3<->x4

(defun pintax3x4 ()
(color 0 0 0 255 255 255)
(move 0 0)
(drawrel (get 'escenari 'x4) 0)
(drawrel 0 (get 'escenari 'y3))
(drawrel (- 0 (- (get 'escenari 'x4)(get 'escenari 'x3)))0)
(drawrel 0 (- 0 (get 'escenari 'y3)))
)

;bordes exteriores

(defun pintaBordes ()
(color 0 0 0 255 255 255)
(move 0 0)
(drawrel 640 0)
(drawrel 0 340)
(drawrel (- 0 640)0)
(drawrel 0 (- 0 340))
)
;pintar cano 1

(defun pintaCano ()
	;pinta la base
	(color 0 0 0 255 255 255)
	(move (get 'cano 'posicioX)(get 'cano 'posicioY))
	(drawrel 0 (get 'cano 'dimensioY))
	(drawrel (get 'cano 'dimensioX) 0)
	(drawrel 0 (- 0 (get 'cano 'dimensioY)))
)

;convertir angulos a radianes

(defun anguloToRadian(angulo)
   (/ (* angulo 3.14) 180)
)

;para pintar un cuadrado relleno
(defun quadratRelleno (n)
    (cond ((> n 0)
	            (drawrel 30 0)
	            (moverel ( - 0 30) 1)
				(quadratRelleno (- n 1))
		  )
	
		  (t
				(move 0 0)
		  )
	)
)

(defun pintaDiagonalCano (anguloGrados)
  
   ;pinta la nova diagonal
   (color 0 0 0 255 255 255)
   (move (get 'cano 'posicioX)(get 'cano 'posicioY))
   (moverel 0 (get 'cano 'dimensioY))
   (moverel (/ (get 'cano 'dimensioX) 2) 0 )
   (drawrel (realpart(round (*(cos (anguloToRadian anguloGrados))15)))
			(realpart(round (*(sin (anguloToRadian anguloGrados))15))))
)

;pintar cano 2

(defun pintaCano2 ()
;pinta la base
	(color 0 0 0 255 255 255)
	(move (get 'cano2 'posicioX)(get 'cano2 'posicioY))
	(drawrel 0 (get 'cano2 'dimensioY))
	(drawrel (get 'cano2 'dimensioX) 0)
	(drawrel 0 (- 0 (get 'cano2 'dimensioY)))
)

(defun pintaDiagonalCano2 (anguloGrados)
  
   ;pinta la nova diagonal
   (color 0 0 0 255 255 255)
   (move (get 'cano2 'posicioX)(get 'cano2 'posicioY))
   (moverel 0 (get 'cano2 'dimensioY))
   (moverel (/ (get 'cano2 'dimensioX) 2) 0 )
   (drawrel (realpart(round (*(cos (anguloToRadian anguloGrados))15)))
			(realpart(round (*(sin (anguloToRadian anguloGrados))15))))
)

;-----------------------------------

;funciones relacionadas con pintar el viento

(defun pintaColasFlechaDerecha(iteraciones)
	(cond ((>= iteraciones 1)
				(drawrel 0 (- 0 10))
				(moverel 4 10)
				(pintaColasFlechaDerecha(- iteraciones 1))
		  )	
		  (t 
		        (move 0 0)
		  )
    )
)

(defun pintaColasFlechaIzquierda(iteraciones)
	(cond ((< iteraciones 0)
				(drawrel 0 (- 0 10))
				(moverel (- 0 4) 10)
				(pintaColasFlechaIzquierda(+ iteraciones 1))
		  )	
		  (t 
		        (move 0 0)
		  )
    )
)

(defun pintaFlechaEsquerra(forcaVent)
	
	(cond ((= 0 forcaVent) 
	            (move 0 0)
		  )
		  (t
			    ;flechaBase
			   (move 20 320)
			   (drawrel 40 0)
	           (drawrel (- 0 7) 7)
	           (move 60 320)
	           (drawrel (- 0 7) (- 0 7))
	
	           ;colasFlecha
	           (move 20 320)
	           (pintaColasFlechaDerecha forcaVent)
		  )
	)	
)

(defun pintaFlechaDreta(forcaVent)

	(cond ((= 0 forcaVent)
	            (move 0 0)
		  )
		  (t
		        ;flechaBase
			   (move 55 320)
			   (drawrel (- 0 40) 0)
			   (drawrel 7 7)
			   (move 15 320)
			   (drawrel 7 (- 0 7))
	
			   ;colasFlecha
			   (move 55 320)
			   (pintaColasFlechaIzquierda forcaVent)
		  )
	) 
)

(defun pintaVent(forcaVent)
		(cond ((> 0 forcaVent)(pintaFlechaDreta forcaVent))
		      ((< 0 forcaVent)(pintaFlechaEsquerra forcaVent))
			  (t(move 0 0)))
)

;----------------------------------------------------------------

;para repintar el mismo escenario, se usa al modificar angulo o disparar
(defun repintaMateixEscenari ()
 
	(cls)
	(move 0 0)
	(pintaBordes)	
 
 ;colorea rectangulo suelo izquierda
 (coloretjaRectangle (get 'escenari 'x1) 0 (get 'escenari 'x2) 
					 (get 'escenari 'y2) (get 'escenari 'x1) 0 0 255 0)
	
 ;colorea pared intermedia	
 (coloretjaRectangle (get 'escenari 'x2) 0 (get 'escenari 'x3) 
					 (get 'escenari 'y1) (get 'escenari 'x2) 0 145 78 36)
 
 ;colorea rectangulo suelo derecha	
 (coloretjaRectangle (get 'escenari 'x3) 0 (get 'escenari 'x4) 
					 (get 'escenari 'y3) (get 'escenari 'x3) 0 0 255 0)
					 
 
 ;colorea la parte izquierda del cielo
 (coloretjaRectangle (get 'escenari 'x1) (get 'escenari 'y2) 
					 (get 'escenari 'x2) 340 (get 'escenari 'x1) 
					 (+ (get 'escenari 'y2) 1) 74 172 199)
					 
	
 ;colorea la parte central del cielo
 (coloretjaRectangle (get 'escenari 'x2) (get 'escenari 'y1) 
					 (get 'escenari 'x3) 340 (get 'escenari 'x2) 
					 (+ (get 'escenari 'y1) 1) 74 172 199)
					 
 ;colorea la parte derecha del cielo
 (coloretjaRectangle (get 'escenari 'x3) (get 'escenari 'y3) 
					 (get 'escenari 'x4) 340 (get 'escenari 'x3) 
					 (+ (get 'escenari 'y3) 1) 74 172 199)
					 				 
		 
 (pintaCano)
 (pintaDiagonalCano (get 'cano 'angle))
 (pintaCano2)
 (pintaDiagonalCano2 (get 'cano2 'angle))
 (pintaVent (get 'escenari 'forcaVent))
 
 (pintax1x2)
 (pintax2x3)
 (pintax3x4)
 
   ;colorea cañon 1
 (coloretjaRectangle (get 'cano 'posicioX) 
					 (get 'cano 'posicioY) 
					 (+ (get 'cano 'posicioX) (get 'cano 'dimensioX)) 
					 (+ (get 'cano 'posicioY) (get 'cano 'dimensioY)) 
					 (get 'cano 'posicioX) 
					 (get 'cano 'posicioY) 
					 0 
					 0 
					 0
 )
 
  ;colorea cañon 2
  (coloretjaRectangle (get 'cano2 'posicioX) 
					 (get 'cano2 'posicioY) 
					 (+ (get 'cano2 'posicioX) (get 'cano2 'dimensioX)) 
					 (+ (get 'cano2 'posicioY) (get 'cano2 'dimensioY)) 
					 (get 'cano2 'posicioX) 
					 (+ (get 'cano2 'posicioY) 1) 
					 0 
					 0 
					 0
 )
 
)

;funcion para bajar el angulo de un cano
(defun baixa (cano graus)
	(cond ((equal cano 'cano)
				(putprop cano (- (get cano 'angle) graus) 
				'angle))
		  ((equal cano 'cano2)
			    (putprop cano (+ (get cano 'angle) graus) 
				'angle))
	)
	
	(repintaMateixEscenari)
	(pintaDiagonalCano (get 'cano 'angle))
	(pintaDiagonalCano2 (get 'cano2 'angle))

)

;funcion para subir el angulo de un cano
(defun puja (cano graus)
	(cond ((equal cano 'cano)
				(putprop cano (+ (get cano 'angle) graus) 
				'angle))
		  ((equal cano 'cano2)
			    (putprop cano (- (get cano 'angle) graus) 
				'angle))
	)
	
	(repintaMateixEscenari)
	(pintaDiagonalCano (get 'cano 'angle))
	(pintaDiagonalCano2 (get 'cano2 'angle))
	
)

;------------------------------------------------------------------

;funcion que inicializa algunas componentes del proyectil
(defun inicialitzaProjectil (cano velocitat)
	
	(putprop 'projectil velocitat 'Vo)
	
	(putprop 'projectil (realpart (round(*(get 'projectil 'Vo)
						 (cos (anguloToRadian (get cano 'angle)))))) 'Vox)
						 
	(putprop 'projectil (realpart (round(*(get 'projectil 'Vo)
						 (sin (anguloToRadian (get cano 'angle)))))) 'Voy)
						 
	(putprop cano (+ (realpart
	(round (*(cos (anguloToRadian (get cano 'angle)))15)))
	(+ (get cano 'posicioX)
	(/ (get cano 'dimensioX) 2))) 'puntax)
	
	(putprop cano (+ (realpart
	(round (*(sin (anguloToRadian (get cano 'angle)))15))) 
	(+ (get cano 'posicioY)(get cano 'dimensioY))) 'puntay)
							  		 			
)


;para comprobar si la coordenada xy del proyectil colisiona con un cano
(defun colisioAmbCano (cano x y)

	(cond ((dentroDeRectangulo x y 
							  (get cano 'posicioX)
							  (get cano 'posicioY)
							  (+ (get cano 'posicioX)(get cano 'dimensioX))
							  (+ (get cano 'posicioY)(get cano 'dimensioY)))t)
	)

)

(defun colisiona (cano x y)

	(cond ((equal cano 'cano)(colisioAmbCano 'cano2 x y))
		  ((equal cano 'cano2)(colisioAmbCano 'cano x y))
    )
	
)

;para ilustrar la colision del proyectil con un cano
(defun pintaColisio (cano)

	(color 255 0 0 255 255 255)
	(move (get cano 'posicioX)(get cano 'posicioY))
	(moverel 0 (get cano 'dimensioY))
	(quadratRelleno 20)
	
)


(defun explota (cano)

	(cond ((equal cano 'cano)(pintaColisio 'cano2))
		  ((equal cano 'cano2)(pintaColisio 'cano))	
	)
	
)


;funcion que mira si una coordenada xy esta dentro de un rectangulo
(defun dentroDeRectangulo (x y a b c d)

	(cond ((and (> x a)(< x c)(> y b)(< y d))t))

)

;funcion para mirar si hay colision con el suelo o pared intermedia
(defun tocaParedes (x y)

	(cond ((or (dentroDeRectangulo x y 0 0 (get 'escenari 'x2)
			   (get 'escenari 'y2))
			   (dentroDeRectangulo x y (get 'escenari 'x2) 0 
			   (get 'escenari 'x3) (get 'escenari 'y1))
			   (dentroDeRectangulo x y (get 'escenari 'x3) 0 
			   (get 'escenari 'x4) (get 'escenari 'y3)))t)
		  (t nil)   
	)

)

;se van pintando las xy del proyectil y cada vez se actualizan
(defun pintaProjectil (cano x y vx vy temps)

 (draw (realpart(round x)) (realpart(round y)) )
			
 (cond ((tocaParedes x y) t) 
	   ((>= x 640) t)	
	   ((<= x 0) t)
       ((colisiona cano x y)(explota cano))	
	   (t(pintaProjectil 
		   cano 
		   (+ x (* vx (+ temps 0.02))) 
		   (+ y (+(* vy (+ temps 0.02))
		   (*(/ 1 2)(*(- 0 9.8)(* (+ temps 0.02) (+ temps 0.02))))))
		   (+(get 'projectil 'Vox)(*(get 'escenari 'forcaVent)(+ temps 0.02)))
		   (+ (get 'projectil 'Voy)(*(- 0 9.8)(+ temps 0.02)))
		   (+ temps 0.02)
		 )
	   )
 )						 			
)		  
		

;para simular el disparo de un cano con una velocidad inicial
(defun simula (cano velocitat)
	
	(repintaMateixEscenari)
		  
	;(calculapunta cano)
	
	(inicialitzaProjectil cano velocitat)
	(move (get cano 'puntax)(get cano 'puntay))
	(pintaProjectil 
	  cano 
	 (get cano 'puntax)
	 (get cano 'puntay)
	 (get 'projectil 'Vox)
	 (get 'projectil 'Voy)
	  0
	)
	
	(color 0 0 0 255 255 255)
)


;para rellenar con color un rectangulo
(defun coloretjaRectangle (a b c d x y R G B)

	(color R G B 255 255 255)
	
	(cond ((< y d)
			
			(move x y)
			(drawrel (- c a) 0)
			(coloretjaRectangle a b c d x (+ y 1) R G B)
	
		  )
	
	)
	
)

;------------------------------------------------------------------

;funcion para pintar el escenario
(defun pinta ()
 (cls)
 (x1x2)
 (x3x4)
 (y1y2y3)
 (viento)
 (cano)
 (cano2)
 (pintaBordes)	
 
 ;colorea rectangulo suelo izquierda
 (coloretjaRectangle (get 'escenari 'x1) 0 (get 'escenari 'x2) 
					 (get 'escenari 'y2) (get 'escenari 'x1) 0 0 255 0)
	
 ;colorea pared intermedia	
 (coloretjaRectangle (get 'escenari 'x2) 0 (get 'escenari 'x3) 
					 (get 'escenari 'y1) (get 'escenari 'x2) 0 145 78 36)
 
 ;colorea rectangulo suelo derecha	
 (coloretjaRectangle (get 'escenari 'x3) 0 (get 'escenari 'x4) 
					 (get 'escenari 'y3) (get 'escenari 'x3) 0 0 255 0)
					 
 
 ;colorea la parte izquierda del cielo
 (coloretjaRectangle (get 'escenari 'x1) (get 'escenari 'y2) 
					 (get 'escenari 'x2) 340 (get 'escenari 'x1) 
					 (+ (get 'escenari 'y2) 1) 74 172 199)
					 
	
 ;colorea la parte central del cielo
 (coloretjaRectangle (get 'escenari 'x2) (get 'escenari 'y1) 
					 (get 'escenari 'x3) 340 (get 'escenari 'x2) 
					 (+ (get 'escenari 'y1) 1) 74 172 199)
					 
 ;colorea la parte derecha del cielo
 (coloretjaRectangle (get 'escenari 'x3) (get 'escenari 'y3) 
					 (get 'escenari 'x4) 340 (get 'escenari 'x3) 
					 (+ (get 'escenari 'y3) 1) 74 172 199)
					 				 
		 
 (pintaCano)
 (pintaDiagonalCano (get 'cano 'angle))
 (pintaCano2)
 (pintaDiagonalCano2 (get 'cano2 'angle))
 (pintaVent (get 'escenari 'forcaVent))
 
 (pintax1x2)
 (pintax2x3)
 (pintax3x4)
 
   ;colorea cañon 1
 (coloretjaRectangle (get 'cano 'posicioX) 
					 (get 'cano 'posicioY) 
					 (+ (get 'cano 'posicioX) (get 'cano 'dimensioX)) 
					 (+ (get 'cano 'posicioY) (get 'cano 'dimensioY)) 
					 (get 'cano 'posicioX) 
					 (get 'cano 'posicioY) 
					 0 
					 0 
					 0
 )
 
  ;colorea cañon 2
  (coloretjaRectangle (get 'cano2 'posicioX) 
					 (get 'cano2 'posicioY) 
					 (+ (get 'cano2 'posicioX) (get 'cano2 'dimensioX)) 
					 (+ (get 'cano2 'posicioY) (get 'cano2 'dimensioY)) 
					 (get 'cano2 'posicioX) 
					 (+ (get 'cano2 'posicioY) 1) 
					 0 
					 0 
					 0
 )
 
 (repetir (eval(read)))
 
)

;para evaluar repetidamente la entrada por teclado
(defun repetir (x)

	(goto-xy 0 0)
	(cleol)
	(repetir (eval(read)))

)

