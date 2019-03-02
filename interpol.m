function xs = interpol(func, x1, xn, N)
data = zeros(2, N);
data(1,:) = linspace(x1, xn, N);

for i = 1:N
    data(2,i) = func(data(1,i));
end
xs = zeros(3, 1000);
xs(1,:) = linspace(x1, xn, 1000);
for i = 1:1000
    xs(2,i) = func(xs(1,i));
    xs(3,i) = legrange(data, xs(1,i));
end

plot(xs(1,:),xs(2,:),xs(1,:),xs(3,:), "r--")


    
    