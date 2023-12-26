% 02: Розділити рядок на слова:
% Приклад:
% 1> BinText = <<"Text with four words">>.
% <<"Text with four words">>
% 2> lesson3_task2:words(BinText).
% [<<"Text">>, <<"with">>, <<"four">>, <<"words">>]



-module(lesson3_task2).
-export([words/1]).

words(String) ->
    words(String, [], []).

words(<<>>, Word, Acc) ->
    reverse([reverse(Word) | Acc]);

words(<<32, Rest/binary>>, Word, Acc) ->
    words(Rest, [], [reverse(Word) | Acc]);

words(<<Char, Rest/binary>>, Word, Acc) ->
    words(Rest, [Char | Word], Acc).

% Функція reverse - перевернутий список

reverse(List) ->
    reverse(List, []).

reverse([], NewList) ->
    NewList;
reverse([Head | Tail], NewList) ->
    reverse(Tail, [Head | NewList]).