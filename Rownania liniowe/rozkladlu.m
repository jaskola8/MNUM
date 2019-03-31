function x = rozkladlu(A, b)
    [R, L] = croutdoolittle(A);
    msize = size(R, 1);
    y = zeros(msize, 1);
    for i = 1:msize
        y(i) = b(i);
        for j = 1:i-1
            y(i) = y(i) - L(i, j) * y(j);
        end
        y(i) = y(i) / L(i, i);
    end
    
    x = zeros(msize, 1);
    for i = msize:-1:1
        x(i) = y(i);
        for j = i+1:msize
            x(i) = x(i) - R(i, j) * x(j);
        end
        x(i) = x(i) / R(i, i);
    end
end
    