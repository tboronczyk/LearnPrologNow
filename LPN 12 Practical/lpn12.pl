:- ensure_loaded([dcg,pretty]).

test(InFile,OutFile) :-
    open(InFile,read,In),
    open(OutFile,write,Out),
    read(In,S),
    parse_sentence(S,In,Out),
    close(In),
    close(Out).

parse_sentence(end_of_file,_,_) :- !.
parse_sentence(S,In,Out) :-
    write(Out,S), nl(Out),
    nl(Out),
    s(Tree,S,[]),
    pptree(Out,Tree), nl(Out),
    nl(Out), nl(Out),
    read(In,NewS),
    parse_sentence(NewS,In,Out).
parse_sentence(_,In,Out) :-
    write(Out,'no'), nl(Out),
    nl(Out), nl(Out),
    read(In,S),
    parse_sentence(S,In,Out).
