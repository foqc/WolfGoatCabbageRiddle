
meta(estado(izq, izq, izq, izq)).
direccion(izq, der).
direccion(der, izq).

movimiento(estado(M, CB, LB, CL), estado(M1, CB, LB, CL)):- direccion(M, M1).
movimiento(estado(M, CB, M, CL), estado(M1, CB, M1, CL)):- direccion(M, M1).
movimiento(estado(M, M, LB, CL), estado(M1, M1, LB, CL)):- direccion(M, M1).
movimiento(estado(M, CB, LB, M), estado(M1, CB, LB, M1)):- direccion(M, M1).

prohibido(estado(M, M1, M1, _)):- direccion(M, M1).
prohibido(estado(M, M1, _, M1)):- direccion(M, M1).

miembro(X, [X|_]).
miembro(X, [_|L]):- miembro(X, L).

solucion([E | L], [E | L]) :- meta(E).
solucion([E | L], LS):- movimiento(E, EP), not(prohibido(EP)), not(miembro(EP, L)), solucion([EP, E | L], LS).
% to run: solucion([estado(der, der, der, der)], L)
