% MatJacobiSeid:
%
% Calcula la solución del sistema Ax=b
% con base en una condición inicial x0,
% mediante el método de
% Jacobi (met=0)
% o de Gauss-Seidel (met=1).

function [output_table, solution, status, iterations] = MatJacobiSeid(x_initial, A, b, tolerance, max_iterations, method)
    i = 0; % iteration counter
    output_table = zeros(max_iterations, 1); % this had to be initialised
    x0 = x_initial;

    error = tolerance + 1; % to make the first loop condition work...

    D = diag(diag(A)); % no idea why
    L = -tril(A,-1);
    U = -triu(A,+1);

    while error > tolerance && i < max_iterations
        switch method
            case 0
                T = D \ (L+U);
                C = D \ b;
            case 1
                T = (D-L) \ U;
                C = (D-L) \ b;
        end
        
        % for next iteration
        x1 = T * x0 + C;
        
        % calculate error
        error = norm(x1-x0, 'inf');
        output_table(i + 1) = error;

        x0 = x1;  % use it as new value
        i = i+1;  % one more iteration
    end

    solution = x0;
    iterations = i;
    if error < tolerance
        % if we got here, we found a solution
        status = true;
    else 
        status = false;
    end
end