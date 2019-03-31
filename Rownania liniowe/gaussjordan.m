function A = gaussjordan(A)
    msize = size(A, 1);
    for k = 1:msize
        for i = 1:msize
            if not(i == k)
                A(i, k) = A(i, k) / A(k, k);
            end
        end
        for i = 1:msize
            for j = 1:msize
                    if not(j == k || i == k)
                        A(i, j) = A(i, j) - A(i, k) * A(k, j);
                    end
            end
        end
        for j = 1:msize
            if not(j == k)
                A(k, j) = -A(k, j) / A(k, k);
            end
        end
        A(k, k) = 1 / A(k, k);
    end
end