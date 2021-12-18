:- use_module(library(dcg/basics)).
:- use_module(library(pio)).
:- consult(utilities).

%%% SOLUTION LOGIC

pay(Goal, [], []) :- Goal =< 0.
pay(Goal, [Count|Counts], [Value|Values]) :-
    Goal =< 0 ;
    pay(Goal - Count * Value, Counts, Values).

%%% PARSING INPUT

problem(Tasks) -->
    integer(_), eol,
    tasks(Tasks).

tasks([]) --> [].
tasks([task(Goal, Counts)|Tasks]) -->
    integer(Goal), eol,
    counts(Counts),
    (eol, tasks(Tasks)) ; eos.

counts([]) --> [].
counts([C|Cs]) -->
    integer(C), whites, counts(Cs).

%% PRINTING OUTPUT

display(Out, Solution) :-
    Solution -> write(Out, "ANO\n") ; write(Out, "NE\n").

%% EXAMPLES

solution(task(Goal, Counts)) :- pay(Goal, Counts, [1, 2, 5, 10, 20, 50]).

:- solve("inputs/A-priklad.txt", "outputs/A-priklad.txt", problem, solution, display).
:- solve("inputs/A-lehky.txt", "outputs/A-lehky.txt", problem, solution, display).
:- solve("inputs/A-tezky.txt", "outputs/A-tezky.txt", problem, solution, display).