%  03: Розділити рядок на частини, з явною вказівкою роздільника:
%  Приклад:
% BinText1 = <<"Col1-:-Col2-:-Col3-:-Col4-:-Col5">>.
% lesson3_task3:split(BinText1,<<"-:-">>).
% [<<"Col1">>,<<"Col2">>,<<"Col3">>,<<"Col4">>,<<"Col5">>]

-module(lesson3_task3).
-export([split/2]).

% Основна функція для розділення строки
split(BinText, Delimiter) ->
    split(BinText, Delimiter, []).

% Допоміжна рекурсивна функція
split(<<>>, _Delimiter, Acc) ->
    % Кінець рекурсії, повертаємо накопичений список
    reverse(Acc);

split(BinText, Delimiter, Acc) ->
    % Знаходимо позицію роздільника в бінарній строкі
    case binary:match(BinText, Delimiter) of
        nomatch -> % Якщо роздільник не знайдено, додаємо решту строки до списку та завершуємо рекурсію
            reverse([BinText | Acc]);
        {Pos, _} ->
            % Розділяємо строку на частини
            Word = binary:part(BinText, 0, Pos),
            % Видаляємо знайдений відрізок та роздільник з початку строки
            NewBinText = binary:part(BinText, Pos + size(Delimiter), byte_size(BinText) - Pos - size(Delimiter)),
            % Додаємо слово до списку та продовжуємо рекурсію
            split(NewBinText, Delimiter, [Word | Acc])
    end.

% Функція reverse - перевернутий список

reverse(List) ->
    reverse(List, []).

reverse([], NewList) ->
    NewList;
reverse([Head | Tail], NewList) ->
    reverse(Tail, [Head | NewList]).