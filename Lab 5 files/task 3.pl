:- initialization(main).

% Разделение списка пополам (с подсчетом длины)
split_list(List, Left, Right) :-
    length(List, Len),
    Half is Len // 2,
    split_list(List, Half, Left, Right).

split_list(List, 0, [], List).
split_list([X|Rest], N, [X|Left], Right) :-
    N > 0,
    N1 is N - 1,
    split_list(Rest, N1, Left, Right).

% Слияние двух отсортированных списков
merge_lists([], List, List).
merge_lists(List, [], List).
merge_lists([X|RestX], [Y|RestY], [X|Result]) :-
    X =< Y,
    merge_lists(RestX, [Y|RestY], Result).
merge_lists([X|RestX], [Y|RestY], [Y|Result]) :-
    X > Y,
    merge_lists([X|RestX], RestY, Result).

% Основной предикат сортировки
merge_sort_list([], []).
merge_sort_list([X], [X]).
merge_sort_list(List, Sorted) :-
    split_list(List, Left, Right),
    merge_sort_list(Left, SortedLeft),
    merge_sort_list(Right, SortedRight),
    merge_lists(SortedLeft, SortedRight, Sorted).

% Главная программа
main :-
    write('Введите список чисел (с точкой в конце): '),
    read(List),
    merge_sort_list(List, Sorted),
    format('Исходный список: ~w~n', [List]),
    format('Отсортированный список: ~w~n', [Sorted]).