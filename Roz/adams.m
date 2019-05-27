function wa = adams(f, ft, h, y0, x0, t0, min, max, q)
    beta = zeros(5,5);
    beta(1, :) = [1, 0, 0, 0, 0];
    beta(2, :) = [3, -1, 0, 0, 0] / 2;
    beta(3, :) = [23, -16, 5, 0, 0] / 12;
    beta(4, :) = [55, -59, 37, -9, 0] / 24;
    beta(5, :) = [1901, -2774, 2616, -1274, 251] / 720;
    w_count = length(min:h:max);
    w = zeros(3,w_count);
    emax = t0 + h * q;
    w(:,1:q+1) = ueuler(f, ft, h, y0, x0, t0, min, emax);
    for i = q+2:w_count
        p = i-1;
        xn = 0;
        for j = 0:q
            xn = xn + beta(q+1, j+1) * f(w(1, p-j), w(2, p-j), w(3, p-j));
        end
        xn = xn * h + w(1, p);
        yn = 0;
        for j = 0:q
            yn = yn + beta(q+1, j+1) * ft(w(1, p-j), w(2, p-j), w(3, p-j));
        end
        yn = yn * h + w(2, p);
        tn = w(3, p) + h;
        w(:, i) = [xn, yn, tn];
    end
    wa = w;
end