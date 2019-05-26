function zad2()
f = @(x, y, t) (y);
ft = @(x, y, t) (-x);
ftest = @(x) (sin(x));
h = [0.1, 0.01, 0.001];
for i = 1:3
    wt = test(ftest, h(i),0,0,10);
    we = ueuler(f, ft, h(i),1,0,0,0,10);
    wh = uheun(f, ft, h(i),1,0,0,0,10);
    b_count = length(0:h(i):10);
    b = zeros(3,b_count);
    for j = 1:b_count
        b(:,j) = [wt(1,j), abs(wt(1,j) - we(1, j)),  abs(wt(1,j) - wh(1, j))];
    end
    disp(max(b(2,:)));
    disp(max(b(3,:)));
end
xlabel("x");
ylabel("y");
grid on
hold on
plot(wt(1, :), wt(2, :), '-', 'DisplayName','Metoda analityczna');
hold on
plot(we(3, :), we(1, :), 'o', 'DisplayName','Metoda Eulera');
hold on
plot(wh(3, :), wh(1, :), 'x', 'DisplayName','Metoda Heuna');
legend
