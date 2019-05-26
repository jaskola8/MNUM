function heun(f, h, y0, x0, min, max)
    w_count = length(min:h:max);
    w = zeros(2,w_count);
    w(:,1) = [x0; y0];
     for i = 2:w_count
        dx = w(1,i-1);
        dy = w(2, i-1);
        xn = dx + h;
        yn = dy + h*(0.5*(f(dx,dy)+f(dx+h, dy+h*f(dx,dy))));
        w(:,i) = [xn,yn];
     end 
        disp(w);
end