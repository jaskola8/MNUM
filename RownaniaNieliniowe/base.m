function x = base(coeff, x0, e, N)
%    x0 = stop-start;
    dx = polyder(coeff);
    for i=1:N
       x0 = x0 - (polyval(coeff, x0)/polyval(dx,x0));
       if (abs(polyval(coeff, x0))-e <= 0)
           x = x0;
           return
       end
    end
    x = x0;
return