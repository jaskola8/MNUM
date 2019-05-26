function zad1()
ftest = @(x) (exp(-x)*cos(2*pi*x));
f = @(x, y) (-2*pi*exp(-x)*sin(2*pi*x) - y);
h = 0.001;
we = euler(f, h, 1, 0, 0,10);
wh = heun(f,h,1,0,0,10);
wt = test(ftest, h, 0, 0, 10);
xlabel("x");
ylabel("y");
grid on
hold on
plot(wt(1, :), wt(2, :), '-', 'DisplayName','Metoda analityczna');
hold on
plot(we(1, :), we(2, :), 'o', 'DisplayName','Metoda Eulera');
hold on
plot(wh(1, :), wh(2, :), 'x', 'DisplayName','Metoda Heuna');
legend
b_count = length(0:h:10);
b = zeros(3,b_count);
for i = 1:b_count
    b(:,i) = [wt(2,i), abs(wt(2,i) - we(2, i)),  abs(wt(2,i) - wh(2, i))];
end
disp(max(b(2,:)));
disp(max(b(3,:)));
