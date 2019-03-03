function func = newton(data, x)
    func = 0.0;
    u = data(1,:);
    %a = size(data(1,:));
    r = zeros(4);
    r(:,1) = data(2,:);
    disp("u = "+ data)
    disp(u);
    disp(r);
    disp("r == " + r(2,1));
    for j = 2:1:4
        z = 4;
        for i = 6-j :(-j+1):2
            q = r(i,j-1)-r(i-1,j-1);
            w = u(z)- u(z+1-j);
            disp("i = " +i);
            disp("j = " +j);
            disp("q = " +q);
            disp("w = " +w);
             disp("q/w = " +q/w);
            r(i-1,j) = q/w;
            z = z-1;
        end
    end
    disp(r)
            
    