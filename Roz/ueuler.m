function wue = ueuler(f, ft, h, y0, x0, t0, min, max)
    w_count = length(min:h:max);
    w = zeros(3,w_count);
    w(:,1) = [x0, y0, t0];
    for i = 2:w_count
        dx = w(1, i-1);
        dy = w(2, i-1);
        dt = w(3, i-1);
        xn = dx + h*f(dx, dy, dt);
        yn = dy + h*ft(dx, dy, dt);
        tn = dt + h;
        w(:,i) = [xn,yn,tn];
    end
    wue = w;
end