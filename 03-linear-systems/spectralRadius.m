function [sp_r] = spectralRadius(matrix)
%spectralRadius Calculates the spectral radius of a square matrix.
%   English WP: "In mathematics, the spectral radius of a square matrix
%                is the maximum of the absolute values of its eigenvalues."
sp_r = max(abs(eig(matrix)));
end