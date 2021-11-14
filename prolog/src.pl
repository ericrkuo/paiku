:- module(src,[print_haiku/0, pick_random_word/2, filter_syllables/3, random_word_syllable/3]).
:- use_module(api).
:- use_module(library(readutil)).
:- use_module(library(gensym)).

/*
Credits to: https://swish.swi-prolog.org/p/playing_with_wordnet.swinb
*/
% TODO somehow encorproate IO, pass in the list of topics

%%%%%% START SCREEN %%%%%%

% intro_prompt(S) is true if S is the intro prompt for our app
intro_prompt(" ~~ Paiku ~~.\nYour number one haiku generator solution!.\nGive us topics in comma separated form!").

% start/0 calls the starting Paiku UI.
start :- intro_prompt(Prompt), writeln(Prompt), read_line_to_string(current_input, Topics), print_haiku(Topics). 

% print_haiku/1 prints the haiku from the user specified topics
print_haiku(Topics) :-
    haiku_lines(Topics, Lines),
    format("~w~n~w~n~w~n", Lines).

/*
Credits to: https://swish.swi-prolog.org/p/playing_with_wordnet.swinb
*/
haiku_lines(Topics, [Line1, Line2, Line3]) :-
    get_words(Topics, Words),
    line1(Line1, Words, 5),
    line2(Line2, Words, 7),
    line3(Line3, Words, 5).

% generates a line in a haiku with 5 or 7 number of syllables

% Duy
% TODO write tests
% Mandatory - ask user for prompts
%             i.e. list of topics (maximum 5) and somehow pass that in
% - some kind of randomness in terms of number of words
% - some kind of grammar (verbs, nouns, determiners)
% - text to speech

line1(Line, Words, 5) :- 
    random_word_syllable(W1, Words, 3),
    random_word_syllable(W2, Words, 2),
    atomic_list_concat([W1, W2], ' ', Line).

line2(Line, Words, 7) :- 
    random_word_syllable(W1, Words, 2),
    random_word_syllable(W2, Words, 1),
    random_word_syllable(W3, Words, 3),
    random_word_syllable(W4, Words, 1),
    atomic_list_concat([W1, W2, W3, W4], ' ', Line).

line3(Line, Words, 5) :- 
    random_word_syllable(W1, Words, 1),
    random_word_syllable(W2, Words, 2),
    random_word_syllable(W3, Words, 2),
    atomic_list_concat([W1, W2, W3], ' ', Line).

% Picks a random word from Words that has N syllables
random_word_syllable(Word, Words, N) :-
    filter_syllables(Result, Words, N),
    pick_random_word(Word, Result).

% find_syllables(Result, Words, N) filters each word(Value, NumSyllables) in Words that have N syllables
% and produces a list of the Value's of each word
filter_syllables([], [], _).
filter_syllables(Result, [word(Value, N)|List], N) :-
    filter_syllables(Temp, List, N),
    Result = [Value | Temp].
filter_syllables(Result, [_|List], N) :-
    filter_syllables(Result, List, N).

% pick_random_word(Word, Words) chooses a random Word from Words
pick_random_word("N/A", []).
pick_random_word(Word, Words) :- random_member(Word, Words).
