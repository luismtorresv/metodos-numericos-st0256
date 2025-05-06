% Source for this script:
% https://en.wikipedia.org/wiki/LU_decomposition#MATLAB_code_example

function LU = LUDecompDoolittle(A)
    n = length(A);
    LU = A;
    for k = 2:n
        for i = 1 : k-1
            lamda = LU(k,i) / LU (i, i);
            LU(k,i) = lamda;
            LU(k,i+1:n) = LU(k,i+1:n) - LU(i,i+1:n) * lamda;
        end
    end
end

function x = SolveLinearSystem(LU, B)
    n = length(LU);
    y = zeros(size(B));
    % find solution of Ly = B
    for i = 1:n
        y(i,:) = B(i,:) - LU(i,1:i)*y(1:i,:);
    end
    % find solution of Ux = y
    x = zeros(size(B));
    for i = n:(-1):1
        x(i,:) = (y(i,:) - LU(i,(i + 1):n)*x((i + 1):n,:))/LU(i, i);
    end    
end

A = [ 4 3 3; 6 3 3; 3 4 3 ]
LU = LUDecompDoolittle(A)
B = [ 1 2 3; 4 5 6; 7 8 9; 10 11 12 ]'
x = SolveLinearSystem(LU, B)
A * x