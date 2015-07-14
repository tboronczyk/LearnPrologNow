:- module(dcg,[s/3]).

s(s(NP,VP)) --> np(NP,X,Y,subject), vp(VP,X,Y).

np(np(DET,NBAR,PP),X,Y,_) --> det(DET,X), nbar(NBAR,X,Y), pp(PP).
np(np(DET,NBAR),X,Y,_) --> det(DET,X), nbar(NBAR,X,Y).
np(np(PRO),X,Y,Z) --> pro(PRO,X,Y,Z).

vp(vp(V),X,Y) --> v(V,X,Y).
vp(vp(V,NP),X,Y) --> v(V,X,Y), np(NP,_,_,object).

nbar(nbar(JP),X,3) --> jp(JP,X).

pp(pp(PREP,NP)) --> prep(PREP), np(NP,_,_,object).

jp(N,X) --> n(N,X).
jp(jp(ADJ,JP),X) --> adj(ADJ), jp(JP,X).

det(det(DET),X) --> [DET], {lex(DET,det,X)}.

pro(pro(PRO),X,Y,Z) --> [PRO], {lex(PRO,pro,X,Y,Z)}.

v(v(V),X,Y) --> [V], {lex(V,v,X,Y)}.

prep(prep(PREP)) --> [PREP], {lex(PREP,prep)}.

n(n(N),X) --> [N], {lex(N,n,X)}.

adj(adj(ADJ)) --> [ADJ], {lex(ADJ,adj)}.

lex(i,pro,singular,1,subject).
lex(you,pro,singular,2,subject).
lex(he,pro,singular,3,subject).
lex(she,pro,singular,3,subject).
lex(it,pro,singular,3,subject).

lex(we,pro,plural,1,subject).
lex(you,pro,plural,2,subject).
lex(they,pro,plural,3,subject).

lex(me,pro,singular,1,object).
lex(you,pro,singular,2,object).
lex(him,pro,singular,3,object).
lex(her,pro,singular,3,object).
lex(it,pro,singular,3,object).

lex(us,pro,plural,1,object).
lex(you,pro,plural,2,object).
lex(them,pro,plural,3,object).

lex(shoot,v,singular,1).
lex(shoot,v,singular,2).
lex(shoots,v,singular,3).

lex(shoot,v,plural,_).

lex(the,det,_).
lex(a,det,singular).

lex(man,n,singular).
lex(woman,n,singular).
lex(table,n,singular).
lex(cow,n,singular).
lex(shower,n,singular).

lex(men,n,plural).
lex(women,n,plural).

lex(on,prep).
lex(under,prep).

lex(small,adj).
lex(frightened,adj).
lex(big,adj).
lex(fat,adj).
