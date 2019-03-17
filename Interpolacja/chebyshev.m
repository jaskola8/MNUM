function func = chebyshev(a, b, k)
    x = 0.5*(a+b)+0.5*(b-a)*cos((2*(0:k-1)+1)*pi/(2*k));
    func = x;