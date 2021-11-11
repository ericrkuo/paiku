% Make a group of tests with begin_tests/end_tests.
% Make a test with test/2.
% Run your tests with run_tests/0.

% After you load this file in swipl, run with: run_tests.
% On the command line:
% * Use `make test-repl` to enter a repl with this file loaded.
% * Use `make test` to run the unit tests.
% * At the project run, use `make prolog-eval` to run the unit tests.

% Examples follow; please remove them in your project.

:- use_module(src).
:- use_module(api).

:- begin_tests('convert_to_words').

test('base case, empty list', [nondet]) :-
    convert_to_words([], []).

test('singleton list', [nondet]) :-
    convert_to_words(
        [json([word=chow, score=41896, numSyllables=1, tags=[n]])],
        [word(chow, 1)]).

test('more complex list', [nondet]) :-
    convert_to_words(
        [json([word=chow      , score=41896 , numSyllables=1 , tags=[n]])  , 
         json([word=pewpew    , score=15697 , numSyllables=2 , tags=[n]])  , 
         json([word=power     , score=34798 , numSyllables=2 , tags=[n]])  , 
         json([word=chocolate , score=23199 , numSyllables=3 , tags=[n]])  , 
         json([word=doggy     , score=02290 , numSyllables=2 , tags=[n]])] , 
        [word(chow, 1), word(pewpew, 2), word(power, 2), word(chocolate, 3), word(doggy, 2)]).

:- end_tests('convert_to_words').

% :- begin_tests('member').

% test('base case, singleton list', [nondet]) :-
%     member(1, [1]).

% test('base case, longer list', [nondet]) :-
%     member(x, [x, y, z]).

% test('recursive case', [nondet]) :-
%     member(y, [x, y, z]),
%     member(z, [x, y, z]).

% test('multiple results', [nondet, all(X =@= [x, y, z])]) :-
%     member(X, [x, y, z]).

% test('multiple but not all results', [nondet, all(X =@= [a, c])]) :-
%     member(pair(X, 1), [pair(a, 1), pair(b, 2), pair(c, 1)]).

% test('a failing test', [fail]) :-
%     member(not_there, [x, y, z]).

% test('some more failing tests', [fail]) :-
%     ( member(w, [x, y, z]) ;
%       member(3, []) ;
%       member(3, [1, 8, 2, 9, something_with_3_inside(3), [3]]) ).

% :- end_tests('member').
