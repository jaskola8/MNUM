function func = chebyshev(x, k)
    if k == 0
        func = 1;
        return
    end
    if k == 1
        func = x;
        return
    end
    v = [0, 1, x];
    for i = 2:k
        tmp = v(:,3);
        v(:,3) = 2*x*(v(:,3))-v(:,2);
        v(:,2) = tmp;
    end
    func = v(:,3);