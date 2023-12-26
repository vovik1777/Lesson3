% 01: Витягти з рядка перше слово:
% Приклад:
% 1> BinText = <<"Some text">>.
% <<"Some Text">>
% 2> lesson3_task1:first_word(BinText).
% <<”Some”>>

-module(lesson3_task1).
-export([first_word/1]).

first_word(String) ->
    first_word(String, []).
    
first_word(<<>>, Acc) ->
    reverse(Acc);
    
first_word(<<$\s, Rest/binary>>, Acc) ->
    reverse(Acc);
    
first_word(<<Char, Rest/binary>>, Acc) ->
    first_word(Rest, [Char | Acc]).


% Функція reverse - перевернутий список

reverse(List) ->
    reverse(List, []).

reverse([], NewList) ->
    NewList;
reverse([Head | Tail], NewList) ->
    reverse(Tail, [Head | NewList]).