:- module(api, [getWords/2, convert_to_words/2, make_api_call/2]).
:- use_module(library(http/http_open)).
:- use_module(library(http/json)).
:- use_module(library(http/json_convert)).
:- use_module(library(http/http_client)).
:- use_module(library(http/http_json)).

% TODO write tests
random_word_syllable(Word, Syllables).

% word(Value, NumSyllables) indicates a word with the specified number of syllables

% getWords returns a list of word(Value, NumSyllables) related to some topics
% Topics is a comma separated string of no more than 5 topics
% E.g. ?- getWords('food,dog,puppy', Words).
getWords(Topics, Words) :-
    make_api_call(Topics, Json),
    convert_to_words(Json, Words).

% convert_to_words takes a Prolog Term representing JSON and expresses it as a list of word(Value, NumSyllables)
convert_to_words([], []).
convert_to_words([json(H)|T], Words) :-
    Field1 = 'word',
    Field2 = 'numSyllables',
    member(Field1=Value, H),
    member(Field2=NumSyllables, H),
    convert_to_words(T, RestOfWords),
    Words = [word(Value, NumSyllables) | RestOfWords].

% make the API call to the /words endpoint of https://www.datamuse.com/api/
% query parameters include
%   - md (metadata) - to get the syllables
%   - topics - some topics of interest to the haiku
%   - max - the maximum number of words returned by the Api
make_api_call(Topics, Json) :-
    setup_call_cleanup(
        http_open([
                host('api.datamuse.com'),
                path('/words'),
                search([
                    max=10,
                    md='s',
                    topics=Topics
                ])
            ], In, []),
        json_read(In, Json),
        close(In)
    ).
