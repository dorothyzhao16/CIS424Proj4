### Question 1 ###
male(mushu).
male(tangdee).
female(mulan).
female(beumei).
female(gugu).
father(baba,mushu).
father(baba,mulan).
father(yeye,baba).
father(yeye,gugu).
father(yeye,susu).
father(susu,tangdee).
father(zengzufu,yeye).
father(jojo,beumei).
mother(mama,mushu).
mother(mama,mulan).
mother(popo,mama).
mother(popo,jojo).
male(X) :- father(X,_).
male(X) :- brother(X,_).
male(X) :- child(X,_).
female(X) :- mother(X,_).
female(X) :- aunt(X,_).
female(X) :- child(X,_).
aunt(X,Y) :- female(X), parent(Z,Y), sister(X,Z). 
child(Y,X) :- parent(X,Y).
sibling(X,Y) :- father(Z,W), father(Z,Y), mother(W,X), mother(W,Y), not(X = Y).
brother(X,Y) :- male(X, sibling(X,Y).
sister(X,Y) :- female(X), sibling(X,Y).
parent(X,Y) :- mother(X,Y).
parent(X,Y) :- father(X,Y).
granddaughter(X,Z) :- female(X), child(X,Y), child(Y,Z).
descendant(X,Y) :- granddaughter(X,Y).
descendant(X,Y) :- child(X,Y).

### Question 2 ###
final(H, [ H ]).
final([ _ | T ], H) :- final(T,H).

### Question 3 ###
match(X,[X|T]).
ns(S,X0) :- match(x,S,X0), match(X,S).
nx(X,X0) :- match(x,S,X0), match(X,S) .
nx(X,X0) :- match(Y,S).
ny(Y,X0) :- match(y,S,X0), match(Z,S).
nz([ ],[ ]) :- [ ]
nz(Z,X0) :- match(y,S,X0), match(Z,S).

### Question 4 ###
democrat([a,b,c,d,e]).
dem_candidate(X) :- member(X, democrats), tests(X)
dem_candidate(X)
member(a,[a,b,c,d,e])
a(X, Y) :- b(X), !, c(Y)
### OR ###
dem_candidate(X) :- democrat(L), member_cut(X, L)
member_cut(Elm, [Elm | _]) :- !
### Using trace. ###
