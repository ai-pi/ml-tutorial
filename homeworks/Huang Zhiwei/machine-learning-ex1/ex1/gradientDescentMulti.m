function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
m = length(y); 
J_history = zeros(num_iters, 1);

for iter = 1:num_iters
h = X*theta;
errors = (h-y);
sums = X'*errors;
delta = 1/m*sums;
theta = theta - alpha*delta;

J_history(iter) = (X*theta-y)'*(X*theta-y)/(2*m);

end
end
