function value = approximate(base, k, data, M)
A = zeros(k+1,1);
B = zeros(k+1,k+1);
fx = base(A,B,k,data);

if M == 0
    value = sym2poly(fx);
    value = value(1,1);
else
    f = matlabFunction(fx);
    value = f(18000);
end
max_value = max(data(:,1));
min_value = min(data(:,1));
disp(min_value(1,1));
disp(max_value(1,1));
final_points = linspace(min_value(1,1), max_value(1,1), 100);
for i = 1:100
    final_points(2,i) = subs(fx, final_points(1,i));
end
scatter(data(:,1), data(:,2), "b");
disp(final_points);
hold on
%fplot(fx, "r--");
plot(final_points(1,:), final_points(2,:), "r");
hold off
disp(fx);
return
