function fx = approximate(base, k, data)
A = zeros(k+1,1);
B = zeros(k+1,k+1);
fx = base(A,B,k,data);
final_points = zeros(2,100);
final_points(1,:) = linspace(data(1,1), data(size(data,1),1), 100);
for i = 1:100
    final_points(2,i) = subs(fx, final_points(1,i));
end
scatter(data(:,1), data(:,2), "b");
disp(final_points);
hold on
plot(final_points(1,:), final_points(2,:), "r");
hold off
disp(fx);
