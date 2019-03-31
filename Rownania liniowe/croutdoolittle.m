function [R, L] = croutdoolittle(A)
    msize = size(A);
    R = zeros(msize);
    L = zeros(msize);
    for i = 1:msize
        R(1, i) = A(1, i);
    end
    for i = 1:msize
        L(i, 1) = A(i, 1);
    end
    for k = 1:msize
        for i = k:msize
            R(k, i) = A(k ,i);
            for j = 1:k-1
                R(k, i) = R(k, i) - L(k, j) * R(j, i);
            end
            L(i, k) = A(i, k);
            for j = 1:k-1
                L(i, k) = L(i, k) - L(i, j) * R(j, k);
            end
            L(i, k) = L(i, k) / R(k, k);
        end
    end
end
