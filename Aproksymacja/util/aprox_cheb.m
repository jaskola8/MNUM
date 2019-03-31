
function x = aprox_cheb()
x = [0 0.5 1 1.5 2; 0 0.19 0.26 0.29 0.31];
disp(x);
v = zeros(3,1);
[a, b] = size(v);
disp(a);
for i = 0:2
    for j = 1:5
        v(i+1,1) = v(i+1,1) + chebyshev(x(1,1), x(1,5), x(1,j), i)*x(2,j);
    end
end
disp(v);
y = zeros(3,3);
for k = 0:2
    for l = 0:2
        for m = 1:5
            y(k+1, l+1) = y(k+1, l+1) + (chebyshev(x(1,1), x(1,5), x(1,m), k)* chebyshev(x(1,1), x(1,5), x(1,m), l)) ;
        end
    end
end
z = y\v;

fliplr(z.'); 
disp(z);
scatter(x(1,:), x(2,:), "b");
hold on
funkcja = @(g) z(1,1)+(g).*z(2,1) + (2*(g).^2-1)*z(3,1);
funkcja(2.5)
gg = linspace(-0.5, 2.5, 1000);
plot(gg, funkcja(gg), "r");
%fplot(funkcja, "r");
%fplot(poly2sym(fliplr(z.')), "r");
hold off
%disp(z);