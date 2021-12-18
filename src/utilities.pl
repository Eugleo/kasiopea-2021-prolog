solve(Input, Output, Parse, Solve, Display) :-
    phrase_from_file(call(Parse, Tasks), Input),
    open(Output, write, Out),
    maplist({Display, Solve, Out}/[T] >> call(Display, Out, call(Solve, T)), Tasks),
    close(Out).