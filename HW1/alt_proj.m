% Ax = b
% x >= 0
% S1 = { x -> R | Ax = b }
% S2 = R+
A = [0 6 -7 1; -1 2 10 -1];
b = [0 10].';
x0 = [0 0 0 0].';


alternating_projection(x0,20,A,b)

function y = affine_orth_proj(x,A,b)
    if (A*x == b)
        y = x;
        
    else
        y = x - A.'*((A*A.')\(A*x-b));
        
    end
end

function y = halfplane_orth_proj(x)

    y = x.*(x>0);
        
end

function y = alternating_projection(x,iter,A,b)
    y = x
    for j = 1:iter
        y = halfplane_orth_proj(affine_orth_proj(y,A,b))
    end
end
