function fx = approximate(base, k, data)
A = zeros(k+1,1);
B = zeros(k+1,k+1);
fx = base(A,B,k,data);
scatter(data(:,1), data(:,2), "b");
hold on
fplot(poly2sym(fliplr(fx.')), "r");
hold off
disp(fx);
