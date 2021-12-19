:- use_module(library(dcg/basics)).
:- use_module(library(pio)).
:- consult(utilities).

%%% SOLUTION LOGIC

will_get_2(Weeks) :- will_get_2(Weeks, 0).

will_get_2([], Good) :- Good > 0.
will_get_2([Week|Weeks], Good) :-
    0 is mod(Week, 2),
    will_get_2(Weeks, Good + 1).
will_get_2([Week|Weeks], Good) :-
    1 is mod(Week, 2),
    will_get_2(Weeks, Good - 1).

%%% PARSING INPUT

problem(Tasks) -->
    integer(TaskCount), eol,
    tasks(Tasks, TaskCount).

tasks([], 0) --> eos.
tasks([Weeks|Tasks], TaskCount) -->
    integer(Total), eol,
    weeks(Weeks, Total),
    {Rest is TaskCount - 1},
    tasks(Tasks, Rest).

weeks([], 0) --> [].
weeks([W|Ws], Total) -->
    {Rest is Total - 1},
    integer(W), blanks, weeks(Ws, Rest).


%% PRINTING OUTPUT

display(Out, Solution) :-
    Solution -> write(Out, "ANO\n") ; write(Out, "NE\n").

%% EXAMPLES

solution(Weeks) :- will_get_2(Weeks).

:- solve("inputs/B-priklad.txt", "outputs/B-priklad.txt", problem, solution, display).
:- solve("inputs/B-lehky.txt", "outputs/B-lehky.txt", problem, solution, display).
:- solve("inputs/B-tezky.txt", "outputs/B-tezky.txt", problem, solution, display).