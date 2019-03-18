function x = chebyshev_base(A, B, k, data)
c = size(data, 1);
for i = 0:k
    for j = 1:c
         %A(i+1,1) = A(i+1,1) + (data(j,1).^i) * (data(j,2));
         A(i+1,1) = A(i+1,1) + chebyshev(data(1,1), data(c,1), data(j,1), i)*data(j,2);
    end
     for l = 0:k
        for m = 1:c
            %B(i+1, l+1) = B(i+1, l+1) + data(m,1).^(i+l);
             B(i+1, l+1) = B(i+1, l+1) + (chebyshev(data(1,1), data(c,1), data(m,1), i) * chebyshev(data(1,1), data(c,1), data(m,1), l)) ;
        end
    end
end
z = B\A;
%fliplr(z.');
disp(z);

if k == 2
    x = @(g) z(1,1)+g.*z(2,1) + (2*g.^2-1)*z(3,1);
    return
end
if k == 1
    x = @(g) z(1,1) + (g.*z(2,1));
    return
end