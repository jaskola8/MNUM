function x = base(A, B, k, data)
c = size(data, 1);
for i = 0:k
    for j = 1:c
         A(i+1,1) = A(i+1,1) + (data(j,1).^i) * (data(j,2));
    end
     for l = 0:k
        for m = 1:c
            B(i+1, l+1) = B(i+1, l+1) + data(m,1).^(i+l);
        end
    end
end
disp(fliplr((B\A)));
x = poly2sym(fliplr((B\A).'));
return