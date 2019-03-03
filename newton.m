function func = newton(data, x)
    func = 0.0;
    u = data(1,:);
    %a = size(data(1,:));
    r = zeros(5);
    r(:,1) = data(2,:);
    disp("u = "+ data)
    disp(u);
    disp(r);
    disp("r == " + r(2,1));
    for j = 1:1:5
        z = 5;
        for i = 5-j :-1:1
            q = r(i+1,j)-r(i,j);
            w = u(z)- u(z-j);
            r(i,j+1) = q/w;
            z = z-1;
        end
    end
    disp(r)
            
    