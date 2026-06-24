:- initialization(main).

main :-
    Positions = [kuznetsov, slesarev, rezchikov, tokarev],
    Professions = [rezchik, tokary, kuznetsov, slesar],
    nth1(PosKuz, Positions, kuznetsov),
    left(PosKuz, PosLeft),
    nth1(PosLeft, Positions, LeftPlayer),
    nth1(PosLeft, Professions, LeftProf),
    write('Positions: '), write(Positions), nl,
    write('Professions: '), write(Professions), nl,
    write('Answer: '), write(LeftPlayer), write(' ('), write(LeftProf), write(')').

left(1, 4).
left(2, 1).
left(3, 2).
left(4, 3).