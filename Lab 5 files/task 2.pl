:- initialization(main).
% Вычисление суммы элементов списка
sum_list_elements([], 0).
sum_list_elements([H|T], Sum) :-
    sum_list_elements(T, Sum1),
    Sum is H + Sum1.

% Определение знака суммы
sign_of_sum(Sum, -1) :- Sum < 0, !.
sign_of_sum(Sum, 1) :- Sum > 0, !.
sign_of_sum(Sum, 0) :- Sum =:= 0.

% Главная программа
main :-
    write('Введите список чисел (с точкой в конце, например [1,2,3,-4].): '),
    read(List),
    sum_list_elements(List, Sum),
    sign_of_sum(Sum, Result),
    write('Сумма = '),
    write(Sum),
    write(', Результат = '),
    write(Result),
    nl.