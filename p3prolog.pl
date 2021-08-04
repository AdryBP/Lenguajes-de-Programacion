/* ------------------------------------------------------------------------------------------ */

   /*
      ALUMNOS: Álvaro Bueno López - 45 18 87 64 C
               Adrián Bennasar Polzin - 41 54 23 28 G
   */

/* ------------------------------------------------------------------------------------------ */

                              /* PRÁCTICA PROLOG 2020-2021 */

/* ------------------------------------------------------------------------------------------ */

/* Función para escribir una lista.  */
escriureLlista([]).
escriureLlista([X|L1]):- write(X), write(" "), escriureLlista(L1).

/* Función para añadir dos listas y poner el resultado en una tercera lista */
afegir([],L,L).
afegir([X|L1],L2,[X|L3]):- afegir(L1,L2,L3).

/* Función para invertir una lista */
invertir([X],[X]).
invertir([X|L1],L2):- invertir(L1,L3), afegir(L3,[X],L2).

/* Función para invertir una lista y después escribirla. */
escriureLlistaInv([]).
escriureLlistaInv(L1):- invertir(L1, L2), escriureLlista(L2).


/* ------------------------------------------------------------------------------------------ */

/* Función para obtener el elemento de una posición en concreto de una lista. */
obtenirElementN([], _, []).
obtenirElementN([X|_], 1, X).
obtenirElementN([_|L], N, Y):- N1 is N-1, N1>0, obtenirElementN(L, N1, Y).


/* ------------------------------------------------------------------------------------------ */

/* Función para insertar un elemento en una posición diferente de la lista en cada iteración,
   hasta haber pasado por todas las posiciones. */
inserir(E,L,[E|L]).
inserir(E,[X|Y],[X|Z]):- inserir(E,Y,Z).

/* Función para generar todas las permutaciones posibles de una lista. */
permutació([],[]).
permutació([X|Y],Z):- permutació(Y,L),
          inserir(X,L,Z).

/* ------------------------------------------------------------------------------------------ */

/* Función para verificar si todos los elementos de una lista son diferentes. */
diferents([]).
diferents([A|L]):-not(member(A,L)), diferents(L).

/* ------------------------------------------------------------------------------------------ */

/* Escribe el elemento de la posición deseada de una lista. */
escriuElement(L1, N):- obtenirElementN(L1, N, E), write(E).

/* ------------------------------------------------------------------------------------------ */

/* Función para encontrar el primer elemento de una lista(sin contar el guión '-') */
primer([X], X).
primer([-,X|_], X):- !.
primer([X|_], X).

/* Función para, dados un elemento y una lista, verificar si el elemento es el primer
   elemento de la lista. */
esElPrimer(E, L):- primer(L, X), E = X.

/* Función para, dados un elemento y una lista, verificar si el elemento es el último
   elemento de la lista. */
esElDarrer(E, L):- invertir(L, L2), primer(L2, X), E = X, !.

/* Funciones para descartar las filas que no cumplen las restricciones del enunciado. */
fila1(LP, X, Y):- esElPrimer(X, LP), esElDarrer(Y, LP).
fila2(LP, X, Y):- esElPrimer(X, LP), esElDarrer(Y, LP).
fila3(LP, X, Y):- esElPrimer(X, LP), esElDarrer(Y, LP).
fila4(LP, X, Y):- esElPrimer(X, LP), esElDarrer(Y, LP).

/* Funciones para descartar las columnas que no cumplen las restricciones del enunciado.  */
columna1(LP, X, Y):- diferents(LP), esElPrimer(X, LP), esElDarrer(Y, LP).
columna2(LP, X, Y):- diferents(LP), esElPrimer(X, LP), esElDarrer(Y, LP).
columna3(LP, X, Y):- diferents(LP), esElPrimer(X, LP), esElDarrer(Y, LP).
columna4(LP, X, Y):- diferents(LP), esElPrimer(X, LP), esElDarrer(Y, LP).


/* ------------------------------------------------------------------------------------------------------------------------------------------ */

/* Función para generar un tablero dadas las 4 listas que establecen las restricciones a cumplir. */
lletres(L1, L2, L3, L4):-

                          /* Se miran las restricciones a cumplir por la fila 1, se generan todas las permutaciones y se eligen varias
                             filas solución a partir de las permutaciones que cumplen dichas restricciones. */
                          obtenirElementN(L4, 4, A),
                          obtenirElementN(L2, 1, B),
                          permutació([a,b,c,-], F1), fila1(F1, A, B), F1=[F11,F12,F13,F14],


                          /* Se miran las restricciones a cumplir por la fila 2, se generan todas las permutaciones y se eligen varias
                             filas solución a partir de las permutaciones que cumplen dichas restricciones. */
                          obtenirElementN(L4, 3, C),
                          obtenirElementN(L2, 2, D),
                          permutació([a,b,c,-], F2), fila2(F2, C, D), F2=[F21,F22,F23,F24],


                          /* Se miran las restricciones a cumplir por la fila 3, se generan todas las permutaciones y se eligen varias
                             filas solución a partir de las permutaciones que cumplen dichas restricciones. */
                          obtenirElementN(L4, 2, E),
                          obtenirElementN(L2, 3, F),
                          permutació([a,b,c,-], F3), fila3(F3, E, F), F3=[F31,F32,F33,F34],


                          /* Se miran las restricciones a cumplir por la fila 4, se generan todas las permutaciones y se eligen varias
                             filas solución a partir de las permutaciones que cumplen dichas restricciones. */
                          obtenirElementN(L4, 1, G),
                          obtenirElementN(L2, 4, H),
                          permutació([a,b,c,-], F4), fila4(F4, G, H), F4=[F41,F42,F43,F44],


                          /* Se generan las posibles primeras columnas a partir del primer elemento de cada fila solución, y se mira
                             cuales cumplen las restricciones, para decidir cuáles son las filas solución definitivas. */
                          C1=[F11, F21, F31, F41],
                          obtenirElementN(L1, 1, I),
                          obtenirElementN(L3, 4, J),
                          columna1(C1, I, J),

                          /* Se generan las posibles segundas columnas a partir del seundo elemento de cada fila solución, y se mira
                             cuales cumplen las restricciones, para decidir cuáles son las filas solución definitivas. */
                          C2=[F12, F22, F32, F42],
                          obtenirElementN(L1, 2, K),
                          obtenirElementN(L3, 3, L),
                          columna2(C2, K, L),

                          /* Se generan las posibles terceras columnas a partir del tercer elemento de cada fila solución, y se mira
                             cuales cumplen las restricciones, para decidir cuáles son las filas solución definitivas. */
                          C3=[F13, F23, F33, F43],
                          obtenirElementN(L1, 3, M),
                          obtenirElementN(L3, 2, N),
                          columna3(C3, M, N),

                          /* Se generan las posibles cuartas columnas a partir del cuarto elemento de cada fila solución, y se mira
                             cuales cumplen las restricciones, para decidir cuáles son las filas solución definitivas. */
                          C4=[F14, F24, F34, F44],
                          obtenirElementN(L1, 4, O),
                          obtenirElementN(L3, 1, P),
                          columna4(C4, O, P),

                          /* Se imprime el tablero solución. */
                          write("    "), escriureLlista(L1), nl,
                          escriuElement(L4, 4), write(" "), write(F1), write(" "), escriuElement(L2, 1), nl,
                          escriuElement(L4, 3), write(" "), write(F2), write(" "), escriuElement(L2, 2), nl,
                          escriuElement(L4, 2), write(" "), write(F3), write(" "), escriuElement(L2, 3), nl,
                          escriuElement(L4, 1), write(" "), write(F4), write(" "), escriuElement(L2, 4), nl,
                          write("    "), escriureLlistaInv(L3), nl,
                          nl.

/* -----------------------------------------------------------2DA PARTE------------------------------------------------------------------------- */

/* Calcula todos los tableros posibles sin las restricciones del enunciado(exceptuando que no puede haber el mismo elemento más de una vez en una
   misma fila o columna) */
solCapRestriccio:-  permutació([a,b,c,-], F1), F1=[F11,F12,F13,F14],
                    permutació([a,b,c,-], F2), F2=[F21,F22,F23,F24],
                    permutació([a,b,c,-], F3), F3=[F31,F32,F33,F34],
                    permutació([a,b,c,-], F4), F4=[F41,F42,F43,F44],

                    C1=[F11, F21, F31, F41],
                    diferents(C1),

                    C2=[F12, F22, F32, F42],
                    diferents(C2),

                    C3=[F13, F23, F33, F43],
                    diferents(C3),

                    C4=[F14, F24, F34, F44],
                    diferents(C4),

                    comptador(X), X1 is X + 1,
                    retract(comptador(X)),
                    asserta(comptador(X1)),
                    fail.

/* Función para contar e imprimir el número de soluciones que se encuentran a través de la función solCapRestriccio. */
comptar:- asserta(comptador(0)), solCapRestriccio.
comptar:- nl, write("Hi ha "),
          comptador(X),
          write(X), write(" resultats."),!.


