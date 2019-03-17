function xs = interpol(func, x1, xn, N)
data = zeros(2, N);
dataChev = zeros(2, N);
data(1,:) = linspace(x1, xn, N);
dataChev(1,:) = chebyshev(x1, xn, N);
for i = 1:N
    data(2,i) = func(data(1,i));
    dataChev(2,i) = func(dataChev(1,i));
end
xs = zeros(8, 1000);
xs(1,:) = linspace(x1, xn, 1000);
xs(5,:) = chebyshev(x1, xn, 1000);
for i = 1:1000
    xs(2,i) = func(xs(1,i));
    xs(3,i) = newton(data, xs(1,i));
    xs(4,i) = legrange(data, xs(1,i));
    
    xs(6,i) = func(xs(5,i));
    xs(7,i) = newton(dataChev, xs(5,i));
    xs(8,i) = legrange(dataChev, xs(5,i));
    
end
plot(xs(5,:),xs(6,:), "g",xs(5,:),xs(7,:), "r--")%,  xs(5,:),xs(8,:), "b")
%plot(xs(1,:),xs(2,:), "g",xs(1,:),xs(3,:), "r--")%, xs(1,:),xs(4,:), "b")
        
   