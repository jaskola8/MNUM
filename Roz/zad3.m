function zad3()
f = @(x, y, t) (y);
ft = @(x, y, t) (-x);
ftest = @(x) (sin(x));
h = 0.001;
wa2 = adams(f, ft, h, 1, 0, 0, 0, 10 ,1);
wa3 = adams(f, ft, h, 1, 0, 0, 0, 10 ,2);
we = ueuler(f, ft, h, 1, 0, 0, 0, 10);
wt = test(ftest, h,0,0,10);
b_count = length(0:h:10);
b = zeros(4,b_count);
for j = 1:b_count
        b(:,j) = [wt(2,j), abs(wt(2,j) - we(1, j)),  abs(wt(2,j) - wa2(1, j)),  abs(wt(2,j) - wa3(1, j))];
end
disp(max(b(2,:)));
disp(max(b(3,:)));
disp(max(b(4,:)));