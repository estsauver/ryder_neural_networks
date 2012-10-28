function err = ANN(w_vector)
%
% X_actual = cell mass concentration returned by simulation
% S_actual = substrate concentration returned by simulation
% F = feed rate
% N_t = number of non-dimensionalized time points

global X_actual S_actual F


if length(w_vector) ~= 14
    error('w_vector must have length of 14');
end


N_t = length(X_actual);

W1 = [w_vector(1:4); w_vector(5:8)];
W2 = [w_vector(9:11); w_vector(12:14)];

X(1) = 0.5;
S(1) = 0.5;

for t = 2:N_t;
    Z0 = [F; X(t-1); S(t-1); 1];
    
    Z1 = W1*Z0;
    
    L2 = [1./(1+exp(-Z1)); 1];
    
    Z2 = W2*L2;
    
    L3 = 1./(1+exp(-Z2));
    X(t) = L3(1); S(t) = L3(2);
    
    err(1, t) = X(t) - X_actual(t); 
    err(2, t) = S(t) - S_actual(t);
    
end

end