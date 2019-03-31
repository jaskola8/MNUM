function value = approximateselectionsort(base, k, data)
A = zeros(k+1,1);
B = zeros(k+1,k+1);
fx = base(A,B,k,data);
f = matlabFunction(fx);
value = f(18);
max_value = max(data(:,1));
min_value = min(data(:,1));
final_points = linspace(min_value(1,1), max_value(1,1), 100);
for i = 1:100
    final_points(2,i) = subs(fx, final_points(1,i));
end
scatter(data(:,1), data(:,2), "b");
hold on
title("Aproksymowany czas wykonania selection sort")
grid on
plot(final_points(1,:), final_points(2,:), "r");
legend('Dane aproksymowane', 'Funkcja aproksymujaca')
xlabel("N [x1000]")
ylabel("T(N) [s]")
hold off
return
