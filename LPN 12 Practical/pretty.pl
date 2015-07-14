:- module(pretty,[pptree/2]).

pptree(OS,s(NP,VP)) :- 
    write(OS,'s('), nl(OS),
    tab(OS,4), pptree(OS,NP,4), nl(OS),
    tab(OS,4), pptree(OS,VP,4),
    write(OS,')').

pptree(OS,det(DET)) :-
    write(OS,'det('),
    write(OS,DET),
    write(OS,')').

pptree(OS,pro(PRO)) :-
    write(OS,'pro('),
    write(OS,PRO),
    write(OS,')').

pptree(OS,v(V)) :-
    write(OS,'v('),
    write(OS,V),
    write(OS,')').

pptree(OS,prep(PREP)) :-
    write(OS,'prep('),
    write(OS,PREP),
    write(OS,')').

pptree(OS,adj(ADJ)) :-
    write(OS,'adj('),
    write(OS,ADJ),
    write(OS,')').

pptree(OS,n(N),_) :-
    write(OS,'n('),
    write(OS,N),
    write(OS,')').

pptree(OS,np(DET,NBAR,PP),I) :-
    Indent is I+4,
    write(OS,'np('), nl(OS),
    tab(OS,Indent), pptree(OS,DET), nl(OS), 
    tab(OS,Indent), pptree(OS,NBAR,Indent), nl(OS),
    tab(OS,Indent), pptree(OS,PP,Indent),
    write(OS,')').

pptree(OS,np(DET,NBAR),I) :-
    Indent is I+4,
    write(OS,'np('), nl(OS),
    tab(OS,Indent), pptree(OS,DET), nl(OS), 
    tab(OS,Indent), pptree(OS,NBAR,Indent),
    write(OS,')').

pptree(OS,np(PRO),I) :-
    Indent is I+4,
    write(OS,'np('), nl(OS),
    tab(OS,Indent), pptree(OS,PRO),
    write(OS,')').

pptree(OS,vp(V),I) :-
    Indent is I+4,
    write(OS,'vp('), nl(OS),
    tab(OS,Indent), pptree(OS,V),
    write(OS,')').

pptree(OS,vp(V,NP),I) :-
    Indent is I+4,
    write(OS,'vp('), nl(OS),
    tab(OS,Indent), pptree(OS,V), nl(OS),
    tab(OS,Indent), pptree(OS,NP,Indent),
    write(OS,')').

pptree(OS,nbar(JP),I) :-
    Indent is I+4,
    write(OS,'nbar('), nl(OS),
    tab(OS,Indent), pptree(OS,JP,Indent),
    write(OS,')').

pptree(OS,pp(PREP,NP),I) :-
    Indent is I+4,
    write(OS,'pp('), nl(OS),
    tab(OS,Indent), pptree(OS,PREP), nl(OS),
    tab(OS,Indent), pptree(OS,NP,Indent),
    write(OS,')').

pptree(OS,jp(ADJ,JP),I) :-
    Indent is I+4,
    write(OS,'jp('), nl(OS),
    tab(OS,Indent), pptree(OS,ADJ), nl(OS),
    tab(OS,Indent), pptree(OS,JP,Indent),
    write(OS,')').
