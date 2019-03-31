function x = gauss(A, b)
    xsize = size(A, 1);
    x = zeros(xsize, 1);
    for i = 1:xsize-1
        % pivot
        [~, rows] = max(A(i:end,:));
        rows = rows + i - 1;
        if not(rows(i) == i)
            A([ rows(i), i], : )  = A([i, rows(i)], :);
            b([i, rows(i)]) = b([rows(i), i]);
        end
        % eliminate
        for j = i + 1:xsize
            factor = A(j, i) / A(i, i);
            A(i,:) = A(i,:) * factor;
            b(i) = b(i) * factor;
            A(j,:) = A(j,:) - A(i,:);
            b(j) = b(j) - b(i);
        end
    end
    % solve
    for i = xsize:-1:1
        if A(i,i) == 0
            continue
        end
        x(i) = b(i);
        for j = i+1:xsize
            x(i) = x(i) - x(j) * A(i,j);
        end
        x(i) = x(i) / A(i,i);
    end
end
    
        
    