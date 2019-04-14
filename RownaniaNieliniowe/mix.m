function z = mix(coeff,a,b,e,N)
 	yA = polyval(coeff,a);
    yB = polyval(coeff, b);
    x=(a+b)/2;
    for i=1:N       
       if (abs(polyval(coeff, x))-e <= 0)
           z = x;
           return 
       end
       if (abs(polyval(coeff,x)) <= 0.01)
            z = base(coeff, x, e, i);
            return
       end
       y = polyval(coeff, x);
       if (sign(yA)==sign(y))
           yA=y;
           a=x;
       else
           yB=y;
           b=x;
       end
       x=(a+b)/2;
    end
    z = x;
return