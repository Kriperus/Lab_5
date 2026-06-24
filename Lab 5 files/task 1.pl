:- initialization(main).
% Сумма делителей натурального числа.

sum_divisors(N, Sum) :-
    sum_divisors(N, 1, 0, Sum).

sum_divisors(N, Current, Acc, Sum) :-
    Current > N,
    Sum is Acc,
    !.
    
sum_divisors(N, Current, Acc, Sum) :-
    Current =< N,
    (N mod Current =:= 0 -> NewAcc is Acc + Current ; NewAcc is Acc),
    Next is Current + 1,
    sum_divisors(N, Next, NewAcc, Sum).

% Главная функция с read (ввод с точкой)
main :-
    write('Введите число с точкой в конце (например 12.): '),
    read(N),
    sum_divisors(N, Sum),
    format('Сумма делителей = ~w~n', [Sum]).