% TODO update this to export the correct relations
:- module(src,[print_haiku/0]).
:- dynamic todo/0.

/*
Credits to: https://swish.swi-prolog.org/p/playing_with_wordnet.swinb
*/
% TODO somehow encorproate IO, pass in the list of topics
print_haiku :-
    haiku_lines(Lines),
    format("~w~n~w~n~w~n", Lines).

/*
Credits to: https://swish.swi-prolog.org/p/playing_with_wordnet.swinb
*/
haiku_lines([Line1, Line2, Line3]) :- 
    line1(Line1, 5),
    line2(Line2, 7),
    line3(Line3, 5).

% generates a line in a haiku with 5 or 7 number of syllables

% Duy
% TODO write tests
% Mandatory - ask user for prompts
%             i.e. list of topics (maximum 5) and somehow pass that in
% - some kind of randomness in terms of number of words
% - some kind of grammar (verbs, nouns, determiners)
% - text to speech

line1(Line, 5) :- 
    random_word_syllable(W1, 3),
    random_word_syllable(W2, 2),
    atomic_list_concat([W1, W2], ' ', Line).

line2(Line, 7) :- 
    random_word_syllable(W1, 2),
    random_word_syllable(W2, 1),
    random_word_syllable(W3, 3),
    random_word_syllable(W4, 2),
    atomic_list_concat([W1, W2, W3, W4], ' ', Line).

line3(Line, 5) :- 
    random_word_syllable(W1, 5),
    atomic_list_concat([W1], ' ', Line).

% Generates a random N number of words/syllables from API 
% random_word_syllable(Word, 3).
random_word_syllable("The", 1).
random_word_syllable("cherry", 2).
random_word_syllable("windsurfing", 3).
random_word_syllable("similitude", 4).
random_word_syllable("penetralia", 5).
random_word_syllable("discontinuity", 6).
random_word_syllable("endocommensalism", 7).
