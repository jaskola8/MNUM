function func = legrange(data, x)
    func = 0.0;
    [~, c] = size(data);
    for i = 1:c
        poly = 1.0;
        for j = 1:c
            if j ~= i
                poly = poly * (x - data(1,j)) / (data(1,i) - data(1,j));
            end
        end
        func = func + data(2, i) * poly;
    end
    