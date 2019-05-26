function wt =  test2(f, h, x0, min, max)
    w_count = length(min:h:max);
    w = zeros(2,w_count);
    w(:,1) = [x0; f(x0)];
    for i = 2:w_count
        x0 = x0 + h;
        yn = f(x0);
        w(:,i) = [x0,yn];
    end
    wt = w;
end