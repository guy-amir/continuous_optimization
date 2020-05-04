% T1 = { x | A(1,:)*x = b(1)}
% T2 = { x | A(2,:)*x = b(2)}
% T3 = { x>0}

A = [0 6 -7 1; -1 2 10 -1];
b = [0 10].';
x0 = [0 0 0 0].';


greedy_projection(x0,20,A,b)
        
function d = hyperplane_dist(x,a,b)
    d = abs((a*x-b)/(a*a.'));
end
function y = hyperplane_orth_proj(x,a,b)
    if (a*x == b)
        y = x;
        
    else
        y = x - a.'*((a*x-b)/(a*a.'));
        
    end
end

function y = positive_orth_proj(x)

    y = x.*(x>0);
        
end

function d = positive_dist(x)
    
    d = sqrt(sum((x-x.*(x>0)).^2));

end

function y = greedy_projection(x,iter,A,b)
    y = x;
    for j = 1:iter
        d1 = hyperplane_dist(y,A(1,:),b(1));
        d2 = hyperplane_dist(y,A(2,:),b(2));
        d3 = positive_dist(y);
        [~,i] = max([d1,d2,d3]);
        if i==1 || i==2
            y = hyperplane_orth_proj(y,A(i,:),b(i))
        else
            y = positive_orth_proj(y)
        end
    end
end
