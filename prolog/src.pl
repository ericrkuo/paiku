% member(X, List) is true if X appears in List.
% It succeeds once for each occurrence in List.
:- module(src,[member1/2,member/2]).


member(X, [X|_]).
member(X, [_|Xs]) :- member(X, Xs).

%!	member1
%
%
member1(X, [X|_]).
member1(X, [_|Xs]) :- member1(X, Xs).