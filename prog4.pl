%Problem1
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
aunt(X,Y) :- parent(Z, Y), sibling(Z, X).
child(Y,X) :- parent(X,Y).
sibling(X,Y) :- father(Z, X), father(Z, Y), not(X=Y).
sibling(X,Y) :- mother(W, X), mother(W, Y), not(X=Y).
brother(X,Y) :- sibling(X,Y), male(X).
sister(X,Y) :- sibling(X,Y), female(X).
parent(X,Y) :- mother(X,Y).
parent(X,Y) :- father(X,Y).
granddaughter(X,Z) :- female(X), child(X,Y), child(Y,Z).
descendant(X,Y) :- (father(Y,X); mother(Y,X)); 
		(father(Y,Z); mother(Y,Z)), descendant(X,Z).

%Problem2
final(H, [H]).
final(H, [_ | T]) :- final(H, T).

%Problem3
match(X,[X|T], T).

z([],[]).

s(X0, X) :- match(x,X0, X1), ns(X1, X).
ns(X0, X) :-  match(x,X0, X1), ns(X1, X).
ns(X0, X) :- ny(X0, X).
ny(X0, X) :- match(y, X0, X1), nz(X1, X).
nz(X0, X) :- z(X0,X).
nz(X0, X) :- match(y, X0, X1), nz(X1, X).

%Problem4
alive([beto, hillary, barack, bernie, bill]).
dems([beto, hillary, barack, bernie, bill]). 
formerPres([barack, bill]).

tests(Candidate) :- (alive(NotDeadList), member(Candidate, NotDeadList)),
(formerPres(FPList), member(Candidate, FPList)).

member(Elm, [_ | List]) :- member(Elm, List).

dem_candidate(Candidate) :- dems(DemocratList), member(Candidate, DemocratList), tests(Candidate). 


